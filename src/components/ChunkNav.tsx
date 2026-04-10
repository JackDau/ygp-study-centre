"use client";

import Link from "next/link";

interface Props {
  moduleSlug: string;
  currentIndex: number;
  totalChunks: number;
}

export default function ChunkNav({
  moduleSlug,
  currentIndex,
  totalChunks,
}: Props) {
  const hasPrev = currentIndex > 0;
  const hasNext = currentIndex < totalChunks - 1;

  return (
    <div className="flex items-center justify-between pt-6 border-t border-gray-200">
      {hasPrev ? (
        <Link
          href={`/modules/${moduleSlug}/${currentIndex - 1}`}
          className="flex items-center gap-2 text-blue-600 hover:text-blue-800 font-medium"
        >
          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
          </svg>
          Previous
        </Link>
      ) : (
        <div />
      )}

      <Link
        href={`/modules/${moduleSlug}`}
        className="text-sm text-gray-500 hover:text-gray-700"
      >
        Back to module
      </Link>

      {hasNext ? (
        <Link
          href={`/modules/${moduleSlug}/${currentIndex + 1}`}
          className="flex items-center gap-2 text-blue-600 hover:text-blue-800 font-medium"
        >
          Next
          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
          </svg>
        </Link>
      ) : (
        <div />
      )}
    </div>
  );
}
