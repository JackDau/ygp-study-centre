"use client";

import Link from "next/link";
import ProgressRing from "./ProgressRing";
import type { ModuleWithProgress } from "@/lib/types";

export default function ModuleCard({ module }: { module: ModuleWithProgress }) {
  const progress =
    module.totalChunks > 0
      ? Math.round((module.completedChunks / module.totalChunks) * 100)
      : 0;

  return (
    <Link
      href={`/modules/${module.slug}`}
      className="block bg-white rounded-xl border border-gray-200 p-6 hover:shadow-md hover:border-blue-300 transition-all"
    >
      <div className="flex items-start justify-between">
        <div className="flex-1 min-w-0">
          <h3 className="text-lg font-semibold text-gray-900 truncate">
            {module.title}
          </h3>
          {module.description && (
            <p className="mt-1 text-sm text-gray-500 line-clamp-2">
              {module.description}
            </p>
          )}
          <p className="mt-3 text-sm text-gray-400">
            {module.totalChunks} section{module.totalChunks !== 1 ? "s" : ""}
            {module.completedChunks > 0 && (
              <span className="text-blue-600 font-medium">
                {" "}
                &middot; {module.completedChunks} completed
              </span>
            )}
          </p>
        </div>
        <div className="ml-4 flex-shrink-0 relative">
          <ProgressRing progress={progress} />
          <span className="absolute inset-0 flex items-center justify-center text-xs font-semibold text-gray-700">
            {progress}%
          </span>
        </div>
      </div>
    </Link>
  );
}
