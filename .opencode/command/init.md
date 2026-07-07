---
description: Run full cipher-knowledge setup and health check.
agent: builder
---

You are running the cipher-knowledge init process.

## Steps

1. **Check if cipher-knowledge is set up**
   - Check for `cipher-knowledge/` directory
   - Check for `.opencode/` symlink
   - Check for `opencode.json` at project root

2. **If not set up**, walk through:
   - Clone: `git clone https://github.com/srinath200888-create/cipher-knowledge`
   - Run setup script (Windows: `.\cipher-knowledge\scripts\setup.ps1`, Mac/Linux: `bash cipher-knowledge/scripts/setup.sh`)
   
3. **If set up**, verify everything:
   - `opencode.json` exists and is valid JSON
   - `cipher-knowledge/` directory exists
   - `.opencode/` exists (as directory or symlink)
   - Agent files exist in `.opencode/agent/`
   - Skill files exist in `.opencode/skills/`
   - Command files exist in `.opencode/command/`
   - Repository index files exist in `cipher-knowledge/repositories/`

4. **Print status**
   - ✅ or ❌ for each component
   - Tips if anything is missing
