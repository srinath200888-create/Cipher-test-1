---
name: deployment
description: Use when deploying applications to production. Covers Docker, CI/CD (GitHub Actions), cloud platforms (Railway, Fly.io, Vercel), and Tauri app packaging. Trigger keywords: deploy, Docker, CI/CD, GitHub Actions, Railway, Fly.io, Vercel, container
---

# Deployment

## Docker Best Practices
```dockerfile
# Multi-stage build (Rust example)
FROM rust:1.80-slim AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
COPY --from=builder /app/target/release/my-app /usr/local/bin/
CMD ["my-app"]
```

```dockerfile
# Python multi-stage
FROM python:3.12-slim AS builder
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.12-slim
COPY --from=builder /root/.local /root/.local
COPY . /app
WORKDIR /app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]
```

## GitHub Actions CI/CD
```yaml
name: CI/CD
on:
  push: [main]
  pull_request: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci && npm test

  build:
    needs: test
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
    steps:
      - uses: actions/checkout@v4
      - run: npm ci && npm run build
```

## Platform-Specific

### Railway
```bash
# Deploy via CLI
railway up
# Or connect GitHub repo — auto-deploys on push
```

### Fly.io
```bash
fly launch
fly deploy
```

### Vercel
```bash
# Deploy Next.js frontend
vercel --prod
```

## Tauri Desktop Packaging
```bash
# Windows: MSIX or NSIS
# macOS: DMG (with notarization)
# Linux: AppImage, deb, rpm
npm run tauri build
```

## Environment Management
- `.env` files for local dev (never committed)
- GitHub Secrets for CI/CD
- Railway/Fly.io dashboard for production
- Validate required env vars on startup
- Use different env names per environment (DEV, STAGING, PROD)
