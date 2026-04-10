export interface Module {
  id: string;
  slug: string;
  title: string;
  description: string | null;
  source_filename: string;
  source_hash: string | null;
  chunk_count: number;
  is_active: boolean;
  updated_at: string;
  created_at: string;
}

export interface Chunk {
  id: string;
  module_id: string;
  chunk_index: number;
  title: string;
  content: string;
  content_hash: string | null;
  is_active: boolean;
  created_at: string;
}

export interface Question {
  id: string;
  chunk_id: string;
  question_text: string;
  question_type: "mcq";
  options: string[];
  correct_index: number;
  explanation: string | null;
  status: "draft" | "live" | "archived";
  created_at: string;
}

export interface User {
  id: string;
  email: string;
  name: string;
  entra_id: string;
  role: "staff" | "admin";
  created_at: string;
}

export interface Progress {
  id: string;
  user_id: string;
  chunk_id: string;
  completed_at: string;
}

export interface QuizAttempt {
  id: string;
  user_id: string;
  chunk_id: string;
  score: number;
  total: number;
  answers: { questionId: string; selectedIndex: number; correct: boolean }[];
  attempted_at: string;
}

// Extended types for UI
export interface ModuleWithProgress extends Module {
  completedChunks: number;
  totalChunks: number;
}

export interface ChunkWithQuestions extends Chunk {
  questions: Question[];
  isCompleted: boolean;
}
