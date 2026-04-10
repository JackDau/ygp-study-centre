import { NextRequest, NextResponse } from "next/server";
import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import { chunkMarkdown, hashDocument } from "@/lib/chunker";
import { generateQuizQuestions } from "@/lib/quiz-generator";
import fs from "fs/promises";
import path from "path";

export async function POST(request: NextRequest) {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
  }

  const { moduleId } = await request.json();
  if (!moduleId) {
    return NextResponse.json(
      { error: "moduleId is required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();

  // Fetch the module
  const { data: module, error: moduleError } = await db
    .from("modules")
    .select("*")
    .eq("id", moduleId)
    .single();

  if (moduleError || !module) {
    return NextResponse.json({ error: "Module not found" }, { status: 404 });
  }

  // Read the source markdown file
  const contentDir = path.join(process.cwd(), "content");
  let markdown: string;
  try {
    markdown = await fs.readFile(
      path.join(contentDir, module.source_filename),
      "utf-8"
    );
  } catch {
    return NextResponse.json(
      { error: `Source file not found: ${module.source_filename}` },
      { status: 404 }
    );
  }

  const newHash = hashDocument(markdown);

  // Check if document has changed
  if (module.source_hash === newHash) {
    return NextResponse.json({
      message: "No changes detected",
      changed: false,
    });
  }

  // Chunk the document
  const chunks = chunkMarkdown(markdown);

  // Get existing chunks for comparison
  const { data: existingChunks } = await db
    .from("chunks")
    .select("*")
    .eq("module_id", moduleId)
    .eq("is_active", true)
    .order("chunk_index");

  // Archive all existing chunks that are no longer present
  if (existingChunks && existingChunks.length > 0) {
    const existingIds = existingChunks.map((c) => c.id);
    await db
      .from("chunks")
      .update({ is_active: false })
      .in("id", existingIds);
  }

  // Insert new chunks and generate questions
  let questionsGenerated = 0;
  for (let i = 0; i < chunks.length; i++) {
    const chunk = chunks[i];

    // Check if an existing chunk has the same content hash (unchanged)
    const existingMatch = existingChunks?.find(
      (ec) => ec.content_hash === chunk.contentHash
    );

    if (existingMatch) {
      // Reactivate unchanged chunk (keep its questions)
      await db
        .from("chunks")
        .update({ is_active: true, chunk_index: i })
        .eq("id", existingMatch.id);
    } else {
      // Insert new chunk
      const { data: newChunk } = await db
        .from("chunks")
        .insert({
          module_id: moduleId,
          chunk_index: i,
          title: chunk.title,
          content: chunk.content,
          content_hash: chunk.contentHash,
          is_active: true,
        })
        .select()
        .single();

      if (newChunk) {
        // Generate quiz questions for new/changed chunks
        try {
          const questions = await generateQuizQuestions(
            chunk.title,
            chunk.content,
            module.title
          );

          await db.from("questions").insert(
            questions.map((q) => ({
              chunk_id: newChunk.id,
              question_text: q.question_text,
              question_type: "mcq",
              options: q.options,
              correct_index: q.correct_index,
              explanation: q.explanation,
              status: "draft",
            }))
          );

          questionsGenerated += questions.length;
        } catch (err) {
          console.error(
            `Failed to generate questions for chunk "${chunk.title}":`,
            err
          );
        }
      }
    }
  }

  // Update module metadata
  await db
    .from("modules")
    .update({
      source_hash: newHash,
      chunk_count: chunks.length,
      updated_at: new Date().toISOString(),
    })
    .eq("id", moduleId);

  return NextResponse.json({
    message: "Sync complete",
    changed: true,
    chunksCreated: chunks.length,
    questionsGenerated,
  });
}
