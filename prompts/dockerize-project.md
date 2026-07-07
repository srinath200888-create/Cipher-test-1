# Dockerize Project

Use this prompt to add Docker to any project.

## Prompt

Add Docker containerization to this project.

### Requirements
- Multi-stage builds for small images
- Docker Compose for local development
- Production-ready configuration

### Implementation

#### Dockerfile (Backend)
```dockerfile
# Python multi-stage
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.12-slim
COPY --from=builder /root/.local /root/.local
COPY . .
CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]
```

#### Dockerfile (Rust)
```dockerfile
FROM rust:1.80-slim AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
COPY --from=builder /app/target/release/app /usr/local/bin/
CMD ["app"]
```

#### Docker Compose
```yaml
services:
  app:
    build: .
    ports: ["8000:8000"]
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/db
    depends_on: [db]
  db:
    image: postgres:16-alpine
    volumes: [pgdata:/var/lib/postgresql/data]
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: db
```

#### .dockerignore
```
node_modules/
target/
.git/
*.md
__pycache__/
.env
.gitignore
```

### Deliverables
- Production Dockerfile(s) for each service
- docker-compose.yml for local dev
- .dockerignore
- Health checks configured
- Instructions for building and running
