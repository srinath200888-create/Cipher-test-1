---
name: smell
description: Use to detect code smells and anti-patterns in a codebase. Covers 20+ code smells with detection patterns and refactoring guidance. Trigger keywords: smell, code smell, anti-pattern, refactor, technical debt, bad code
---

# Code Smell Detection

## What to Detect

### 1. God Class / God Function
- **Detection**: Class with > 500 lines, function with > 50 lines
- **Fix**: Extract classes/modules, split functions by responsibility

### 2. Long Parameter List
- **Detection**: Function with > 4 parameters
- **Fix**: Use config object/dto pattern

### 3. Duplicated Code
- **Detection**: Same code block appears in 3+ locations
- **Fix**: Extract to shared function/module

### 4. Switch Statements (spread across codebase)
- **Detection**: Type-dispatching switch/if-else chains in multiple places
- **Fix**: Strategy pattern or polymorphism

### 5. Shotgun Surgery
- **Detection**: One change requires editing 5+ files
- **Fix**: Consolidate related logic

### 6. Primitive Obsession
- **Detection**: Using raw strings/numbers instead of value objects
- **Fix**: Create typed wrappers (Email, PhoneNumber, Money)

### 7. Feature Envy
- **Detection**: Method accesses another class's data more than its own
- **Fix**: Move method to the class it actually cares about

### 8. Data Class
- **Detection**: Class with only fields, no behavior
- **Fix**: Move behavior into the class

### 9. Lazy Class
- **Detection**: Class that doesn't do enough to justify its existence
- **Fix**: Inline into its usage sites

### 10. Speculative Generality
- **Detection**: Unused interfaces, abstract classes, generics "just in case"
- **Fix**: YAGNI — remove if not used

### 11. Message Chain
- **Detection**: `a.b().c().d()` — train wreck
- **Fix**: Demeter's Law — hide delegation

### 12. Middle Man
- **Detection**: Class that mostly delegates to another class
- **Fix**: Remove and use the real class directly

### 13. Inappropriate Intimacy
- **Detection**: Two classes that know too much about each other's internals
- **Fix**: Extract common logic, reduce coupling

### 14. Alternative Classes with Different Interfaces
- **Detection**: Two classes do the same thing but with different method names
- **Fix**: Unify interface

### 15. Refused Bequest
- **Detection**: Subclass that doesn't use inherited members
- **Fix**: Replace inheritance with composition

### 16. Temporary Field
- **Detection**: Field only set in certain code paths
- **Fix**: Extract to separate object, only create when needed

### 17. Comments (as smell)
- **Detection**: Comments explaining WHAT (not WHY) — code should be self-documenting
- **Fix**: Rename, extract, simplify

### 18. Dead Code
- **Detection**: Unused functions, unreachable branches, commented code
- **Fix**: Delete it

## Output Format
```
Found [N] code smells:
1. [Smell Type] — [file:line]
   Problem: [one sentence]
   Fix: [one sentence]
```
