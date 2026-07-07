# Build a Full-Stack Web App

Use this prompt when you want to build a complete web application.

## Prompt

Build a full-stack web application for [describe your app].

### Requirements
- **Stack**: FastAPI (Python) + Next.js 16 (TypeScript) + PostgreSQL + Drizzle ORM
- **UI**: shadcn/ui + Tailwind CSS v4
- **Auth**: JWT with httponly cookies
- **Deployment**: Docker + docker-compose

### Process
1. Plan the architecture
2. Design the data model (PostgreSQL, Drizzle ORM schema)
3. Design the API (RESTful endpoints, WebSocket if needed)
4. Scaffold FastAPI backend (routers, models, services, middleware)
5. Scaffold Next.js frontend (app router, components, API client)
6. Implement auth (register, login, logout, session management)
7. Implement core features
8. Add error handling and validation
9. Write tests (pytest for backend, Vitest for frontend)
10. Dockerize both services
11. Write docker-compose.yml with PostgreSQL

### Deliverables
- Working full-stack app at localhost:3000
- API docs at /docs (FastAPI auto-generated)
- Auth system with JWT
- Docker setup for deployment
- Test suite
