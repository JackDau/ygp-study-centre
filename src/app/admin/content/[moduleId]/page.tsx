import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import { redirect, notFound } from "next/navigation";
import Link from "next/link";
import QuestionReview from "./QuestionReview";
import ModuleActions from "./ModuleActions";

export const dynamic = "force-dynamic";

export default async function ModuleReviewPage({
  params,
}: {
  params: Promise<{ moduleId: string }>;
}) {
  const { moduleId } = await params;
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") redirect("/");

  const db = getServiceClient();

  const { data: module } = await db
    .from("modules")
    .select("*")
    .eq("id", moduleId)
    .single();

  if (!module) return notFound();

  // Fetch chunks with their questions
  const { data: chunks } = await db
    .from("chunks")
    .select("*")
    .eq("module_id", moduleId)
    .eq("is_active", true)
    .order("chunk_index");

  const chunkIds = (chunks || []).map((c) => c.id);
  const { data: questions } = await db
    .from("questions")
    .select("*")
    .in("chunk_id", chunkIds.length > 0 ? chunkIds : ["none"])
    .neq("status", "archived")
    .order("created_at");

  const questionsByChunk: Record<string, typeof questions> = {};
  for (const q of questions || []) {
    if (!questionsByChunk[q.chunk_id]) {
      questionsByChunk[q.chunk_id] = [];
    }
    questionsByChunk[q.chunk_id]!.push(q);
  }

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 py-8">
      <Link
        href="/admin/content"
        className="text-sm text-blue-600 hover:text-blue-800 mb-4 inline-block"
      >
        &larr; All modules
      </Link>

      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">{module.title}</h1>
          <p className="text-sm text-gray-500 mt-1">
            Source: {module.source_filename} &middot; {module.chunk_count} chunks
            {!module.is_active && (
              <span className="ml-2 text-red-500 font-medium">(Inactive)</span>
            )}
          </p>
        </div>
        <ModuleActions moduleId={module.id} isActive={module.is_active} title={module.title} />
      </div>

      <div className="space-y-6">
        {(chunks || []).map((chunk) => (
          <div
            key={chunk.id}
            className="bg-white border border-gray-200 rounded-lg overflow-hidden"
          >
            <div className="p-4 bg-gray-50 border-b border-gray-200">
              <h2 className="font-semibold text-gray-900">
                Section {chunk.chunk_index + 1}: {chunk.title}
              </h2>
              <p className="text-sm text-gray-500 mt-1">
                {chunk.content.split(/\s+/).length} words
              </p>
            </div>
            <div className="p-4">
              {questionsByChunk[chunk.id]?.length ? (
                <QuestionReview questions={questionsByChunk[chunk.id]!} />
              ) : (
                <p className="text-sm text-gray-400 italic">
                  No questions generated yet. Sync this module to generate
                  questions.
                </p>
              )}
            </div>
          </div>
        ))}
      </div>

      {(!chunks || chunks.length === 0) && (
        <p className="text-center py-8 text-gray-500">
          No chunks yet. Sync this module from the Content Manager.
        </p>
      )}
    </div>
  );
}
