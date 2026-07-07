# Security Patterns

## OWASP Top 10 (2025)

1. **Broken Access Control** — Check permissions on EVERY endpoint. Don't rely on hiding UI.
2. **Cryptographic Failures** — HTTPS everywhere. No sensitive data in URLs, logs, or error messages.
3. **Injection** — Parameterize all queries. Never concatenate user input into SQL/NoSQL/OS commands.
4. **Insecure Design** — Rate limiting, throttling, input validation at the design level.
5. **Security Misconfiguration** — No default credentials, debug mode off in production, secure headers set.
6. **Vulnerable Components** — Keep dependencies updated. Scan with `trivy` or `npm audit`.
7. **Auth Failures** — Strong password policies, MFA support, session rotation.
8. **Data Integrity Failures** — CSP headers, signed requests, integrity checks.
9. **Logging Failures** — Log security events, alert on anomalies, protect logs from tampering.
10. **SSRF** — Restrict outbound URLs, validate user-supplied URLs, block internal IP ranges.

## Authentication Checklist
- [ ] Passwords hashed with bcrypt (cost 12+) or argon2
- [ ] JWT tokens expire (15 min access, 7 day refresh)
- [ ] Session tokens stored in httponly cookies (not localStorage)
- [ ] Rate limiting on login (5 attempts → 15 min lockout)
- [ ] MFA available for sensitive actions

## Authorization Patterns
```typescript
// Role-based access control (RBAC)
enum Role { ADMIN, USER, READONLY }
function authorize(...roles: Role[]) {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) return res.status(403);
    next();
  };
}
```

```typescript
// Resource-based: check ownership
function authorizeResource(resource: string) {
  return async (req, res, next) => {
    const item = await db[resource].findById(req.params.id);
    if (item.userId !== req.user.id && req.user.role !== "admin")
      return res.status(403);
    next();
  };
}
```

## Security Headers
```
Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Strict-Transport-Security: max-age=31536000; includeSubDomains
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: camera=(), microphone=(), geolocation=()
```

## Secrets Management
- Environment variables for all secrets
- `.env` files are local only, never committed
- Use GitHub Secrets for CI/CD
- Rotate keys every 90 days
- Scan repos with `gitleaks` before each commit
