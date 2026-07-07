# Cipher Knowledge Architecture

## How It Works

Cipher Knowledge is a drop-in OpenCode power-up pack. It extends OpenCode through five mechanisms:

### 1. Config (`opencode.json`)
The master config file placed in the project root. It:
- Defines custom agents inline
- Configures MCP server connections
- Sets references to the cipher-knowledge directory
- Adds skill paths for auto-loading
- Sets default model, permissions, and preferences

### 2. Agents (`.opencode/agent/`)
Markdown files with YAML frontmatter that define custom agent personalities. Each agent has:
- A description (front-loaded with trigger keywords)
- Permission rules (read-only, edit, bash)
- A system prompt that defines behavior

### 3. Skills (`.opencode/skills/`)
Directories containing `SKILL.md` files that teach OpenCode domain knowledge. Skills are auto-loaded from the configured paths.

### 4. Commands (`.opencode/command/`)
Markdown files that define slash commands (`/new-desktop-app`, `/ship`, etc.). Each has a template prompt that runs when the command is invoked.

### 5. References (`repositories/`, `docs/`, `concepts/`, `prompts/`)
Directories registered as references in `opencode.json`. These provide supporting context that OpenCode can read when making decisions.

## Loading Order
1. `opencode.json` is read from project root
2. `.opencode/agent/` files are loaded as custom agents
3. `.opencode/skills/` directories are scanned for `SKILL.md` files
4. `.opencode/command/` files are registered as slash commands
5. References are indexed and available via `@` autocomplete

## Design Principles
- **Drop-in**: One setup script, no manual configuration
- **Non-destructive**: Doesn't overwrite existing config
- **Extensible**: Add agents, skills, commands by creating files
- **Research-backed**: Repository index entries are real, verified tools
