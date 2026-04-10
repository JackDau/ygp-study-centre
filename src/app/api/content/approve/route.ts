import { NextRequest, NextResponse } from "next/server";
import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";

export async function POST(request: NextRequest) {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
  }

  const { questionIds, status } = await request.json();

  if (
    !Array.isArray(questionIds) ||
    !["live", "archived"].includes(status)
  ) {
    return NextResponse.json(
      { error: "questionIds (array) and status ('live' | 'archived') required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();
  const { error } = await db
    .from("questions")
    .update({ status })
    .in("id", questionIds);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ message: `Updated ${questionIds.length} questions to ${status}` });
}
