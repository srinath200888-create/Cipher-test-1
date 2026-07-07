---
name: testing
description: Use when writing tests for applications. Covers Vitest (TypeScript), pytest (Python), Playwright (E2E), and Testing Library patterns. Trigger keywords: test, testing, Vitest, pytest, Playwright, TDD, unit test, integration test, E2E, coverage
---

# Testing

## Testing Pyramid
1. **Unit tests** (70%) — Fast, isolated, test individual functions
2. **Integration tests** (20%) — Test modules working together
3. **E2E tests** (10%) — Test full user flows

## Vitest (TypeScript/React)
```typescript
// Basic test
import { describe, it, expect } from "vitest";

describe("sum", () => {
  it("adds two numbers", () => {
    expect(sum(1, 2)).toBe(3);
  });
});

// Component test with Testing Library
import { render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";

it("submits the form", async () => {
  render(<MyForm />);
  await userEvent.type(screen.getByLabelText("Name"), "John");
  await userEvent.click(screen.getByRole("button", { name: "Submit" }));
  expect(screen.getByText("Success")).toBeInTheDocument();
});
```

## pytest (Python)
```python
# Basic test
def test_sum():
    assert sum(1, 2) == 3

# Fixtures
import pytest

@pytest.fixture
def db_session():
    session = create_test_session()
    yield session
    session.close()

def test_create_user(db_session):
    user = create_user(db_session, email="test@test.com")
    assert user.email == "test@test.com"
```

## Playwright (E2E)
```typescript
import { test, expect } from "@playwright/test";

test("user can log in", async ({ page }) => {
  await page.goto("/login");
  await page.fill("[name=email]", "user@test.com");
  await page.fill("[name=password]", "password123");
  await page.click("button[type=submit]");
  await expect(page.locator("text=Dashboard")).toBeVisible();
});
```

## Coverage Targets
- Lines: 80%+
- Branches: 75%+
- Focus on critical paths (auth, payments, data integrity)
- Don't chase 100% — diminishing returns
