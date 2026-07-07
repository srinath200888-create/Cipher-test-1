# Add Database

Use this prompt to add a database to an existing project.

## Prompt

Add a database to this project.

### Options
- **Desktop (Tauri)**: SQLite via tauri-plugin-sql
- **Web (FastAPI)**: PostgreSQL with SQLAlchemy/Drizzle
- **Any**: SQLite for simplicity

### Implementation

#### Desktop (Tauri + SQLite)
1. Add `tauri-plugin-sql` with sqlite feature to Cargo.toml
2. Configure plugin permissions in capabilities
3. Create schema initialization on app start
4. Create typed Rust + TypeScript database functions
5. Migration system for schema changes

#### Web (FastAPI + PostgreSQL)
1. Add SQLAlchemy + psycopg2 to requirements
2. Create database session dependency
3. Define models (SQLAlchemy ORM)
4. Create migration system (Alembic)
5. CRUD endpoints for each model

#### Schema Design
- UUID primary keys
- Created/updated timestamps
- Soft deletes where appropriate
- Foreign keys with indexes
- Proper types (text, boolean, timestamp, json)

### Deliverables
- Working database connection
- Schema/migration system
- CRUD operations for data
- Connection pooling
- Error handling for database failures
