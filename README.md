# YourGP Study Centre

A web-based learning platform for the YourGP team (~85 people). Organisational documents become learning modules with reading material, inline quizzes, and progress tracking.

## Tech Stack

- **Next.js 16** (App Router, TypeScript, Tailwind CSS)
- **NextAuth v5** with Microsoft Entra ID (M365 SSO)
- **Supabase** (Postgres) for users, content, progress, and quiz data
- **Claude API** for quiz question generation

## Setup

1. Copy `.env.local.example` to `.env.local` and fill in all values
2. Run the SQL migration in `supabase/migrations/001_initial_schema.sql` against your Supabase project
3. `npm install && npm run dev`

### Required Environment Variables

| Variable | Description |
|----------|-------------|
| `AZURE_AD_CLIENT_ID` | Azure AD app registration client ID |
| `AZURE_AD_CLIENT_SECRET` | Azure AD app registration client secret |
| `AZURE_AD_TENANT_ID` | YourGP Azure AD tenant ID |
| `NEXTAUTH_URL` | App URL (e.g. `http://localhost:3000`) |
| `NEXTAUTH_SECRET` | Random secret (`openssl rand -base64 32`) |
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase project URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase anon/public key |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase service role key |
| `ANTHROPIC_API_KEY` | Anthropic API key for quiz generation |

## Admin Setup

After first sign-in, set your user's role to `admin` in the Supabase `users` table:

```sql
UPDATE users SET role = 'admin' WHERE email = 'your.email@yourgp.com.au';
```

Then use the Content Manager (`/admin/content`) to add modules and sync content.

## Content Management

Source markdown files live in the `content/` directory. To add or update a module:

1. Add/edit the `.md` file in `content/`
2. Go to `/admin/content` and click **Sync** (or **Add Module** for new docs)
3. Review and approve generated quiz questions before they go live
