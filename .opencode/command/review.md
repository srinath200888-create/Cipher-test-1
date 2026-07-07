---
description: Deep code review of recent changes for bugs, security, and quality.
agent: reviewer
---

You are performing a code review of recent changes.

## Process
1. Check `git diff` for unstaged changes
2. Check `git log --oneline -10` for recent commits
3. For each changed file:
   - Check for security issues (injection, XSS, auth bypass)
   - Check for bugs (null references, race conditions, edge cases)
   - Check for performance issues (N+1 queries, large bundles)
   - Check for code quality (single responsibility, naming, duplication)
   - Check for testing (are there tests? do they cover edge cases?)

## Optional flags
- `--security`: Focus on security vulnerabilities
- `--performance`: Focus on performance issues
- `--full`: All checks including style and documentation
- Default: Bugs + security + major performance issues

## Output
For each issue found, include:
- Type (bug, security, performance, style)
- File:line
- Problem description
- Suggested fix
