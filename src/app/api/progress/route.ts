import { NextRequest, NextResponse } from "next/server";
import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";

export async function POST(request: NextRequest) {
  const session = await auth();
  if (!session?.user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const { chunkId } = await request.json();
  if (!chunkId) {
    return NextResponse.json(
      { error: "chunkId is required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();
  const { error } = await db.from("progress").upsert(
    {
      user_id: session.user.id,
      chunk_id: chunkId,
    },
    { onConflict: "user_id,chunk_id" }
  );

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}

export async function GET() {
  const session = await auth();
  if (!session?.user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const db = getServiceClient();
  const { data, error } = await db
    .from("progress")
    .select("chunk_id, completed_at")
    .eq("user_id", session.user.id);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json(data);
}
