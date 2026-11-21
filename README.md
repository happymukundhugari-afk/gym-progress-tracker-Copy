# Gym Progress Tracker — Android PWA

## Included
- Mobile-first 5-day attendance and monthly calendar
- Workout logs with focus, duration, exercises, sets/reps/load and notes
- Body-weight history
- Monthly session, workout-time and weekly attendance analytics
- Local-first storage, offline app shell, JSON backup/restore
- Optional Supabase email/password cloud sync

## Activate cloud sync (required for sharing data across devices)
1. Create a project at https://supabase.com/
2. In Project Settings → API, copy the Project URL and **public anon/publishable key**.
3. In Supabase SQL Editor, run `supabase-schema.sql`.
4. Enable Email authentication under Authentication → Providers.
5. Host this folder over HTTPS (Netlify, Cloudflare Pages or GitHub Pages).
6. Open the app on your phone → Insights → Cloud sync. Enter URL/key, save, create an account or sign in.
7. Repeat on other devices using the same account.

Never put a Supabase `service_role` key in this frontend. The included row-level security policies restrict users to their own data.

## Install on Android
Open the HTTPS URL in Chrome → menu → **Install app** or **Add to Home screen**.

## Offline behavior and limits
The app shell is cached after the first online load. Entries are stored immediately on the current device. When signed in, changes try to sync while online and retry on the next online event. Open the app while online after offline use to sync.
This starter stores all account data in one row and uses last-write-wins. Avoid editing on multiple devices while both are offline. Export backups regularly. It does not guarantee background sync while the app is closed.

## Local preview
Serve this directory using a local web server (for example `python -m http.server 8000`) and open `http://localhost:8000`. PWA install requires HTTPS except localhost.
