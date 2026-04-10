import { NextRequest, NextResponse } from "next/server";
import { auth } from "@/lib/auth";
import { getServiceClient } from "@/lib/supabase";

export async function POST(request: NextRequest) {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
  }

  const { title, slug, source_filename, description } = await request.json();

  if (!title || !slug || !source_filename) {
    return NextResponse.json(
      { error: "title, slug, and source_filename are required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();
  const { data, error } = await db
    .from("modules")
    .insert({
      title,
      slug,
      source_filename,
      description: description || null,
    })
    .select()
    .single();

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json(data);
}

export async function PATCH(request: NextRequest) {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
  }

  const { moduleId, is_active } = await request.json();
  if (!moduleId) {
    return NextResponse.json(
      { error: "moduleId is required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();
  const { error } = await db
    .from("modules")
    .update({ is_active })
    .eq("id", moduleId);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}

export async function DELETE(request: NextRequest) {
  const session = await auth();
  if (!session?.user || session.user.role !== "admin") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
  }

  const { moduleId } = await request.json();
  if (!moduleId) {
    return NextResponse.json(
      { error: "moduleId is required" },
      { status: 400 }
    );
  }

  const db = getServiceClient();

  // Delete cascades to chunks -> questions, and we clean up progress/attempts
  const { data: chunks } = await db
    .from("chunks")
    .select("id")
    .eq("module_id", moduleId);

  const chunkIds = (chunks || []).map((c) => c.id);

  if (chunkIds.length > 0) {
    await db.from("progress").delete().in("chunk_id", chunkIds);
    await db.from("quiz_attempts").delete().in("chunk_id", chunkIds);
  }

  const { error } = await db.from("modules").delete().eq("id", moduleId);

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }

  return NextResponse.json({ success: true });
}
