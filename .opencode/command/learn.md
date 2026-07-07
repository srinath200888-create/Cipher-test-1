---
description: Add a new repository to the golden index.
agent: research
---

You are adding a new repository to the cipher-knowledge golden index.

## Requirements
- URL or repo name: $ARGUMENTS
- Format: `owner/repo` or full URL

## Process
1. **Research the repo**
   - Fetch the GitHub page
   - Get: stars, language, license, description, topics, last updated
   - Read the README for key features

2. **Categorize the repo**
   - Which category file does it belong to?
   - Options: ai-agents, desktop-frameworks, ui-libraries, fullstack-templates, mcp-servers, backend-frameworks, databases-orms, devops-deployment, ai-ml-tools, mobile-development, testing-tools, security-tools, state-management, build-tools, design-resources

3. **Add entry to the index**
   - Format matches existing entries:
     ```markdown
     ## [Name]
     - **Repo**: owner/repo
     - **Stars**: N
     - **Language**: Lang
     - **License**: License
     - **Why**: One-line summary
     - **Install**: `command`
     - **See also**: related tools
     ```
   - Add to the appropriate category file

4. **Confirm**
   - Print the entry that was added
   - Tell the user which file was updated
