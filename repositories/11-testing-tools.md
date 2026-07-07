# Testing Tools

Frameworks and utilities for testing code.

## 🔥 Vitest
- **Repo**: vitest-dev/vitest
- **Stars**: 13K+
- **Language**: TypeScript
- **License**: MIT
- **Why**: Next-gen testing framework for Vite projects. Jest-compatible API, faster, native ESM, TypeScript support out of the box.
- **Install**: `npm install -D vitest`
- **Use**: TypeScript/React testing

## 🔥 pytest
- **Repo**: pytest-dev/pytest
- **Stars**: 12K+
- **Language**: Python
- **License**: MIT
- **Why**: The standard Python testing framework. Fixtures, parameterization, plugins, async support.
- **Install**: `pip install pytest pytest-asyncio`
- **Use**: Python testing

## 🔥 Playwright
- **Repo**: microsoft/playwright
- **Stars**: 70K+
- **Language**: TypeScript
- **License**: Apache 2.0
- **Why**: End-to-end testing framework by Microsoft. Cross-browser, auto-wait, codegen, mobile emulation.
- **Install**: `npm install -D @playwright/test && npx playwright install`
- **Use**: E2E testing

## ⭐ Testing Library
- **Repo**: testing-library/testing-library
- **Stars**: 20+ repos across ecosystem
- **Language**: TypeScript
- **License**: MIT
- **Why**: Test components the way users use them. Queries by role, text, label — not implementation details.
- **Install**: `npm install -D @testing-library/react @testing-library/jest-dom`
- **Use**: Component testing

## ⭐ msw (Mock Service Worker)
- **Repo**: mswjs/msw
- **Stars**: 16K+
- **Language**: TypeScript
- **License**: MIT
- **Why**: API mocking for tests. Intercept network requests at the service worker level. Works with Vitest, Playwright.
- **Install**: `npm install -D msw`
- **Use**: API mocking in tests
