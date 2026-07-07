# Design Patterns

## Creational

### Factory
Creates objects without specifying the exact class.
```typescript
class DialogFactory {
  static create(type: "alert" | "confirm"): Dialog {
    return type === "alert" ? new AlertDialog() : new ConfirmDialog();
  }
}
```

### Builder
Constructs complex objects step by step.
```typescript
new QueryBuilder()
  .select("id", "name")
  .from("users")
  .where("active = true")
  .limit(10);
```

### Singleton
Ensures a class has only one instance.
```typescript
class Database {
  private static instance: Database;
  static getInstance(): Database {
    if (!Database.instance) Database.instance = new Database();
    return Database.instance;
  }
}
```

## Structural

### Repository
Mediates between domain and data mapping layers.
```typescript
interface UserRepository {
  findById(id: string): User | null;
  save(user: User): void;
  delete(id: string): void;
}
```

### Adapter
Allows incompatible interfaces to work together.
```typescript
class StripeAdapter implements PaymentProcessor {
  constructor(private stripe: StripeAPI) {}
  process(amount: number) { return this.stripe.charge(amount); }
}
```

### Dependency Injection
Passes dependencies from outside rather than creating them internally.
```typescript
class UserService {
  constructor(private repo: UserRepository, private email: EmailService) {}
}
```

## Behavioral

### Strategy
Defines a family of algorithms and makes them interchangeable.
```typescript
interface SortStrategy { sort(data: number[]): number[]; }
class QuickSort implements SortStrategy { ... }
class MergeSort implements SortStrategy { ... }
```

### Observer
Notifies multiple objects about state changes.
```typescript
class EventEmitter {
  private listeners: Map<string, Function[]> = new Map();
  on(event: string, fn: Function) { ... }
  emit(event: string, data: any) { ... }
}
```

### Command
Encapsulates a request as an object.
```typescript
interface Command { execute(): void; undo(): void; }
class SaveFileCommand implements Command {
  constructor(private file: File, private content: string) {}
  execute() { this.file.write(this.content); }
  undo() { this.file.write(this.previousContent); }
}
```

## When to Use Which

| Pattern | Use When |
|---------|----------|
| Factory | Object creation logic is complex or conditional |
| Repository | You need to abstract data storage |
| Strategy | You have multiple algorithms that should be swappable |
| Observer | Multiple components need to react to events |
| Command | You need undo/redo, queuing, or logging of actions |
| Adapter | You're integrating with a third-party library |
| Singleton | You need exactly one instance of a resource |
