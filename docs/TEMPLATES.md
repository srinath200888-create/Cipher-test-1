# Template Guide

## Overview

Cipher Knowledge includes command templates that scaffold new projects. These are triggered via slash commands:

| Command | Scaffolds | Status |
|---------|-----------|--------|
| `/new-desktop-app` | Tauri v2 + React + shadcn/ui desktop app | ✅ Agent-driven |
| `/new-web-app` | FastAPI + Next.js full-stack web app | ✅ Agent-driven |
| `/new-mobile-app` | Expo/React Native or Flutter mobile app | ✅ Agent-driven |
| `/new-cli-tool` | Rust (clap) or Python (typer) CLI tool | ✅ Agent-driven |
| `/new-mcp-server` | Python (FastMCP) or TypeScript MCP server | ✅ Agent-driven |

## How It Works

Each command runs an agent that:
1. Reads the command template from `.opencode/command/`
2. Executes the steps (create project, install deps, configure)
3. Verifies the result compiles/runs

## Using a Template

```
/new-desktop-app MyApp "A beautiful markdown editor"
```

The agent will:
1. Create a Tauri v2 project called `MyApp`
2. Install shadcn/ui, Zustand, TanStack Query, SQLite
3. Set up project structure
4. Configure Tauri for cross-platform
5. Initialize git

## Customizing Templates

Edit the command files in `.opencode/command/` to change what each template generates.
