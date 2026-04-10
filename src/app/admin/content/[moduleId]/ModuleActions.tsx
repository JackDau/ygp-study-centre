"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

interface Props {
  moduleId: string;
  isActive: boolean;
  title: string;
}

export default function ModuleActions({ moduleId, isActive, title }: Props) {
  const router = useRouter();
  const [showDelete, setShowDelete] = useState(false);
  const [confirmText, setConfirmText] = useState("");
  const [loading, setLoading] = useState(false);

  const handleToggleActive = async () => {
    setLoading(true);
    await fetch("/api/admin/modules", {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ moduleId, is_active: !isActive }),
    });
    setLoading(false);
    router.refresh();
  };

  const handleDelete = async () => {
    if (confirmText !== title) return;
    setLoading(true);
    await fetch("/api/admin/modules", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ moduleId }),
    });
    router.push("/admin/content");
  };

  return (
    <div className="flex items-center gap-2">
      <button
        onClick={handleToggleActive}
        disabled={loading}
        className={`px-3 py-1.5 text-sm rounded-lg ${
          isActive
            ? "bg-amber-100 text-amber-700 hover:bg-amber-200"
            : "bg-green-100 text-green-700 hover:bg-green-200"
        }`}
      >
        {isActive ? "Deactivate" : "Reactivate"}
      </button>
      <button
        onClick={() => setShowDelete(true)}
        className="px-3 py-1.5 text-sm bg-red-100 text-red-700 rounded-lg hover:bg-red-200"
      >
        Delete
      </button>

      {showDelete && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-white rounded-xl p-6 max-w-md w-full mx-4">
            <h2 className="text-lg font-semibold text-red-700 mb-2">
              Delete Module
            </h2>
            <p className="text-sm text-gray-600 mb-4">
              This will permanently delete <strong>{title}</strong>, including
              all chunks, questions, progress records, and quiz attempts. This
              cannot be undone.
            </p>
            <p className="text-sm text-gray-600 mb-3">
              Type <strong>{title}</strong> to confirm:
            </p>
            <input
              type="text"
              value={confirmText}
              onChange={(e) => setConfirmText(e.target.value)}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg mb-4 focus:outline-none focus:ring-2 focus:ring-red-500"
            />
            <div className="flex gap-3">
              <button
                onClick={() => {
                  setShowDelete(false);
                  setConfirmText("");
                }}
                className="flex-1 px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
              >
                Cancel
              </button>
              <button
                onClick={handleDelete}
                disabled={confirmText !== title || loading}
                className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 disabled:bg-gray-300"
              >
                {loading ? "Deleting..." : "Delete Forever"}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
