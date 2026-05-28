---
template: AGENTS.md (en)
usage: Project root entry point. AI reads this first every session.
---

# {{PROJECT_NAME}} Development Collaboration Standards

## Project Positioning

{{PROJECT_NAME}} is {{ONE_LINE_DESCRIPTION}}.

Core directions:

{{CORE_DIRECTIONS}}

## Documentation Entry Point

All formal documentation starts here:

```text
project-docs/00-overview/README.md
```

## Before Changing Code

1. Read relevant docs (check the Router table in `project-docs/06-standards/code-and-ai-collaboration.md` Section 3)
2. Verify document timestamps are not stale (see `project-docs/00-overview/README.md` TS-Protocol section)
3. Read relevant source code.
4. Identify which module/layer this change belongs to.
5. Pass every item in the Self-Reflection checklist (`project-docs/06-standards/code-and-ai-collaboration.md` Self-Reflection section)

## After Changing Code

1. Update relevant docs (per TS-Protocol trigger rules).
2. Update doc timestamps.
3. Run:

```bash
{{BUILD_COMMANDS}}
```

4. Log any unfinished risks.

## Directory Rules

Application source code:

```text
{{SRC_DIR}}
```

Backend source code:

```text
{{BACKEND_DIR}}
```

Test code:

```text
{{TEST_DIR}}
```

Formal documentation:

```text
project-docs/
```

Version archives:

```text
version-archive/
```

Source assets:

```text
{{ASSETS_SOURCE_DIR}}
```

Runtime static resources:

```text
{{PUBLIC_DIR}}
```

Utility scripts:

```text
scripts/
```

## Prohibitions

1. No temporary scripts in the project root.
2. No test code mixed into production source directories.
3. No raw asset files dumped into source directories.
4. No large refactors without documentation.
{{ADDITIONAL_RULES}}
