import crypto from "crypto";

export interface ChunkData {
  title: string;
  content: string;
  contentHash: string;
}

const MIN_CHUNK_WORDS = 50;

/**
 * Split a markdown document into chunks based on ## (h2) headings.
 * Small chunks (<50 words) are merged into the previous chunk.
 */
export function chunkMarkdown(markdown: string): ChunkData[] {
  const lines = markdown.split("\n");
  const rawChunks: { title: string; lines: string[] }[] = [];
  let documentTitle = "";

  for (const line of lines) {
    // Capture the document title (h1) but don't create a chunk for it
    if (line.startsWith("# ") && !line.startsWith("## ")) {
      documentTitle = line.replace(/^#\s+/, "").trim();
      continue;
    }

    if (line.startsWith("## ")) {
      const title = line.replace(/^##\s+/, "").trim();
      rawChunks.push({ title, lines: [] });
    } else if (rawChunks.length > 0) {
      rawChunks[rawChunks.length - 1].lines.push(line);
    } else {
      // Content before any h2 — create an intro chunk
      if (rawChunks.length === 0 && line.trim()) {
        rawChunks.push({
          title: documentTitle || "Introduction",
          lines: [line],
        });
      } else if (rawChunks.length > 0) {
        rawChunks[rawChunks.length - 1].lines.push(line);
      }
    }
  }

  // Merge small chunks into previous
  const merged: { title: string; content: string }[] = [];
  for (const chunk of rawChunks) {
    const content = chunk.lines.join("\n").trim();
    const wordCount = content.split(/\s+/).filter(Boolean).length;

    if (wordCount < MIN_CHUNK_WORDS && merged.length > 0) {
      // Merge into previous chunk
      merged[merged.length - 1].content +=
        `\n\n## ${chunk.title}\n\n${content}`;
    } else {
      merged.push({
        title: chunk.title,
        content: content || "(No content)",
      });
    }
  }

  // If no chunks were created, treat the entire document as one chunk
  if (merged.length === 0) {
    merged.push({
      title: documentTitle || "Content",
      content: markdown.trim(),
    });
  }

  return merged.map((chunk) => ({
    title: chunk.title,
    content: chunk.content,
    contentHash: crypto
      .createHash("sha256")
      .update(chunk.content)
      .digest("hex")
      .slice(0, 16),
  }));
}

/**
 * Hash the entire source document to detect changes.
 */
export function hashDocument(content: string): string {
  return crypto
    .createHash("sha256")
    .update(content)
    .digest("hex")
    .slice(0, 16);
}
