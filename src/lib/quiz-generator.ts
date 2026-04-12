import Anthropic from "@anthropic-ai/sdk";

interface GeneratedQuestion {
  question_text: string;
  options: string[];
  correct_index: number;
  explanation: string;
}

/**
 * Generate quiz questions for a chunk of content using Claude API.
 * Returns 3 multiple-choice questions per chunk.
 * Throws a descriptive error if ANTHROPIC_API_KEY is not set.
 */
export async function generateQuizQuestions(
  chunkTitle: string,
  chunkContent: string,
  moduleTitle: string
): Promise<GeneratedQuestion[]> {
  if (!process.env.ANTHROPIC_API_KEY) {
    throw new Error(
      "ANTHROPIC_API_KEY is not set. Add it to .env.local to enable AI question generation."
    );
  }

  const client = new Anthropic();

  const response = await client.messages.create({
    model: "claude-sonnet-4-6",
    max_tokens: 2000,
    messages: [
      {
        role: "user",
        content: `You are generating quiz questions for a staff training module at YourGP, a general practice healthcare organisation in Canberra, Australia.

Module: "${moduleTitle}"
Section: "${chunkTitle}"

Content:
---
${chunkContent}
---

Generate exactly 3 multiple-choice questions that test understanding of this content. The questions should:
- Be clear and unambiguous
- Test comprehension, not just memorisation
- Be relevant to YourGP staff learning this material
- Have exactly 4 options each
- Have one clearly correct answer

Respond with ONLY a JSON array, no other text. Each item must have:
- "question_text": the question
- "options": array of exactly 4 answer strings
- "correct_index": index (0-3) of the correct option
- "explanation": brief explanation of why the correct answer is right`,
      },
    ],
  });

  const text =
    response.content[0].type === "text" ? response.content[0].text : "";

  // Extract JSON from the response (handle markdown code blocks)
  const jsonMatch = text.match(/\[[\s\S]*\]/);
  if (!jsonMatch) {
    throw new Error("Failed to parse quiz questions from Claude response");
  }

  const questions: GeneratedQuestion[] = JSON.parse(jsonMatch[0]);

  // Validate structure
  for (const q of questions) {
    if (
      !q.question_text ||
      !Array.isArray(q.options) ||
      q.options.length !== 4 ||
      typeof q.correct_index !== "number" ||
      q.correct_index < 0 ||
      q.correct_index > 3
    ) {
      throw new Error("Invalid question structure from Claude response");
    }
  }

  return questions;
}
