# Build a Complete Desktop App

Use this prompt when you want to build a complete desktop application from scratch.

## Prompt

Build a complete desktop application for [describe your app].

### Requirements
- **Platform**: Desktop (Windows, macOS, Linux)
- **Tech Stack**: Tauri v2 + React 19 + TypeScript + shadcn/ui + Zustand + SQLite
- **Testing**: Vitest + @testing-library/react
- **Packaging**: Cross-platform installers

### Process
1. Plan the architecture (what does this app do? what data does it store?)
2. Design the data model (SQLite tables, relationships)
3. Design the UI (component tree, layout, navigation)
4. Scaffold the project with Tauri v2 + React
5. Implement the Rust backend (data layer, file I/O, system APIs)
6. Implement the UI components with shadcn/ui
7. Connect frontend to backend via Tauri IPC
8. Handle loading, empty, error, and success states
9. Add keyboard shortcuts
10. Write tests for critical paths
11. Build and package for distribution

### Deliverables
- A working desktop app that opens in a native window
- SQLite database for persistent storage
- Beautiful UI with shadcn/ui components
- Cross-platform build artifacts
