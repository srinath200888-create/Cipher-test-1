---
description: Build production binary, run tests, optimize bundle, and prepare release artifacts.
agent: devops
---

You are shipping the current project to production.

## Process
1. **Run tests** — `npm test` or `cargo test` or `pytest`
2. **Lint** — `npm run lint` or `cargo clippy`
3. **Check type safety** — `npx tsc --noEmit` or `mypy .`
4. **Build** — `npm run build` or `cargo build --release`
5. **Optimize** — Check bundle size, suggest improvements if > 200KB gzipped
6. **Verify build** — Run the built artifact to ensure it starts
7. **Create release notes** — Summary of what changed, new features, fixes
8. **Tag version** — Suggest next version number (semver)

## Platform-Specific

### Tauri Desktop
- `npm run tauri build`
- Bundle path: `src-tauri/target/release/bundle/`
- Cross-platform: Windows (.msi/.nsis), macOS (.dmg), Linux (.AppImage/.deb)

### Web App (Docker)
- `docker compose build`
- `docker compose push` to registry
- Deploy to Railway/Fly.io/Vercel

### CLI Tool (Rust)
- `cargo build --release`
- Binary: `target/release/$NAME`

### CLI Tool (Python)
- `python -m build`
- Distribute via PyPI or as standalone with PyInstaller
