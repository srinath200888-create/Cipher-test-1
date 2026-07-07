---
name: performance
description: Use when profiling and optimizing application performance. Covers web performance, bundle optimization, rendering patterns, database query optimization, and profiling tools. Trigger keywords: performance, slow, optimize, profile, bundle, caching, lazy load, memory
---

# Performance Optimization

## Web Vitals Targets
| Metric | Good | Needs Work | Poor |
|--------|------|------------|------|
| LCP | < 2.5s | < 4.0s | > 4.0s |
| FID/INP | < 100ms | < 300ms | > 300ms |
| CLS | < 0.1 | < 0.25 | > 0.25 |
| FCP | < 1.8s | < 3.0s | > 3.0s |

## Bundle Optimization
```typescript
// Dynamic imports
const HeavyComponent = dynamic(() => import("./HeavyComponent"), {
  loading: () => <Skeleton />,
});

// Code splitting at route level
// Next.js: App Router automatically code-splits per route
// React: lazy() + Suspense
```

## React Performance
```typescript
// Memoize expensive computations
const sorted = useMemo(() => data.sort(compare), [data]);

// Memoize callbacks passed to child components
const handleClick = useCallback(() => setOpen(false), []);

// Virtual list for long lists
import { Virtuoso } from "react-virtuoso";
<Virtuoso totalCount={items.length} itemContent={(i) => <Item item={items[i]} />} />
```

## Database Performance
```sql
-- Always check query plans
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 1;

-- Common fixes:
-- 1. Add missing indexes
-- 2. Fix N+1 (batch load instead of loop)
-- 3. Use pagination (keyset over offset)
-- 4. Connection pooling
```

## Profiling Tools
- **React**: React DevTools Profiler, why-did-you-render
- **Rust**: `cargo flamegraph`, `perf`
- **Python**: `py-spy`, `cProfile`
- **Database**: `pg_stat_statements`, `EXPLAIN ANALYZE`
- **Bundle**: `@next/bundle-analyzer`, `vite-bundle-visualizer`

## Caching Strategy
1. **Static**: CDN for assets, ISR for pages (Next.js)
2. **Data**: Redis/Memcached for frequent queries
3. **Computed**: Memoization for expensive calculations
4. **HTTP**: Cache-Control headers, ETags, Service Workers
