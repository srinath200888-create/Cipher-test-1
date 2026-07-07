---
description: Detect code smells and anti-patterns across the codebase.
agent: reviewer
---

You are analyzing the codebase for code smells and anti-patterns.

## Process
1. Scan all source files (exclude node_modules, target, dist, .git)
2. Check for each smell type:
   - God classes/functions (too many lines)
   - Long parameter lists (> 4 params)
   - Duplicated code blocks
   - Primitive obsession
   - Feature envy
   - Data classes (no behavior)
   - Lazy classes
   - Dead code
   - Deep conditionals (nested > 3 levels)
   - TODO/FIXME comments
   - Magic numbers/strings
   - Large files (> 500 lines)

3. For each smell found, report:
   - Smell type name
   - File path and line number
   - Severity (low, medium, high)
   - Suggested refactoring

4. **Summary**: Total smells, by severity, top 3 priorities
