import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import ModuleCard from "@/components/ModuleCard";
import type { ModuleWithProgress } from "@/lib/types";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  const session = await auth();
  if (!session?.user) return null;

  const db = getServiceClient();

  // Fetch active modules
  const { data: modules } = await db
    .from("modules")
    .select("*")
    .eq("is_active", true)
    .order("title");

  // Fetch user's progress
  const { data: progressData } = await db
    .from("progress")
    .select("chunk_id")
    .eq("user_id", session.user.id);

  const completedChunkIds = new Set(
    (progressData || []).map((p) => p.chunk_id)
  );

  // Fetch all active chunks to map progress per module
  const { data: allChunks } = await db
    .from("chunks")
    .select("id, module_id")
    .eq("is_active", true);

  const modulesWithProgress: ModuleWithProgress[] = (modules || []).map(
    (mod) => {
      const moduleChunks = (allChunks || []).filter(
        (c) => c.module_id === mod.id
      );
      const completedCount = moduleChunks.filter((c) =>
        completedChunkIds.has(c.id)
      ).length;

      return {
        ...mod,
        completedChunks: completedCount,
        totalChunks: moduleChunks.length,
      };
    }
  );

  const totalCompleted = modulesWithProgress.reduce(
    (sum, m) => sum + m.completedChunks,
    0
  );
  const totalChunks = modulesWithProgress.reduce(
    (sum, m) => sum + m.totalChunks,
    0
  );

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-8">
      <div className="mb-8">
        <h1 className="text-2xl font-bold text-gray-900">
          Welcome, {session.user.name?.split(" ")[0]}
        </h1>
        <p className="mt-1 text-gray-600">
          {totalChunks > 0 ? (
            <>
              You&apos;ve completed {totalCompleted} of {totalChunks} sections
              across all modules.
            </>
          ) : (
            <>Your learning modules will appear here once content is synced.</>
          )}
        </p>
      </div>

      {modulesWithProgress.length > 0 ? (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {modulesWithProgress.map((module) => (
            <ModuleCard key={module.id} module={module} />
          ))}
        </div>
      ) : (
        <div className="text-center py-16 text-gray-500">
          <p className="text-lg">No modules available yet.</p>
          <p className="text-sm mt-1">
            Ask an admin to sync content from the source documents.
          </p>
        </div>
      )}
    </div>
  );
}
