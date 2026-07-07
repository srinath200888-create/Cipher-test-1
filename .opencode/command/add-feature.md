---
description: Plan and implement a new feature end-to-end with tests and documentation.
agent: builder
---

You are adding a new feature to this project.

## Feature Description
$ARGUMENTS

## Process

1. **Understand the codebase**
   - Read key files to understand architecture
   - Check existing patterns and conventions

2. **Plan the feature**
   - What files need to change?
   - What new files need to be created?
   - Data model changes? Migration needed?
   - API changes? New endpoints?
   - UI changes? New components?

3. **Implement**
   - Backend/foundation first (data layer, business logic)
   - Then API/commands
   - Then UI/components
   - Handle loading, empty, error, and success states

4. **Add tests**
   - Unit tests for business logic
   - Integration test for API/commands
   - Component test for UI (if applicable)

5. **Verify**
   - All existing tests still pass
   - New tests pass
   - Feature works end-to-end
   - Edge cases handled

6. **Document**
   - Update README if needed
   - Add JSDoc/docstrings to new public API
   - Update CHANGELOG
