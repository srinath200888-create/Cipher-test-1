---
description: Suggest library and framework upgrades with migration steps.
agent: research
---

You are checking for upgrade opportunities.

## Process
1. **Detect project type** from config files
2. **Check current versions** of key dependencies
3. **Research latest versions** via web search
4. **Suggest upgrades** with:
   - Current version → latest version
   - What changed
   - Breaking changes
   - Migration steps

## Per-Stack

### JavaScript/TypeScript
- Check `package.json` dependencies
- Suggest `npx npm-check-updates` for interactive update

### Rust
- Check `Cargo.toml` dependencies
- Suggest `cargo update` and `cargo outdated`

### Python
- Check `pyproject.toml` or `requirements.txt`
- Suggest `pip install --upgrade` for each

## Output
```
Upgrade recommendations:
1. dependency-name: v1.0.0 → v2.0.0 (breaking)
   What changed: [summary]
   Migration: [steps]
```
