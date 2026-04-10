"use client";

import { useState } from "react";
import type { Question } from "@/lib/types";

interface Props {
  question: Question;
  index: number;
  onAnswer: (questionId: string, selectedIndex: number) => void;
  showResult: boolean;
}

export default function QuizQuestion({
  question,
  index,
  onAnswer,
  showResult,
}: Props) {
  const [selected, setSelected] = useState<number | null>(null);

  const handleSelect = (optionIndex: number) => {
    if (showResult) return;
    setSelected(optionIndex);
    onAnswer(question.id, optionIndex);
  };

  return (
    <div className="bg-white border border-gray-200 rounded-lg p-5">
      <p className="font-medium text-gray-900 mb-3">
        {index + 1}. {question.question_text}
      </p>
      <div className="space-y-2">
        {question.options.map((option, i) => {
          let optionStyle = "border-gray-200 hover:border-blue-300 bg-white";
          if (selected === i && !showResult) {
            optionStyle = "border-blue-500 bg-blue-50";
          }
          if (showResult && i === question.correct_index) {
            optionStyle = "border-green-500 bg-green-50";
          }
          if (showResult && selected === i && i !== question.correct_index) {
            optionStyle = "border-red-500 bg-red-50";
          }

          return (
            <button
              key={i}
              onClick={() => handleSelect(i)}
              disabled={showResult}
              className={`w-full text-left p-3 rounded-lg border transition-colors ${optionStyle} disabled:cursor-default`}
            >
              <span className="text-sm text-gray-500 mr-2">
                {String.fromCharCode(65 + i)}.
              </span>
              <span className="text-gray-800">{option}</span>
            </button>
          );
        })}
      </div>
      {showResult && question.explanation && (
        <p className="mt-3 text-sm text-gray-600 bg-gray-50 p-3 rounded-lg">
          {question.explanation}
        </p>
      )}
    </div>
  );
}
