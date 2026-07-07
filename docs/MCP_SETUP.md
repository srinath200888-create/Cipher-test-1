# MCP Server Setup Guide

## What is MCP?

Model Context Protocol (MCP) lets AI agents interact with external tools and services. Think of it as "USB-C for AI" — a standard way to connect AI to data sources, APIs, and tools.

## Pre-Configured Servers

The following MCP servers are configured in `opencode.json` but disabled by default:

### GitHub
```json
{
  "github": {
    "type": "remote",
    "url": "https://api.github.com/mcp",
    "headers": {},
    "enabled": false
  }
}
```
Enable by setting `"enabled": true` and adding your GitHub token.

### Playwright
```json
{
  "playwright": {
    "type": "local",
    "command": ["npx", "-y", "@playwright/mcp"],
    "enabled": false
  }
}
```
Enable by setting `"enabled": true`. Requires Node.js installed.

### Filesystem
```json
{
  "filesystem": {
    "type": "local",
    "command": ["npx", "-y", "@modelcontextprotocol/server-filesystem", "."],
    "enabled": false
  }
}
```

### Postgres
```json
{
  "postgres": {
    "type": "local",
    "command": ["npx", "-y", "@modelcontextprotocol/server-postgres"],
    "env": { "PG_URI": "{env:PG_URI}" },
    "enabled": false
  }
}
```
Set the `PG_URI` environment variable with your connection string.

## Enabling a Server

1. Open `opencode.json` (or `cipher-knowledge/opencode.json`)
2. Find the server config
3. Change `"enabled": false` to `"enabled": true`
4. Add any required env vars or tokens
5. Restart OpenCode

## Adding a Custom Server

```json
{
  "mcp": {
    "my-server": {
      "type": "local",
      "command": ["python", "path/to/server.py"],
      "enabled": true
    }
  }
}
```

## Best Practices
- Enable only the servers you need (more = more context used)
- Use `{env:VAR}` interpolation for secrets, never hardcode tokens
- Test each server individually after enabling
