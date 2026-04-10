"use client";

import { useState } from "react";
import QuizQuestion from "./QuizQuestion";
import type { Question } from "@/lib/types";

interface Props {
  questions: Question[];
  chunkId: string;
  onComplete: (score: number, total: number) => void;
}

export default function Quiz({ questions, chunkId, onComplete }: Props) {
  const [answers, setAnswers] = useState<
    Record<string, number>
  >({});
  const [showResults, setShowResults] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  const handleAnswer = (questionId: string, selectedIndex: number) => {
    setAnswers((prev) => ({ ...prev, [questionId]: selectedIndex }));
  };

  const allAnswered = questions.every((q) => answers[q.id] !== undefined);

  const handleSubmit = async () => {
    if (!allAnswered || submitting) return;
    setSubmitting(true);

    const score = questions.filter(
      (q) => answers[q.id] === q.correct_index
    ).length;
    const total = questions.length;

    const answerDetails = questions.map((q) => ({
      questionId: q.id,
      selectedIndex: answers[q.id],
      correct: answers[q.id] === q.correct_index,
    }));

    try {
      // Record quiz attempt
      await fetch("/api/quiz", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ chunkId, score, total, answers: answerDetails }),
      });

      // Mark chunk as completed
      await fetch("/api/progress", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ chunkId }),
      });
    } catch (err) {
      console.error("Failed to submit quiz:", err);
    }

    setShowResults(true);
    setSubmitting(false);
    onComplete(score, total);
  };

  if (questions.length === 0) {
    return (
      <div className="text-center py-8 text-gray-500">
        <p>No quiz questions available for this section yet.</p>
        <p className="text-sm mt-1">Questions are being prepared by the admin.</p>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <h3 className="text-lg font-semibold text-gray-900">
        Check Your Understanding
      </h3>
      {questions.map((q, i) => (
        <QuizQuestion
          key={q.id}
          question={q}
          index={i}
          onAnswer={handleAnswer}
          showResult={showResults}
        />
      ))}

      {showResults ? (
        <div className="text-center py-4">
          <p className="text-lg font-semibold text-gray-900">
            You scored{" "}
            {questions.filter((q) => answers[q.id] === q.correct_index).length}{" "}
            out of {questions.length}
          </p>
          <p className="text-sm text-gray-500 mt-1">
            You can retake this quiz anytime by revisiting this section.
          </p>
        </div>
      ) : (
        <button
          onClick={handleSubmit}
          disabled={!allAnswered || submitting}
          className="w-full py-3 px-4 bg-blue-600 text-white rounded-lg font-medium hover:bg-blue-700 disabled:bg-gray-300 disabled:cursor-not-allowed transition-colors"
        >
          {submitting ? "Submitting..." : "Submit Answers"}
        </button>
      )}
    </div>
  );
}
