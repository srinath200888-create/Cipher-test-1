---
description: Recommend the optimal tech stack for a given project idea.
agent: architect
---

You are recommending a tech stack based on project requirements.

## Input
$ARGUMENTS

## Process
1. **Analyze the project idea**
   - What type of app? (desktop, web, mobile, CLI, API, AI)
   - Who is the user? (consumer, enterprise, developer)
   - What are the key features?
   - Performance requirements?
   - Deployment requirements?

2. **Recommend stack**
   - Primary frameworks
   - Database
   - UI library
   - State management
   - Testing
   - Deployment
   - Alternative options

3. **Justify each choice**
   - Why this technology over alternatives
   - Trade-offs and considerations

4. **Provide starter template**
   - Which command to run (new-desktop-app, new-web-app, etc.)
   - Key resources and documentation links

## Stack Templates

### Desktop App
- **Recommended**: Tauri v2 + React 19 + shadcn/ui + Zustand + SQLite
- **Alternative**: Nucleus (Kotlin + Compose) for native JVM apps

### Full-Stack Web App
- **Recommended**: FastAPI + Next.js + PostgreSQL + Drizzle ORM + shadcn/ui
- **Alternative**: NestJS + Next.js + Prisma (all TypeScript)

### Mobile App
- **Recommended**: Expo + React Native + Expo Router + Zustand
- **Alternative**: Flutter for custom UI / cross-platform consistency

### AI/ML Service
- **Recommended**: FastAPI + LangChain + ChromaDB + Ollama
- **Alternative**: LlamaIndex + Qdrant for better retrieval

### CLI Tool
- **Recommended**: Rust + clap + anyhow (single binary)
- **Alternative**: Python + typer + rich (rapid development)
