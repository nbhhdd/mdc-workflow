---
template: AGENTS.ultra-minimal (en)
usage: Ultra-small project (< 5 source files). Just an AGENTS.md entry point.
---

# {{PROJECT_NAME}}

{{ONE_LINE_DESCRIPTION}}

## Tech Stack

{{TECH_STACK}}

## Build & Run

```bash
{{BUILD_COMMANDS}}
```

## File Structure

```
{{DIRECTORY_TREE}}
```

## AI Collaboration Rules

Before changing code:
1. Read relevant source files to understand the current implementation.
2. If `project-docs/` exists, read the relevant documentation.

After changing code:
1. Run build checks.
2. If you fixed a bug that took more than 30 minutes, append it to `project-docs/error-log.md`.

## Error Log

```markdown
# Error Log

## 1. [X] Resolved ({{DATE}})
- Symptom:
- Root cause:
- Correct approach:
```

## Prohibitions

{{RULES}}
