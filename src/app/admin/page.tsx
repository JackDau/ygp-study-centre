import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import { redirect } from "next/navigation";

export const dynamic = "force-dynamic";

export default async function AdminDashboardPage() {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") redirect("/");

  const db = getServiceClient();

  // Fetch all staff users
  const { data: users } = await db
    .from("users")
    .select("*")
    .order("name");

  // Fetch all active modules
  const { data: modules } = await db
    .from("modules")
    .select("*")
    .eq("is_active", true)
    .order("title");

  // Fetch all active chunks
  const { data: allChunks } = await db
    .from("chunks")
    .select("id, module_id")
    .eq("is_active", true);

  // Fetch all progress records
  const { data: allProgress } = await db.from("progress").select("*");

  // Fetch all quiz attempts
  const { data: allAttempts } = await db.from("quiz_attempts").select("*");

  // Build per-user, per-module stats
  const chunksByModule: Record<string, string[]> = {};
  for (const chunk of allChunks || []) {
    if (!chunksByModule[chunk.module_id]) {
      chunksByModule[chunk.module_id] = [];
    }
    chunksByModule[chunk.module_id].push(chunk.id);
  }

  const progressByUser: Record<string, Set<string>> = {};
  for (const p of allProgress || []) {
    if (!progressByUser[p.user_id]) {
      progressByUser[p.user_id] = new Set();
    }
    progressByUser[p.user_id].add(p.chunk_id);
  }

  // Best score per user per module
  const bestScoresByUser: Record<
    string,
    Record<string, { score: number; total: number }>
  > = {};
  for (const a of allAttempts || []) {
    if (!bestScoresByUser[a.user_id]) {
      bestScoresByUser[a.user_id] = {};
    }
    // Find which module this chunk belongs to
    const moduleId = (allChunks || []).find(
      (c) => c.id === a.chunk_id
    )?.module_id;
    if (!moduleId) continue;

    const existing = bestScoresByUser[a.user_id][moduleId];
    if (!existing) {
      bestScoresByUser[a.user_id][moduleId] = {
        score: a.score,
        total: a.total,
      };
    } else {
      bestScoresByUser[a.user_id][moduleId] = {
        score: existing.score + a.score,
        total: existing.total + a.total,
      };
    }
  }

  return (
    <div className="max-w-6xl mx-auto px-4 sm:px-6 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">
        Staff Progress Dashboard
      </h1>

      <div className="overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200 rounded-lg">
          <thead>
            <tr className="bg-gray-50">
              <th className="px-4 py-3 text-left text-sm font-semibold text-gray-900 border-b">
                Name
              </th>
              {(modules || []).map((mod) => (
                <th
                  key={mod.id}
                  className="px-4 py-3 text-center text-sm font-semibold text-gray-900 border-b"
                >
                  {mod.title}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {(users || []).map((user) => {
              const userProgress = progressByUser[user.id] || new Set();

              return (
                <tr key={user.id} className="border-b border-gray-100">
                  <td className="px-4 py-3 text-sm text-gray-900">
                    <div>{user.name}</div>
                    <div className="text-xs text-gray-500">{user.email}</div>
                  </td>
                  {(modules || []).map((mod) => {
                    const moduleChunkIds = chunksByModule[mod.id] || [];
                    const completed = moduleChunkIds.filter((id) =>
                      userProgress.has(id)
                    ).length;
                    const total = moduleChunkIds.length;
                    const pct =
                      total > 0 ? Math.round((completed / total) * 100) : 0;

                    return (
                      <td
                        key={mod.id}
                        className="px-4 py-3 text-center text-sm"
                      >
                        <div
                          className={`font-medium ${
                            pct === 100
                              ? "text-green-700"
                              : pct > 0
                                ? "text-blue-600"
                                : "text-gray-400"
                          }`}
                        >
                          {pct}%
                        </div>
                        <div className="text-xs text-gray-400">
                          {completed}/{total}
                        </div>
                      </td>
                    );
                  })}
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>

      {(!users || users.length === 0) && (
        <p className="text-center py-8 text-gray-500">
          No staff members have signed in yet.
        </p>
      )}
    </div>
  );
}
