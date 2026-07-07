# Add Authentication

Use this prompt to add auth to an existing or new project.

## Prompt

Add authentication to this project.

### Requirements
- **Type**: JWT with httponly cookies (web) or Bearer tokens (API)
- **Features**: Register, login, logout, password reset, email verification
- **Social**: Optional (Google, GitHub OAuth)

### Implementation

#### Backend (FastAPI)
1. User model with email + hashed password (bcrypt)
2. Register endpoint (`POST /api/auth/register`)
3. Login endpoint (`POST /api/auth/login` — returns httponly cookie)
4. Logout endpoint (`POST /api/auth/logout`)
5. Session verification endpoint (`GET /api/auth/me`)
6. Auth middleware/dependency that checks JWT
7. Rate limiting on auth endpoints

#### Frontend (Next.js / React)
1. Auth context/provider with login/logout/signup methods
2. Protected route wrapper
3. Login page, register page, forgot password page
4. Auth API client that includes credentials
5. Redirect to login if unauthenticated
6. Handle token refresh

#### JWT Config
```python
ACCESS_TOKEN_EXPIRE = 15  # minutes
REFRESH_TOKEN_EXPIRE = 7  # days
ALGORITHM = "HS256"
```

### Deliverables
- Working auth flow (register → login → protected route)
- httponly cookie-based JWT
- Auth middleware on protected endpoints
- Login/register UI pages
- Session persistence across page reloads
