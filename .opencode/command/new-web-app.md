---
description: Scaffold a FastAPI + Next.js full-stack web app with auth, WebSocket, and Docker.
agent: web-builder
---

You are scaffolding a full-stack web application.

## Requirements
- Project name: $ARGUMENTS
- Stack: FastAPI (Python) + Next.js 16 (TypeScript) + PostgreSQL + Drizzle ORM + shadcn/ui
- Auth: JWT with httponly cookies
- Deployment: Docker + docker-compose

## Steps

1. **Create project directory**
   - Name comes from first word of $ARGUMENTS
   - Structure: `project/backend/` and `project/frontend/`

2. **Set up FastAPI backend**
   - Create `backend/` with FastAPI, uvicorn, SQLAlchemy, pydantic, python-jose, passlib
   - Main app with CORS middleware, routers structure
   - Health check endpoint at `/api/health`

3. **Set up Next.js frontend**
   - `npx create-next-app@latest frontend --typescript --tailwind --app --src-dir`
   - Install shadcn/ui: `npx shadcn@latest init && npx shadcn@latest add button card input form toast`

4. **Set up database**
   - PostgreSQL with Drizzle ORM
   - User model with email + hashed password
   - Migration system

5. **Add authentication**
   - JWT access/refresh tokens
   - Login/register/session endpoints
   - httponly cookie-based auth for web
   - Middleware that checks auth on protected routes

6. **Add Docker**
   - Dockerfile for backend (Python multi-stage)
   - Dockerfile for frontend (Node multi-stage)
   - docker-compose.yml with backend + frontend + postgres

7. **Set up testing**
   - pytest for backend
   - Vitest + Testing Library for frontend

8. **Initialize git**
   - `git init && git add -A && git commit -m "Initial scaffold"`
