---
description: Deploy to production via Docker, Railway, Fly.io, or Vercel.
agent: devops
---

You are deploying this project to production.

## Process
1. **Detect project type** — Check for Docker, package.json, pyproject.toml, Cargo.toml
2. **Run pre-deploy checks**
   - All tests pass
   - Linter passes
   - Build succeeds
3. **Choose deployment target**
   - `--railway`: Deploy to Railway
   - `--fly`: Deploy to Fly.io
   - `--vercel`: Deploy to Vercel (Next.js frontend)
   - `--docker`: Deploy via Docker Compose (self-hosted)
   - Default: detect from existing config (railway.json, fly.toml, vercel.json, docker-compose.yml)

4. **Set environment variables**
   - Check which env vars are needed
   - Remind user to set production secrets
   
5. **Deploy**
   - Run the appropriate deploy command
   - Print the production URL

6. **Post-deploy**
   - Verify the app is running
   - Check health endpoint
   - Print monitoring URLs
