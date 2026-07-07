# Engineering Best Practices

## Code Style
- **No comments** — Code should be self-documenting with descriptive names
- **Small functions** — Under 30 lines, one purpose
- **Type everything** — TypeScript strict mode, Python type hints, Rust types
- **No duplication** — Extract repeated code into shared functions
- **Consistent naming** — camelCase for JS/TS, snake_case for Python/Rust

## Git
- **Small commits** — One logical change per commit
- **Descriptive messages** — "Add user login" not "fix stuff"
- **Branch per feature** — `feat/user-auth`, `fix/login-crash`
- **Review before merge** — Use the @reviewer agent

## Testing
- **TDD where practical** — Write test first, then implementation
- **Test behavior, not implementation** — What it does, not how
- **Mock external services** — Don't call real APIs in tests
- **Aim for 80% coverage** — Focus on critical paths

## Security
- **Validate all inputs** — Server-side, always
- **Parameterize queries** — Never concatenate SQL strings
- **Hash passwords** — bcrypt or argon2, never plaintext
- **No secrets in code** — Environment variables only
- **HTTPS everywhere** — Even in development

## Performance
- **Measure before optimizing** — Don't guess, profile
- **Lazy load** — Import heavy things only when needed
- **Cache aggressively** — But invalidate correctly
- **Bundle responsibly** — Keep critical path under 200KB

## Architecture
- **Follow the dependency rule** — Dependencies point inward
- **Prefer composition over inheritance** — Flatter is better
- **Keep it simple** — The simplest solution that works
- **Question dependencies** — Every new dependency is a liability
