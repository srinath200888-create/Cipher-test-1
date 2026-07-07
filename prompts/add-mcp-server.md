# Add MCP Capabilities

Use this prompt to add MCP server capabilities to your project.

## Prompt

Add MCP server capabilities to this project.

### Requirements
- **Protocol**: Model Context Protocol
- **Language**: Python with FastMCP (preferred) or TypeScript with @modelcontextprotocol/sdk
- **Transport**: stdio (local) or HTTP (remote)

### Implementation

#### Python (FastMCP)
1. Install `fastmcp`
2. Create `mcp_server.py` with:
   - Tool functions the AI can call
   - Resource endpoints for data access
   - Prompt templates for common tasks
3. Register tools with clear descriptions and typed params
4. Add error handling for all tools
5. Test locally

#### Registration in opencode.json
```json
{
  "mcp": {
    "my-server": {
      "type": "local",
      "command": ["python", "mcp_server.py"],
      "enabled": true
    }
  }
}
```

### Tool Ideas
- Search/filter data
- Query the database (read-only)
- Generate reports
- Run validations
- Check status
- Transform data

### Deliverables
- Working MCP server
- 3-5 useful tools with descriptions
- Error handling
- registration config for OpenCode
- README with usage examples
