---
name: database
description: Use when working with databases, schema design, migrations, and query optimization. Covers SQLite, PostgreSQL, Drizzle ORM, and Prisma. Trigger keywords: database, SQL, SQLite, PostgreSQL, Drizzle, Prisma, ORM, migration, schema, query
---

# Database Development

## Database Selection Guide
| Database | Use Case | When to Avoid |
|----------|----------|---------------|
| SQLite | Desktop apps, embedded, local-only, single-user | Multi-user concurrent writes |
| PostgreSQL | Web apps, production, complex queries | Embedded/local-only apps |
| MySQL | High-read workloads, traditional LAMP | Need advanced features (CTE, PostGIS) |

## SQLite (Desktop Apps)
```sql
-- Enable WAL mode for better concurrent reads
PRAGMA journal_mode=WAL;
-- Enable foreign keys
PRAGMA foreign_keys=ON;
```

## PostgreSQL (Web Apps)
```sql
-- Always use UUID primary keys
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Soft delete pattern
ALTER TABLE users ADD COLUMN deleted_at TIMESTAMPTZ;
```

## Drizzle ORM (TypeScript)
```typescript
// schema/users.ts
import { pgTable, uuid, text, timestamp } from "drizzle-orm/pg-core";

export const users = pgTable("users", {
  id: uuid("id").defaultRandom().primaryKey(),
  email: text("email").notNull().unique(),
  createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
  updatedAt: timestamp("updated_at", { withTimezone: true }).defaultNow().notNull(),
});

// Queries
const result = await db.select().from(users).where(eq(users.email, email));
```

## Indexing Strategy
```sql
-- Index foreign keys
CREATE INDEX idx_orders_user_id ON orders(user_id);

-- Composite indexes (order matters: equality first, then range)
CREATE INDEX idx_orders_user_status ON orders(user_id, status);

-- Partial indexes for filtered queries
CREATE INDEX idx_active_users ON users(is_active) WHERE is_active = true;

-- Covering indexes for frequent queries
CREATE INDEX idx_user_email_name ON users(email) INCLUDE (name);
```

## Query Optimization
- Use `EXPLAIN ANALYZE` to find slow queries
- N+1 problem: eager load with JOIN or batch loading
- Pagination: keyset pagination (WHERE id > ?) over OFFSET for large datasets
- Connection pooling: use PgBouncer or built-in pool for production
- Read replicas for read-heavy workloads
