# Databases & ORMs

Data storage solutions and access libraries.

## 🔥 SQLite
- **Repo**: sqlite/sqlite (public domain)
- **Stars**: N/A (public domain)
- **Why**: Embedded, zero-config, serverless database. Best for desktop apps, local storage, and prototyping. File-based, no separate server process.
- **Install**: Built into Python, `npm install better-sqlite3`, bundled with Tauri
- **Use**: Desktop apps, local storage

## 🔥 PostgreSQL
- **Repo**: postgres/postgres
- **Stars**: 16K+
- **License**: PostgreSQL License
- **Why**: The most advanced open-source relational database. ACID compliant, extensive features (JSON, full-text search, PostGIS, custom types).
- **Install**: `winget install PostgreSQL` or Docker: `docker run postgres:16-alpine`
- **Use**: Production web apps

## 🔥 Drizzle ORM
- **Repo**: drizzle-team/drizzle-orm
- **Stars**: 26K+
- **Language**: TypeScript
- **License**: Apache 2.0
- **Why**: Type-safe SQL ORM. SQL-like query syntax, zero overhead, drizzle-kit for migrations. Works with PostgreSQL, SQLite, MySQL.
- **Install**: `npm install drizzle-orm @libsql/client` or `npm install drizzle-orm pg`
- **Use**: TypeScript database access

## ⭐ Prisma
- **Repo**: prisma/prisma
- **Stars**: 40K+
- **Language**: TypeScript
- **License**: Apache 2.0
- **Why**: Mature TypeScript ORM. Declarative schema, auto-generated client, migrations, studio UI.
- **Install**: `npm install prisma @prisma/client`
- **Use**: TypeScript apps needing a mature ORM

## ⭐ SQLAlchemy
- **Repo**: sqlalchemy/sqlalchemy
- **Stars**: 9K+
- **Language**: Python
- **License**: MIT
- **Why**: The standard Python SQL toolkit and ORM. Powerful, flexible, well-documented.
- **Install**: `pip install sqlalchemy`
- **Use**: Python database access
