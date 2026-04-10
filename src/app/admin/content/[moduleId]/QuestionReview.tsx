"use client";

import { useState } from "react";

interface Question {
  id: string;
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string | null;
  status: string;
}

export default function QuestionReview({
  questions,
}: {
  questions: Question[];
}) {
  const [statuses, setStatuses] = useState<Record<string, string>>(
    Object.fromEntries(questions.map((q) => [q.id, q.status]))
  );
  const [saving, setSaving] = useState(false);

  const handleApprove = async (ids: string[], status: "live" | "archived") => {
    setSaving(true);
    try {
      const res = await fetch("/api/content/approve", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ questionIds: ids, status }),
      });

      if (res.ok) {
        setStatuses((prev) => {
          const updated = { ...prev };
          for (const id of ids) {
            updated[id] = status;
          }
          return updated;
        });
      }
    } finally {
      setSaving(false);
    }
  };

  const draftIds = questions
    .filter((q) => statuses[q.id] === "draft")
    .map((q) => q.id);

  return (
    <div className="space-y-3">
      {draftIds.length > 0 && (
        <div className="flex gap-2 mb-3">
          <button
            onClick={() => handleApprove(draftIds, "live")}
            disabled={saving}
            className="px-3 py-1.5 text-sm bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:bg-gray-300"
          >
            Approve All Draft ({draftIds.length})
          </button>
        </div>
      )}

      {questions.map((q, i) => (
        <div key={q.id} className="border border-gray-100 rounded-lg p-3">
          <div className="flex items-start justify-between gap-3">
            <div className="flex-1">
              <p className="font-medium text-gray-900 text-sm">
                {i + 1}. {q.question_text}
              </p>
              <div className="mt-2 space-y-1">
                {q.options.map((opt, oi) => (
                  <p
                    key={oi}
                    className={`text-sm ${
                      oi === q.correct_index
                        ? "text-green-700 font-medium"
                        : "text-gray-600"
                    }`}
                  >
                    {String.fromCharCode(65 + oi)}. {opt}
                    {oi === q.correct_index && " (correct)"}
                  </p>
                ))}
              </div>
              {q.explanation && (
                <p className="text-xs text-gray-500 mt-1">
                  Explanation: {q.explanation}
                </p>
              )}
            </div>
            <div className="flex items-center gap-2 flex-shrink-0">
              <span
                className={`text-xs px-2 py-0.5 rounded-full font-medium ${
                  statuses[q.id] === "live"
                    ? "bg-green-100 text-green-700"
                    : statuses[q.id] === "draft"
                      ? "bg-amber-100 text-amber-700"
                      : "bg-gray-100 text-gray-500"
                }`}
              >
                {statuses[q.id]}
              </span>
              {statuses[q.id] === "draft" && (
                <>
                  <button
                    onClick={() => handleApprove([q.id], "live")}
                    disabled={saving}
                    className="text-xs px-2 py-1 bg-green-100 text-green-700 rounded hover:bg-green-200"
                  >
                    Approve
                  </button>
                  <button
                    onClick={() => handleApprove([q.id], "archived")}
                    disabled={saving}
                    className="text-xs px-2 py-1 bg-red-100 text-red-700 rounded hover:bg-red-200"
                  >
                    Reject
                  </button>
                </>
              )}
            </div>
          </div>
        </div>
      ))}
    </div>
  );
}
