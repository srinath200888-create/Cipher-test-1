# MCP Servers

Model Context Protocol servers that extend AI agent capabilities.

## 🔥 GitHub MCP Server
- **Repo**: github/github-mcp-server
- **Maintainer**: GitHub (official)
- **Protocol**: stdio + remote
- **Why**: Official GitHub MCP server. PR management, code search, issues, Actions logs. The live one (Anthropic's original is archived).
- **Install**: `npx @github/github-mcp-server`
- **Use**: GitHub automation for AI agents

## 🔥 Playwright MCP
- **Repo**: @playwright/mcp (official)
- **Maintainer**: Microsoft
- **Protocol**: stdio
- **Why**: Browser automation via MCP. Navigate, click, fill forms, take screenshots. Essential for web testing.
- **Install**: `npx @playwright/mcp`
- **Use**: Web automation and testing

## 🔥 Filesystem MCP
- **Repo**: @modelcontextprotocol/server-filesystem
- **Maintainer**: Anthropic
- **Protocol**: stdio
- **Why**: Safe file operations for AI agents. Read, write, search files with path sandboxing.
- **Install**: `npx @modelcontextprotocol/server-filesystem /allowed/path`
- **Use**: File access for AI agents

## ⭐ Postgres MCP
- **Repo**: @modelcontextprotocol/server-postgres
- **Maintainer**: Anthropic
- **Protocol**: stdio
- **Why**: Read-only SQL queries via MCP. Inspect schema, run SELECT queries.
- **Install**: `npx @modelcontextprotocol/server-postgres postgresql://...`
- **Use**: Database inspection for AI

## ⭐ Puppeteer MCP
- **Repo**: @modelcontextprotocol/server-puppeteer
- **Maintainer**: Anthropic
- **Protocol**: stdio
- **Why**: Headless Chrome via MCP. Screenshots, PDF generation, page manipulation.
- **Install**: `npx @modelcontextprotocol/server-puppeteer`
- **Use**: Screenshots and PDF generation

## ⭐ Sentry MCP
- **Repo**: sentry/mcp-server
- **Maintainer**: Sentry (official)
- **Protocol**: remote
- **Why**: Error tracking and tracing via MCP. Query issues, check deployment health.
- **Install**: Remote URL with Sentry token
- **Use**: Error monitoring for AI agents

## ⭐ Figma MCP
- **Repo**: figma/plugin-mcp
- **Maintainer**: Figma (official)
- **Protocol**: remote
- **Why**: Design-to-code pipeline via MCP. Read design tokens, export components.
- **Install**: Remote URL with Figma token
- **Use**: Design system integration

## 🔥 modelcontextprotocol/servers
- **Repo**: modelcontextprotocol/servers
- **Stars**: 87K+
- **Why**: The reference implementation repository. Contains all official MCP servers and examples.
- **Use**: Reference and examples
