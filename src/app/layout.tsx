import type { Metadata } from "next";
import "./globals.css";
import { auth } from "@/lib/auth";
import NavBar from "@/components/NavBar";

export const metadata: Metadata = {
  title: "YourGP Study Centre",
  description:
    "Learn about YourGP's values, leadership standards, and organisational goals.",
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const session = await auth();

  return (
    <html lang="en" className="h-full antialiased">
      <body className="min-h-full flex flex-col bg-gray-50">
        {session?.user && <NavBar user={session.user} />}
        <main className="flex-1">{children}</main>
      </body>
    </html>
  );
}
