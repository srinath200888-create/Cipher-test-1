---
description: Scaffold an MCP server in Python (FastMCP) or TypeScript with tools, resources, and prompts.
agent: builder
---

You are scaffolding a new MCP server.

## Requirements
- Server name: $ARGUMENTS
- Default: Python with FastMCP
- `--typescript`: TypeScript with @modelcontextprotocol/sdk

## Steps (Python FastMCP)

1. Create project directory
2. Create `pyproject.toml` with `fastmcp` dependency
3. Create `server.py` with:
   ```python
   from fastmcp import FastMCP
   
   mcp = FastMCP("$NAME")
   
   @mcp.tool()
   def my_tool(param: str) -> str:
       """Tool description"""
       return f"Hello {param}"
   
   @mcp.resource("config://app")
   def get_config() -> str:
       return "config data"
   
   @mcp.prompt()
   def my_prompt(topic: str) -> str:
       return f"Discuss: {topic}"
   
   if __name__ == "__main__":
       mcp.run()
   ```
4. Add example tool, resource, and prompt
5. Add README with usage instructions
6. Verify: `python server.py`

## Steps (TypeScript)

1. Create project with `package.json` and `tsconfig.json`
2. Install: `@modelcontextprotocol/sdk`, `zod`, `typescript`
3. Create `src/server.ts` with tool/resource/prompt handlers
4. Add build script
5. Add README with usage instructions
6. Verify: `npm run build && node dist/server.js`

## Testing the server
- Connect to it from OpenCode by adding to opencode.json:
```json
{
  "mcp": {
    "$NAME": {
      "type": "local",
      "command": ["python", "path/to/server.py"],
      "enabled": true
    }
  }
}
```
