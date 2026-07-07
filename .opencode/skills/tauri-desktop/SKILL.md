---
name: tauri-desktop
description: Use when building desktop applications with Tauri v2. Covers project setup, IPC patterns, Rust backend, window management, system tray, auto-updates, and cross-platform packaging. Trigger keywords: Tauri, desktop app, native app, tauri app, cargo tauri
---

# Tauri v2 Desktop Development

## Overview
Tauri v2 is a framework for building desktop applications with a web frontend (React, Vue, Svelte) and a Rust backend. It produces tiny binaries (3-5MB) compared to Electron (100MB+).

## Quick Start
```bash
npm create tauri-app@latest
cd my-app
npm install
npm run tauri dev
```

## Recommended Stack
- **Frontend**: React 19 + TypeScript
- **UI**: shadcn/ui + Tailwind CSS v4
- **State**: Zustand v5 + TanStack Query v5
- **Desktop**: Tauri v2 (Rust)
- **Database**: SQLite via tauri-plugin-sql
- **Testing**: Vitest + Testing Library

## Key Commands
| Command | Description |
|---------|-------------|
| `npm run tauri dev` | Dev mode with hot reload |
| `npm run tauri build` | Production build |
| `cargo tauri init` | Initialize Tauri in existing project |

## IPC (Inter-Process Communication)
### Rust Command
```rust
#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}
```

### Frontend Call
```typescript
import { invoke } from "@tauri-apps/api/core";
const result = await invoke("greet", { name: "World" });
```

### Type-Safe Bridge (tauri-specta)
```rust
// Rust
#[tauri::command]
#[specta::specta]
fn get_users() -> Vec<User> { ... }
```

```typescript
// Auto-generated TypeScript
import { commands } from "./bindings";
const users = await commands.getUsers();
```

## Key Plugins
| Plugin | Use Case |
|--------|----------|
| `tauri-plugin-sql` | SQLite/PostgreSQL database |
| `tauri-plugin-fs` | File system access |
| `tauri-plugin-dialog` | Native file dialogs |
| `tauri-plugin-shell` | Execute shell commands |
| `tauri-plugin-notification` | Native notifications |
| `tauri-plugin-updater` | Auto-updates |
| `tauri-plugin-tray` | System tray |
| `tauri-plugin-clipboard-manager` | Clipboard access |

## Window Management
```rust
// Create new window
tauri::WebviewWindowBuilder::new(app, "label", tauri::WebviewUrl::App("index.html"))
    .title("My Window")
    .inner_size(800.0, 600.0)
    .build()?;
```

## System Tray
```rust
use tauri_plugin_tray::TrayIconBuilder;

TrayIconBuilder::new()
    .icon(app.default_window_icon().unwrap().clone())
    .menu(tray_menu)
    .on_left_click(|_| { /* show window */ })
    .build(app)?;
```

## Auto-Updates
```rust
// Rust setup
tauri_plugin_updater::Builder::new()
    .github_release("owner/repo")
    .build()
```

```typescript
// Frontend check
import { checkUpdate, installUpdate } from "@tauri-apps/plugin-updater";
const update = await checkUpdate();
if (update?.available) { await installUpdate(); }
```

## Cross-Platform Build
```bash
# Build for current platform
npm run tauri build

# CI: GitHub Actions matrix build
# - ubuntu-latest → .AppImage, .deb
# - macos-latest → .dmg
# - windows-latest → .msi, .nsis
```

## Common Patterns
- **State persistence**: SQLite for structured data, JSON files for config
- **Background tasks**: spawn threads in Rust, use Tauri events for progress
- **File access**: Use tauri-plugin-fs with proper permissions in `capabilities/`
- **Custom titlebar**: Set `decorations: false` in tauri.conf.json, build custom titlebar in React
