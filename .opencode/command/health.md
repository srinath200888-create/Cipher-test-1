---
description: Check that cipher-knowledge, agents, skills, and MCP are loaded correctly.
agent: builder
---

You are running a health check on cipher-knowledge.

## Checks

1. **cipher-knowledge directory**
   - Path: `cipher-knowledge/`
   - Status: ✅ / ❌

2. **opencode.json**
   - Path: root `opencode.json`
   - Valid JSON: ✅ / ❌
   - References to cipher-knowledge: ✅ / ❌

3. **Agents** (check each exists in `.opencode/agent/`)
   - architect, builder, debugger, ui-designer, reviewer
   - product-manager, devops, security, database-architect, test-engineer
   - docs-writer, performance, data-scientist, research, mobile-dev
   - desktop-builder, web-builder, vibe-coder
   - Count: N/19

4. **Skills** (check each exists in `.opencode/skills/*/SKILL.md`)
   - tauri-desktop, react-shadcn, fullstack-web, python-ai, database
   - mcp-server, cli-tools, deployment, mobile, testing
   - security, performance, project-detection, smell
   - Count: N/14

5. **Commands** (check each exists in `.opencode/command/`)
   - Count: N/16

6. **Repository index** (check each exists in `cipher-knowledge/repositories/`)
   - Count: N files

7. **MCP servers**
   - Config in opencode.json: ✅ / ❌

## Output
```
Cipher Knowledge Health Report
══════════════════════════════
cipher-knowledge directory:  ✅
opencode.json:              ✅
Agents:                     N/19 loaded
Skills:                     N/14 loaded
Commands:                   N/16 loaded
Repo Index:                 N categories
MCP Servers:                N configured

Status: ✅ All systems ready
```
