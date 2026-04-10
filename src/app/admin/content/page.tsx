import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";
import { redirect } from "next/navigation";
import Link from "next/link";
import ContentActions from "./ContentActions";

export const dynamic = "force-dynamic";

export default async function ContentManagerPage() {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") redirect("/");

  const db = getServiceClient();

  // Fetch all modules (including inactive)
  const { data: modules } = await db
    .from("modules")
    .select("*")
    .order("title");

  // Count draft questions per module
  const draftCounts: Record<string, number> = {};
  if (modules) {
    for (const mod of modules) {
      const { count } = await db
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("status", "draft")
        .in(
          "chunk_id",
          (
            await db
              .from("chunks")
              .select("id")
              .eq("module_id", mod.id)
              .eq("is_active", true)
          ).data?.map((c) => c.id) || ["none"]
        );
      draftCounts[mod.id] = count || 0;
    }
  }

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-8">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-gray-900">Content Manager</h1>
        <ContentActions />
      </div>

      <div className="space-y-3">
        {(modules || []).map((mod) => (
          <div
            key={mod.id}
            className={`bg-white border rounded-lg p-5 ${
              mod.is_active ? "border-gray-200" : "border-gray-100 opacity-60"
            }`}
          >
            <div className="flex items-center justify-between">
              <div>
                <Link
                  href={`/admin/content/${mod.id}`}
                  className="text-lg font-semibold text-gray-900 hover:text-blue-600"
                >
                  {mod.title}
                </Link>
                <p className="text-sm text-gray-500 mt-1">
                  Source: {mod.source_filename} &middot; {mod.chunk_count}{" "}
                  chunks
                  {!mod.is_active && (
                    <span className="ml-2 text-red-500 font-medium">
                      (Inactive)
                    </span>
                  )}
                  {draftCounts[mod.id] > 0 && (
                    <span className="ml-2 text-amber-600 font-medium">
                      {draftCounts[mod.id]} draft questions
                    </span>
                  )}
                </p>
              </div>
              <div className="flex items-center gap-2">
                <SyncButton moduleId={mod.id} />
                <Link
                  href={`/admin/content/${mod.id}`}
                  className="px-3 py-1.5 text-sm bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
                >
                  Review
                </Link>
              </div>
            </div>
          </div>
        ))}
      </div>

      {(!modules || modules.length === 0) && (
        <p className="text-center py-8 text-gray-500">
          No modules yet. Add a module to get started.
        </p>
      )}
    </div>
  );
}

function SyncButton({ moduleId }: { moduleId: string }) {
  return (
    <form
      action={async () => {
        "use server";
        // Trigger sync via API
        const baseUrl = process.env.NEXTAUTH_URL || "http://localhost:3000";
        await fetch(`${baseUrl}/api/content/sync`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ moduleId }),
        });
      }}
    >
      <button
        type="submit"
        className="px-3 py-1.5 text-sm bg-blue-600 text-white rounded-lg hover:bg-blue-700"
      >
        Sync
      </button>
    </form>
  );
}
