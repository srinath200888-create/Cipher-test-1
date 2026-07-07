# Security Audit

Use this prompt to run a comprehensive security audit.

## Prompt

Run a full security audit on this codebase.

### Scope
- All source code
- Dependencies
- Configuration files
- Deployment setup

### Checklist

#### Code Security
- [ ] SQL injection: all queries parameterized?
- [ ] XSS: user input sanitized in all outputs?
- [ ] CSRF: tokens on state-changing requests?
- [ ] Auth bypass: protected routes checked?
- [ ] IDOR: users can't access others' data?
- [ ] Rate limiting: implemented on sensitive endpoints?
- [ ] Input validation: all inputs validated server-side?
- [ ] File uploads: type checking, size limits, scan?

#### Infrastructure
- [ ] HTTPS only in production
- [ ] Security headers set (CSP, HSTS, X-Frame-Options)
- [ ] CORS configured correctly
- [ ] Secrets not in code (env vars or vault)
- [ ] Dependencies scanned for CVEs
- [ ] Docker image scanned for vulnerabilities

#### Authentication
- [ ] Passwords hashed with bcrypt/argon2
- [ ] JWT tokens expire and are validated
- [ ] Session tokens random and secure
- [ ] MFA available for sensitive actions
- [ ] Account lockout after failed attempts
- [ ] Password reset tokens expire

#### Data Protection
- [ ] Sensitive data encrypted at rest
- [ ] Personal data minimized
- [ ] Logging doesn't include sensitive info
- [ ] Database backups encrypted

### Deliverables
- Audit report with findings by severity (critical/major/minor)
- For each finding: location, problem, fix, and priority
- Summary: total findings, top 5 priorities
