---
template: 10-errors/error-archive.md (en)
usage: Bug knowledge base. Record every failed approach, root cause, and correct solution. Prevents repeated mistakes.
---

# Error Archive

> last_updated: {{CURRENT_DATE}}
> Purpose: Record failed approaches attempted during development to avoid repeating mistakes.
> Rule: After encountering and resolving each new problem, append an entry.

---

## Deprecated Approaches

### 1. {{BUG_TITLE}} [X] Deprecated

- **Approach**: {{ATTEMPTED_APPROACH}}
- **Symptom**: {{OBSERVED_BEHAVIOR}}
- **Root Cause**: {{ROOT_CAUSE}}
- **Lesson**: {{LESSON_LEARNED}}
- **Correct**: {{CORRECT_APPROACH}}

---

## Verified Working Approaches

| Approach | Description | Version/Date |
|----------|------------|-------------|
| {{SOLUTION_NAME}} | {{SOLUTION_DESC}} | {{DATE}} |

---

## Debugging Methodology

Troubleshooting order when encountering an issue:

1. Add logging/breakpoints → confirm the signal reaches the target.
2. Write an isolated test → directly call the suspected module → confirm independent reproducibility.
3. Check permissions/configuration → confirm runtime prerequisites are met.
4. Check framework conflicts → confirm no third-party library is intercepting or modifying behavior.
5. Check types/performance → confirm correct data types, no performance bottlenecks.

---

## Format for New Entries

```markdown
## N. {{BUG_TITLE}} [X] Deprecated ({{DATE}})

- **Approach**: {{ATTEMPTED_APPROACH}}
- **Symptom**: {{OBSERVED_BEHAVIOR}}
- **Root Cause**: {{ROOT_CAUSE}}
- **Lesson**: {{LESSON_LEARNED}}
- **Correct**: {{CORRECT_APPROACH}}
```
