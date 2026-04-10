import Link from "next/link";
import { signOut } from "@/lib/auth";

interface Props {
  user: {
    name: string;
    email: string;
    role: string;
  };
}

export default function NavBar({ user }: Props) {
  return (
    <nav className="bg-white border-b border-gray-200">
      <div className="max-w-5xl mx-auto px-4 sm:px-6">
        <div className="flex items-center justify-between h-14">
          <div className="flex items-center gap-6">
            <Link href="/" className="font-bold text-gray-900">
              YourGP Study Centre
            </Link>
            {user.role === "admin" && (
              <div className="hidden sm:flex items-center gap-4">
                <Link
                  href="/admin"
                  className="text-sm text-gray-600 hover:text-gray-900"
                >
                  Dashboard
                </Link>
                <Link
                  href="/admin/content"
                  className="text-sm text-gray-600 hover:text-gray-900"
                >
                  Content
                </Link>
              </div>
            )}
          </div>
          <div className="flex items-center gap-4">
            <span className="text-sm text-gray-500 hidden sm:inline">
              {user.name}
            </span>
            <form
              action={async () => {
                "use server";
                await signOut({ redirectTo: "/auth/signin" });
              }}
            >
              <button
                type="submit"
                className="text-sm text-gray-500 hover:text-gray-700"
              >
                Sign out
              </button>
            </form>
          </div>
        </div>
      </div>
    </nav>
  );
}
