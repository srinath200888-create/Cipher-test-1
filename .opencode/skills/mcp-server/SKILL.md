---
name: mcp-server
description: Use when building Model Context Protocol servers. Covers tool definitions, resource templates, prompts, transport (stdio/HTTP), and authentication. Trigger keywords: MCP, Model Context Protocol, MCP server, tool, resource, prompt, FastMCP
---

# MCP Server Development

## Overview
MCP (Model Context Protocol) lets AI agents interact with external tools and data sources. An MCP server exposes tools, resources, and prompts that AI clients like Claude Code, Cursor, and OpenCode can use.

## Protocol
- **Tools**: Functions the AI can call (read file, search web, query DB)
- **Resources**: Data the AI can read (files, API responses)
- **Prompts**: Templates for common tasks
- **Transport**: stdio (local) or HTTP (remote)

## Python (FastMCP) — Recommended
```python
from fastmcp import FastMCP

mcp = FastMCP("my-server")

@mcp.tool()
def calculate(expression: str) -> float:
    """Evaluate a mathematical expression"""
    return eval(expression)

@mcp.resource("file://{path}")
def read_file(path: str) -> str:
    """Read a file from the filesystem"""
    with open(path) as f:
        return f.read()

@mcp.prompt()
def code_review(code: str) -> str:
    return f"Review this code:\n\n{code}"

if __name__ == "__main__":
    mcp.run()
```

## TypeScript
```typescript
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

const server = new Server({ name: "my-server", version: "1.0.0" }, {
  capabilities: { tools: {}, resources: {} }
});

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [{
    name: "calculate",
    description: "Evaluate a mathematical expression",
    inputSchema: { type: "object", properties: { expression: { type: "string" } } }
  }]
}));

const transport = new StdioServerTransport();
await server.connect(transport);
```

## MCP in opencode.json
```json
{
  "mcp": {
    "my-server": {
      "type": "local",
      "command": ["python", "path/to/server.py"],
      "enabled": true
    },
    "remote-server": {
      "type": "remote",
      "url": "https://example.com/mcp",
      "headers": { "Authorization": "Bearer {env:TOKEN}" },
      "enabled": true
    }
  }
}
```

## Best Practices
- Keep tool descriptions clear — AI reads them to decide when to use each tool
- Validate all inputs — AI might send unexpected values
- Handle errors gracefully — return error messages, don't crash
- Use typed inputs (JSON Schema) so the AI knows what to send
- Log all invocations for debugging
- Keep tools focused — one purpose per tool
