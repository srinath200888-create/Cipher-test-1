---
name: security
description: Use when auditing or improving application security. Covers OWASP Top 10, threat modeling, secure coding patterns, and security headers. Trigger keywords: security, OWASP, vulnerability, threat model, secure, CVE, audit, penetration test
---

# Security

## OWASP Top 10 (Quick Reference)
1. **Broken Access Control** — Check auth on every endpoint
2. **Cryptographic Failures** — HTTPS everywhere, no sensitive data in URLs
3. **Injection** — Parameterize all SQL/NoSQL/OS queries
4. **Insecure Design** — Rate limiting, throttle, validate
5. **Security Misconfiguration** — No default creds, debug off in prod
6. **Vulnerable Components** — Keep deps updated, scan for CVEs
7. **Auth Failures** — Strong passwords, MFA, session rotation
8. **Data Integrity Failures** — CSP, signed requests
9. **Logging Failures** — Log security events, alert on anomalies
10. **SSRF** — Restrict outbound URLs, validate user input

## Web Security Headers
```
Content-Security-Policy: default-src 'self'
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Strict-Transport-Security: max-age=31536000; includeSubDomains
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: camera=(), microphone=()
```

## Password Handling
```python
# Python: bcrypt
import bcrypt
hashed = bcrypt.hashpw(password.encode(), bcrypt.gensalt())
bcrypt.checkpw(password.encode(), hashed)

# Node: bcrypt
import bcrypt;
const hashed = await bcrypt.hash(password, 12);
const match = await bcrypt.compare(password, hashed);
```

## Auth Tokens
```python
# JWT with expiration and refresh
from jose import jwt
from datetime import datetime, timedelta

access = jwt.encode({"sub": user_id, "exp": datetime.utcnow() + timedelta(hours=1)}, SECRET, algorithm="HS256")
refresh = jwt.encode({"sub": user_id, "exp": datetime.utcnow() + timedelta(days=30)}, SECRET, algorithm="HS256")
```

## Secrets Scanning
```bash
# Scan repo for secrets
trufflehog git file://. --only-verified
gitleaks detect --source .
```
