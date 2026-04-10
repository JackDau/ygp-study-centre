import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import { notFound } from "next/navigation";
import MarkdownRenderer from "@/components/MarkdownRenderer";
import ChunkNav from "@/components/ChunkNav";
import ChunkQuiz from "./ChunkQuiz";

export const dynamic = "force-dynamic";

export default async function ChunkReaderPage({
  params,
}: {
  params: Promise<{ slug: string; chunkIndex: string }>;
}) {
  const { slug, chunkIndex } = await params;
  const session = await auth();
  if (!session?.user) return null;

  const db = getServiceClient();
  const index = parseInt(chunkIndex, 10);

  // Fetch module
  const { data: module } = await db
    .from("modules")
    .select("*")
    .eq("slug", slug)
    .eq("is_active", true)
    .single();

  if (!module) return notFound();

  // Fetch this chunk
  const { data: chunk } = await db
    .from("chunks")
    .select("*")
    .eq("module_id", module.id)
    .eq("chunk_index", index)
    .eq("is_active", true)
    .single();

  if (!chunk) return notFound();

  // Fetch live questions for this chunk
  const { data: questions } = await db
    .from("questions")
    .select("*")
    .eq("chunk_id", chunk.id)
    .eq("status", "live")
    .order("created_at");

  // Get total chunk count for nav
  const { count: totalChunks } = await db
    .from("chunks")
    .select("*", { count: "exact", head: true })
    .eq("module_id", module.id)
    .eq("is_active", true);

  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-8">
      <p className="text-sm text-gray-500 mb-1">{module.title}</p>
      <h1 className="text-2xl font-bold text-gray-900 mb-6">{chunk.title}</h1>

      <MarkdownRenderer content={chunk.content} />

      <div className="mt-10 pt-8 border-t border-gray-200">
        <ChunkQuiz questions={questions || []} chunkId={chunk.id} />
      </div>

      <div className="mt-8">
        <ChunkNav
          moduleSlug={slug}
          currentIndex={index}
          totalChunks={totalChunks || 0}
        />
      </div>
    </div>
  );
}
