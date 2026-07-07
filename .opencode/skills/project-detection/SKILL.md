---
name: project-detection
description: Use to auto-detect the current project's tech stack and load the appropriate skills. Run at the start of a session or when opening a new project. Trigger keywords: detect, auto-detect, project type, what stack, what project
---

# Project Auto-Detection

## Purpose
Detect what kind of project you're working in and load the relevant skills.

## Detection Rules

### Desktop Apps (Tauri)
- Check for: `src-tauri/tauri.conf.json` or `tauri.conf.json`
- Load: tauri-desktop skill
- Flag: `PROJECT_TYPE=desktop`

### Web Apps (FastAPI + Next.js)
- Check for: `backend/main.py` with FastAPI imports, `frontend/next.config.*`
- Load: fullstack-web, react-shadcn skills
- Flag: `PROJECT_TYPE=fullstack-web`

### Next.js Only
- Check for: `next.config.*` (no `backend/` with FastAPI)
- Load: react-shadcn skill
- Flag: `PROJECT_TYPE=nextjs`

### CLI Tools (Rust)
- Check for: `Cargo.toml` with `[[bin]]` (no `tauri.conf.json`)
- Load: cli-tools skill
- Flag: `PROJECT_TYPE=cli-rust`

### CLI Tools (Python)
- Check for: `pyproject.toml` with `[tool.poetry.scripts]` or `[project.scripts]`
- Load: cli-tools skill
- Flag: `PROJECT_TYPE=cli-python`

### Mobile (Expo/RN)
- Check for: `app.json` with `expo`, `expo-router`
- Load: mobile skill
- Flag: `PROJECT_TYPE=mobile`

### Mobile (Flutter)
- Check for: `pubspec.yaml`
- Load: mobile skill
- Flag: `PROJECT_TYPE=flutter`

### Python AI/ML
- Check for: `requirements.txt` or `pyproject.toml` with langchain, llama-index, chromadb
- Load: python-ai skill
- Flag: `PROJECT_TYPE=ai-ml`

## Output
```
Detected: [PROJECT_TYPE]
Loaded skills: [skill1, skill2, ...]
Recommended agent: [agent-name]
```
