import NextAuth from "next-auth";
import MicrosoftEntraID from "next-auth/providers/microsoft-entra-id";
import { getServiceClient } from "./supabase";

export const { handlers, signIn, signOut, auth } = NextAuth({
  providers: [
    MicrosoftEntraID({
      clientId: process.env.AZURE_AD_CLIENT_ID!,
      clientSecret: process.env.AZURE_AD_CLIENT_SECRET!,
      issuer: `https://login.microsoftonline.com/${process.env.AZURE_AD_TENANT_ID}/v2.0`,
    }),
  ],
  callbacks: {
    async signIn({ user, account }) {
      if (!user.email || !account) return false;

      // Upsert user into Supabase on sign-in
      const db = getServiceClient();
      const { error } = await db.from("users").upsert(
        {
          email: user.email,
          name: user.name || user.email,
          entra_id: account.providerAccountId,
        },
        { onConflict: "entra_id" }
      );

      if (error) {
        console.error("Failed to upsert user:", error);
        return false;
      }

      return true;
    },
    async session({ session }) {
      if (session.user?.email) {
        // Fetch the Supabase user to get role and id
        const db = getServiceClient();
        const { data } = await db
          .from("users")
          .select("id, role")
          .eq("email", session.user.email)
          .single();

        if (data) {
          session.user.id = data.id;
          session.user.role = data.role;
        }
      }
      return session;
    },
  },
  pages: {
    signIn: "/auth/signin",
  },
});
