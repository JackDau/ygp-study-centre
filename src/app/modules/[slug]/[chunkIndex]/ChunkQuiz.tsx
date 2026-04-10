"use client";

import { useState } from "react";
import Quiz from "@/components/Quiz";
import type { Question } from "@/lib/types";

export default function ChunkQuiz({
  questions,
  chunkId,
}: {
  questions: Question[];
  chunkId: string;
}) {
  const [result, setResult] = useState<{
    score: number;
    total: number;
  } | null>(null);

  return (
    <>
      <Quiz
        questions={questions}
        chunkId={chunkId}
        onComplete={(score, total) => setResult({ score, total })}
      />
      {result && (
        <div className="mt-4 p-4 bg-blue-50 rounded-lg text-center">
          <p className="text-blue-900 font-medium">
            Section complete! Score: {result.score}/{result.total}
          </p>
        </div>
      )}
    </>
  );
}
