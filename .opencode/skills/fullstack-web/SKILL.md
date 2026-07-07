---
name: fullstack-web
description: Use when building full-stack web applications with FastAPI and Next.js. Covers project structure, auth, WebSocket streaming, Docker, and deployment. Trigger keywords: FastAPI, Next.js, full-stack, web app, API, backend, frontend
---

# Full-Stack Web Development (FastAPI + Next.js)

## Project Structure
```
project/
├── backend/
│   ├── app/
│   │   ├── main.py           # FastAPI app
│   │   ├── models.py         # Pydantic/SQLAlchemy models
│   │   ├── routers/          # API route modules
│   │   ├── services/         # Business logic
│   │   └── dependencies/     # DI (auth, db)
│   ├── Dockerfile
│   └── pyproject.toml
├── frontend/
│   ├── app/                  # Next.js App Router
│   ├── components/           # React components
│   ├── lib/                  # Utilities, API client
│   ├── Dockerfile
│   └── package.json
└── docker-compose.yml
```

## FastAPI Patterns

### App Setup
```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="My API", version="1.0.0")
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"])
```

### Routes
```python
from fastapi import APIRouter, Depends
router = APIRouter(prefix="/api/users", tags=["users"])

@router.get("/")
async def list_users(db: Session = Depends(get_db)):
    return db.query(User).all()
```

## Next.js Patterns

### App Router
```typescript
// app/page.tsx — Server Component by default
export default async function Home() {
  const data = await fetch("http://backend:8000/api/data");
  return <div>{/* render data */}</div>;
}
```

### API Client
```typescript
// lib/api.ts
const API = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000";
export async function fetchAPI<T>(path: string): Promise<T> {
  const res = await fetch(`${API}${path}`);
  if (!res.ok) throw new Error(res.statusText);
  return res.json();
}
```

## Auth (JWT)
```python
# FastAPI: JWT middleware
from jose import JWTError, jwt
from datetime import datetime, timedelta

SECRET_KEY = os.getenv("JWT_SECRET")
ALGORITHM = "HS256"

def create_access_token(data: dict):
    expire = datetime.utcnow() + timedelta(hours=24)
    return jwt.encode({**data, "exp": expire}, SECRET_KEY, algorithm=ALGORITHM)
```

## WebSocket Streaming
```python
# FastAPI WebSocket
@router.websocket("/ws/chat")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    while True:
        data = await websocket.receive_json()
        # Process and stream response
        await websocket.send_json({"response": "..."})
```

## Docker Compose
```yaml
services:
  backend:
    build: ./backend
    ports: ["8000:8000"]
    environment: [DATABASE_URL=postgresql://...]
  frontend:
    build: ./frontend
    ports: ["3000:3000"]
    environment: [NEXT_PUBLIC_API_URL=http://localhost:8000]
  db:
    image: postgres:16-alpine
    volumes: [pgdata:/var/lib/postgresql/data]
```

## Deployment Options
- **Railway**: One-click deploy from GitHub, automatic HTTPS, PostgreSQL add-on
- **Fly.io**: Global edge deployment, Docker support, generous free tier
- **Vercel**: Best for Next.js frontend, serverless functions for lightweight backend
- **Self-hosted**: Docker Compose on VPS (DigitalOcean, Hetzner)
