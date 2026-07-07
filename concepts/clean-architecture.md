# Clean Architecture

## The Dependency Rule

Source code dependencies must point **inward**. Nothing in an inner circle can know about something in an outer circle.

```
┌──────────────────────────────┐
│        Frameworks &          │
│         Drivers              │
│  (Web, DB, UI, Devices)     │
│  ┌────────────────────────┐ │
│  │  Interface Adapters    │ │
│  │  (Controllers, Gateways│ │
│  │  ┌──────────────────┐ │ │
│  │  │  Application     │ │ │
│  │  │  (Use Cases)     │ │ │
│  │  │  ┌────────────┐  │ │ │
│  │  │  │  Domain    │  │ │ │
│  │  │  │ (Entities) │  │ │ │
│  │  │  └────────────┘  │ │ │
│  │  └──────────────────┘ │ │
│  └────────────────────────┘ │
└──────────────────────────────┘
```

## Layers

### Domain (Inner)
- Enterprise business rules
- Entities (core business objects)
- Value objects
- Repository interfaces (ports)
- No external dependencies

### Application
- Use cases (application-specific business rules)
- Input/Output DTOs
- Orchestrates domain objects
- Depends only on domain

### Interface Adapters
- Controllers (handle HTTP requests)
- Presenters (format output)
- Gateways (implement repository interfaces)
- Converts data between use cases and external formats

### Frameworks & Drivers (Outer)
- Database drivers
- Web framework
- UI framework
- External APIs

## Benefits
- **Testable** — Domain and application layers can be tested without infrastructure
- **Framework-independent** — The business logic doesn't know about your web framework
- **Database-independent** — Swap SQLite for PostgreSQL without changing business logic
- **UI-independent** — Change the UI without affecting the backend

## Implementation in Practice

```
src/
├── domain/
│   ├── entities/
│   │   └── user.py
│   └── repositories/
│       └── user_repository.py  (interface)
├── application/
│   ├── use_cases/
│   │   └── create_user.py
│   └── dto/
│       └── user_dto.py
├── infrastructure/
│   ├── persistence/
│   │   └── sqlalchemy_user_repository.py
│   └── api/
│       └── external_service.py
├── interfaces/
│   ├── web/
│   │   └── user_controller.py
│   └── cli/
│       └── user_commands.py
└── main.py
```
