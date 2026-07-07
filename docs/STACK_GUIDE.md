# Stack Decision Guide

## Decision Tree

```
What are you building?
├── Desktop app → Tauri v2 + React 19 + shadcn/ui + SQLite
│   └─ Kotlin/JVM team? → Nucleus + Compose
├── Web app (full-stack) → FastAPI + Next.js + PostgreSQL
│   └─ All-TypeScript team? → NestJS + Next.js + Prisma
├── Web app (frontend only) → Next.js + shadcn/ui
├── Mobile app → Expo + React Native
│   └─ Need custom UI/performance? → Flutter
├── CLI tool → Rust + clap
│   └─ Rapid development? → Python + typer + rich
├── API service → FastAPI
│   └─ High performance? → Axum (Rust)
├── AI/ML service → FastAPI + LangChain + ChromaDB + Ollama
│   └─ Scale? → Qdrant instead of ChromaDB
└── MCP server → Python + FastMCP
    └─ TypeScript ecosystem? → @modelcontextprotocol/sdk
```

## Stack Details

### Desktop: Tauri v2 + React 19 + shadcn/ui
```
Frontend: React 19, TypeScript, shadcn/ui, Tailwind v4
State: Zustand + TanStack Query
Backend: Tauri v2 (Rust), tauri-plugin-sql
Database: SQLite
Testing: Vitest + @testing-library/react
Build: cargo tauri build (cross-platform)
```

### Full-Stack Web: FastAPI + Next.js
```
Backend: FastAPI, SQLAlchemy/Drizzle, Pydantic, Alembic
Frontend: Next.js 16, React 19, shadcn/ui, Tailwind v4
Database: PostgreSQL
Auth: JWT with httponly cookies
Deploy: Docker + Railway or Fly.io
Testing: pytest (backend) + Vitest (frontend)
```

### Mobile: Expo + React Native
```
Framework: Expo SDK 52+
Navigation: Expo Router
State: Zustand + TanStack Query
Storage: MMKV + SecureStore
Native: expo-camera, expo-location, expo-notifications
Build: EAS Build
```

### CLI: Rust + clap
```
Parsing: clap (derive)
Errors: anyhow
Config: serde + toml
Progress: indicatif
Output: colored (manual) or termion
Build: cargo build --release
```
