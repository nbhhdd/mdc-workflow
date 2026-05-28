---
template: 07-files/project-file-standards.md (en)
usage: Defines project directory structure, resource classification, and file naming rules. Key reference for onboarding and AI collaboration.
---

# Project File Organization Standards

> last_updated: {{CURRENT_DATE}}

## 1. Objective

Project files must support long-term maintenance.

Requirements:

1. Centralized documentation.
2. Layered source code.
3. Categorized static resources.
4. Isolated test code.
5. Preserved version archives.
6. No temporary files polluting the root directory.

## 2. Recommended Root Directory Structure

```text
{{PROJECT_NAME}}/
├── {{SRC_DIR}}              # Production frontend/application source
├── {{BACKEND_DIR}}          # Production backend source
├── {{PUBLIC_DIR}}           # Runtime static resources
├── {{ASSETS_SOURCE_DIR}}    # Original source materials and creation files
├── {{TEST_DIR}}             # Test code
├── project-docs/            # Project documentation center
├── version-archive/         # Version archives
├── scripts/                 # Utility scripts
├── dist/                    # Build output (do not edit manually)
└── node_modules/            # Dependencies (do not edit manually)
```

## 3. Production Code vs Test Code

Production code:

```text
{{SRC_DIR}}
{{BACKEND_DIR}}
```

Test code:

```text
{{TEST_DIR}}
├── unit/
├── integration/
├── e2e/
├── fixtures/
└── manual/
```

Rules:

1. Test code must not scatter across the root directory.
2. Temporary verification scripts go in `scripts/experiments/`.
3. Test fixtures go in `{{TEST_DIR}}/fixtures/`.

## 4. Static Resource Standards

Runtime resources:

```text
{{PUBLIC_DIR}}
├── assets/
├── sounds/
└── ui/
```

Source materials:

```text
{{ASSETS_SOURCE_DIR}}
├── characters/
├── voice/
├── prompts/
└── references/
```

## 5. Documentation Standards

All formal documentation lives in:

```text
project-docs/
```

## 6. Version Retention Standards

Directory:

```text
version-archive/
├── releases/
├── snapshots/
├── changelog/
└── migration-notes/
```

Each significant version must record:

1. Version number.
2. Date.
3. Feature description.
4. Known issues.
5. Data migration notes.

## 7. Migration Strategy

Do not move everything at once.

Recommended:

1. Create new directories first.
2. Place all new files in new directories.
3. Gradually migrate old files.
4. Run builds after each migration.
5. Update all references when paths change.
