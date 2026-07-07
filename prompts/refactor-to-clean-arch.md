# Refactor to Clean Architecture

Use this prompt to refactor a messy codebase into clean architecture.

## Prompt

Refactor this codebase following Clean Architecture principles.

### Principles
- **Dependency Rule**: Dependencies point inward (UI → Application → Domain → Infrastructure)
- **Separation of Concerns**: Each layer has a single responsibility
- **Testability**: Business logic is testable without infrastructure
- **Loose Coupling**: Layers depend on abstractions, not concretions

### Structure
```
src/
├── domain/          # Enterprise business rules
│   ├── entities/    # Core business objects
│   └── value-objects/
├── application/     # Application-specific rules
│   ├── use-cases/   # What the app does
│   ├── ports/       # Interfaces/inbound ports
│   └── dto/         # Data transfer objects
├── infrastructure/  # External concerns
│   ├── persistence/ # Database implementations
│   ├── api/         # External API clients
│   └── config/      # Configuration
├── interfaces/      # UI/API layer
│   ├── web/         # Controllers, routes
│   └── cli/         # CLI commands
└── main.py          # Composition root
```

### Process
1. Identify core domain entities and business rules
2. Define interfaces (ports) for external dependencies
3. Move business logic to domain/application layers
4. Implement infrastructure adapters
5. Update UI to use use-cases via ports
6. Wire everything in the composition root
7. Ensure all existing tests still pass

### Deliverables
- Code organized by clean architecture layers
- Business logic separated from infrastructure
- Dependency injection at composition root
- All existing functionality preserved
- Improved testability
