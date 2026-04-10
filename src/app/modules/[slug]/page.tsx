import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import Link from "next/link";
import { notFound } from "next/navigation";

export const dynamic = "force-dynamic";

export default async function ModuleOverviewPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const session = await auth();
  if (!session?.user) return null;

  const db = getServiceClient();

  // Fetch module
  const { data: module } = await db
    .from("modules")
    .select("*")
    .eq("slug", slug)
    .eq("is_active", true)
    .single();

  if (!module) return notFound();

  // Fetch chunks
  const { data: chunks } = await db
    .from("chunks")
    .select("*")
    .eq("module_id", module.id)
    .eq("is_active", true)
    .order("chunk_index");

  // Fetch user progress for this module's chunks
  const chunkIds = (chunks || []).map((c) => c.id);
  const { data: progressData } = await db
    .from("progress")
    .select("chunk_id")
    .eq("user_id", session.user.id)
    .in("chunk_id", chunkIds.length > 0 ? chunkIds : ["none"]);

  const completedIds = new Set(
    (progressData || []).map((p) => p.chunk_id)
  );

  // Fetch best quiz scores
  const { data: attempts } = await db
    .from("quiz_attempts")
    .select("chunk_id, score, total")
    .eq("user_id", session.user.id)
    .in("chunk_id", chunkIds.length > 0 ? chunkIds : ["none"]);

  const bestScores: Record<string, { score: number; total: number }> = {};
  for (const attempt of attempts || []) {
    const existing = bestScores[attempt.chunk_id];
    if (!existing || attempt.score > existing.score) {
      bestScores[attempt.chunk_id] = {
        score: attempt.score,
        total: attempt.total,
      };
    }
  }

  const completedCount = (chunks || []).filter((c) =>
    completedIds.has(c.id)
  ).length;

  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-8">
      <Link
        href="/"
        className="text-sm text-blue-600 hover:text-blue-800 mb-4 inline-block"
      >
        &larr; All modules
      </Link>

      <h1 className="text-2xl font-bold text-gray-900">{module.title}</h1>
      {module.description && (
        <p className="mt-1 text-gray-600">{module.description}</p>
      )}
      <p className="mt-2 text-sm text-gray-500">
        {completedCount} of {(chunks || []).length} sections completed
      </p>

      <div className="mt-6 space-y-3">
        {(chunks || []).map((chunk, i) => {
          const isCompleted = completedIds.has(chunk.id);
          const best = bestScores[chunk.id];

          return (
            <Link
              key={chunk.id}
              href={`/modules/${slug}/${chunk.chunk_index}`}
              className="flex items-center gap-4 p-4 bg-white rounded-lg border border-gray-200 hover:border-blue-300 hover:shadow-sm transition-all"
            >
              <div
                className={`flex-shrink-0 w-8 h-8 rounded-full flex items-center justify-center text-sm font-medium ${
                  isCompleted
                    ? "bg-green-100 text-green-700"
                    : "bg-gray-100 text-gray-500"
                }`}
              >
                {isCompleted ? (
                  <svg
                    className="w-4 h-4"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M5 13l4 4L19 7"
                    />
                  </svg>
                ) : (
                  i + 1
                )}
              </div>
              <div className="flex-1 min-w-0">
                <p className="font-medium text-gray-900 truncate">
                  {chunk.title}
                </p>
              </div>
              {best && (
                <span className="text-sm text-gray-500 flex-shrink-0">
                  {best.score}/{best.total}
                </span>
              )}
            </Link>
          );
        })}
      </div>
    </div>
  );
}
