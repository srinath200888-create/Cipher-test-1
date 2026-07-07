# API Design

## RESTful Conventions

### URL Structure
```
GET    /api/resource          # List
POST   /api/resource          # Create
GET    /api/resource/:id      # Read
PUT    /api/resource/:id      # Replace
PATCH  /api/resource/:id      # Partial update
DELETE /api/resource/:id      # Delete
```

### Naming
- Plural nouns for resources: `/users`, `/orders`
- Nesting for relationships: `/users/:id/orders`
- Query params for filtering: `?status=active&page=1&limit=20`
- No verbs in URLs: use `/orders` not `/getAllOrders`

### Response Format
```json
{
  "success": true,
  "data": { ... },
  "error": null,
  "meta": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
```

### Error Format
```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "details": { "field": "email" }
  }
}
```

## Status Codes
- `200` — Success
- `201` — Created
- `400` — Bad request (validation error)
- `401` — Unauthorized (not authenticated)
- `403` — Forbidden (not authorized)
- `404` — Not found
- `409` — Conflict (duplicate)
- `422` — Unprocessable entity
- `429` — Too many requests
- `500` — Internal server error

## Versioning
- Use URL prefix: `/api/v1/users`
- Or header: `Accept: application/vnd.api.v1+json`
- Never break backwards compatibility without a major version bump

## Pagination
```
GET /api/users?page=1&limit=20
```
Response includes `meta.page`, `meta.limit`, `meta.total`

## Rate Limiting
- Include headers: `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`
- Return `429 Too Many Requests` when exceeded
- Consider per-user and per-IP rate limits
