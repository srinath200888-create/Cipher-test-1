---
description: Scaffold a complete Tauri v2 + React 19 + shadcn/ui desktop app with SQLite, Zustand, and testing setup.
agent: desktop-builder
---

You are scaffolding a new Tauri v2 desktop application.

## Requirements
- App name: $ARGUMENTS
- Stack: Tauri v2 + React 19 + TypeScript + shadcn/ui + Zustand + TanStack Query + SQLite
- Testing: Vitest + @testing-library/react
- Platform: Cross-platform (Windows, macOS, Linux)

## Steps

1. **Create the project**
   - Run `npm create tauri-app@latest -- --template react-ts --manager npm` with the app name
   - The app name comes from $ARGUMENTS (first word is the project name, rest is description if any)

2. **Install UI dependencies**
   - `npx shadcn@latest init` (default options)
   - `npx shadcn@latest add button card dialog dropdown-menu form input label select separator sheet table tabs toast`

3. **Install state management**
   - `npm install zustand @tanstack/react-query`

4. **Install database**
   - `npm install @tauri-apps/plugin-sql`
   - Add `tauri-plugin-sql` to Cargo.toml with sqlite feature

5. **Install testing**
   - `npm install -D vitest @testing-library/react @testing-library/jest-dom @testing-library/user-event jsdom`

6. **Set up project structure**
   ```
   src/
   ├── components/ui/     # shadcn components
   ├── components/app/    # Your custom components
   ├── lib/               # Utilities, API client
   ├── stores/            # Zustand stores
   ├── hooks/             # Custom hooks
   └── types/             # TypeScript types
   ```

7. **Configure Tauri**
   - Set up window config in `tauri.conf.json`
   - Configure permissions in `src-tauri/capabilities/`
   - Add tray icon support if applicable

8. **Set up database**
   - Initialize SQLite in Rust backend
   - Create migration system with Drizzle ORM
   - Add type-safe queries

9. **Add hotkey support**
   - `npm install @tauri-apps/plugin-global-shortcut`

10. **Verify it works**
    - `npm run tauri dev` should launch the app
    - Basic window with shadcn/ui button should render

11. **Initialize git repo**
    - `git init && git add -A && git commit -m "Initial scaffold"`
