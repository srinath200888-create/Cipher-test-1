# Cipher Knowledge Quick Start

## 30-Second Setup

```powershell
# 1. Go to your project
cd your-project

# 2. Clone cipher-knowledge
git clone https://github.com/srinath200888-create/cipher-knowledge

# 3. Run setup (Windows)
.\cipher-knowledge\scripts\setup.ps1

# (Mac/Linux)
# bash cipher-knowledge/scripts/setup.sh

# 4. Restart OpenCode
```

## Verify It Worked

In OpenCode, run:
```
/health
```

You should see all 19 agents, 14 skills, 16 commands, and 15 repo categories loaded.

## First Commands to Try

| Command | What It Does |
|---------|-------------|
| `/suggest-stack "build a note-taking desktop app"` | Get tech stack recommendations |
| `@vibe-coder build me a markdown editor` | Build a complete app from one prompt |
| `/new-desktop-app MyApp "A todo app"` | Scaffold a Tauri desktop project |
| `/health` | Verify everything is loaded |

## First Agents to Try

| Agent | Try Saying |
|-------|-----------|
| `@architect` | "Design the architecture for a real-time chat app" |
| `@builder` | "Implement the user settings page" |
| `@debugger` | "The app crashes when I click Save" |
| `@ui-designer` | "Make the login page beautiful" |
| `@reviewer` | "Review my recent changes" |
