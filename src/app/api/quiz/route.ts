import { NextRequest, NextResponse } from "next/server";
import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";

export async function POST(request: NextRequest) {
  const session = await auth();
  if (!session?.user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const { chunkId, score, total, answers } = await request.json();
  if (!chunkId || score === undefined || !total || !answers) {
    return NextResponse.json(
      { error: "chunkId, score, total, and answers are required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();
  const { error } = await db.from("quiz_attempts").insert({
    user_id: session.user.id,
    chunk_id: chunkId,
    score,
    total,
    answers,
  });

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
