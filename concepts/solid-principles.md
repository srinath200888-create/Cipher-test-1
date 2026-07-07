# SOLID Principles

## S — Single Responsibility Principle
A class should have only one reason to change.

**Bad**: A `User` class that handles database storage, email sending, and JSON serialization.
**Good**: Separate `User` (data), `UserRepository` (storage), `EmailService` (notifications), `UserSerializer` (JSON).

## O — Open/Closed Principle
Software entities should be open for extension but closed for modification.

**Bad**: A `PaymentProcessor` class with if/else for each payment type.
**Good**: A `PaymentMethod` interface with implementations for `CreditCardPayment`, `PayPalPayment`, etc.

```typescript
interface PaymentMethod {
  process(amount: number): Promise<Result>;
}

class CreditCardPayment implements PaymentMethod { ... }
class PayPalPayment implements PaymentMethod { ... }
```

## L — Liskov Substitution Principle
Subtypes must be substitutable for their base types.

**Bad**: A `Rectangle` class with setWidth/setHeight, and a `Square` subclass that violates width/height independence.
**Good**: If a subclass changes behavior, it shouldn't be a subclass. Use composition instead.

## I — Interface Segregation Principle
Clients should not be forced to depend on interfaces they don't use.

**Bad**: A `MultiFunctionPrinter` interface with `print()`, `scan()`, `fax()`, `staple()`.
**Good**: Separate interfaces: `Printer`, `Scanner`, `Fax`, `Stapler`.

```typescript
interface Printer { print(doc: Document): void; }
interface Scanner { scan(): Document; }
// Each class implements only what it needs
```

## D — Dependency Inversion Principle
Depend on abstractions, not concretions.

**Bad**: A `UserService` that directly creates a `PostgreSQLUserRepository`.
**Good**: A `UserService` that takes a `UserRepository` interface, with any implementation injected.

```typescript
interface UserRepository { find(id: string): User; }

class UserService {
  constructor(private repo: UserRepository) {}
  // Works with any UserRepository implementation
}
```
