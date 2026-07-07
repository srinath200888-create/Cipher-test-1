# Agent Reference

## Quick Reference Table

| Agent | Mode | Edit | Bash | Best For |
|-------|------|------|------|----------|
| @architect | subagent | ❌ | ask | Planning, tech stack, architecture |
| @builder | subagent | ✅ | ✅ | General implementation |
| @desktop-builder | subagent | ✅ | ✅ | Tauri desktop apps |
| @web-builder | subagent | ✅ | ✅ | FastAPI + Next.js web apps |
| @mobile-dev | subagent | ✅ | ✅ | React Native, Expo, Flutter |
| @vibe-coder | subagent | ✅ | ✅ | End-to-end app building |
| @debugger | subagent | ✅ | ✅ | Bug fixing, root cause analysis |
| @ui-designer | subagent | ✅ | ✅ | Beautiful UIs, styling, a11y |
| @reviewer | subagent | ❌ | ❌ | Code review, quality audit |
| @product-manager | subagent | ❌ | ❌ | PRDs, user stories, specs |
| @devops | subagent | ✅ | ✅ | Docker, CI/CD, deployment |
| @security | subagent | ask | ask | Security audit, vulnerabilities |
| @database-architect | subagent | ❌ | ask | Schema design, query optimization |
| @test-engineer | subagent | ✅ | ✅ | TDD, testing, coverage |
| @docs-writer | subagent | ask | ask | Documentation, READMEs |
| @performance | subagent | ✅ | ✅ | Profiling, optimization |
| @data-scientist | subagent | ✅ | ✅ | AI/ML, RAG, LLMs, embeddings |
| @research | subagent | ❌ | ask | Web research, finding info |

## When to Use Each Agent

### Start of a new project → @architect or @vibe-coder
- @architect: You want a detailed plan, tech stack recommendations, data model
- @vibe-coder: You just want to describe the idea and get a working app

### During development → @builder, @desktop-builder, @web-builder
- These are your workhorses. Use them to implement features, fix issues, add functionality

### Something broke → @debugger
- Crashes, errors, unexpected behavior. The debugger is systematic about finding root causes.

### Make it pretty → @ui-designer
- Styling, layout, animations, responsive design, accessibility

### Need a second pair of eyes → @reviewer
- Code quality, security, performance, bugs — read-only analysis

### Shipping time → @devops
- Docker, CI/CD, cloud deployment, production configuration

### Data layer → @database-architect
- Schema design, migrations, query optimization, indexing strategy
