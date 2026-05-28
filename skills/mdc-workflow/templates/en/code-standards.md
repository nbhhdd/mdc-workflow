---
template: 06-standards/code-and-ai-collaboration.md (en)
usage: Coding standards + Task-to-Document Router + Self-Reflection checklist. Core file for AI collaboration.
---

# Code and AI Collaboration Standards

> last_updated: {{CURRENT_DATE}}

## 1. General Principles

Code must serve long-term maintainability.

Priorities:

1. Clarity.
2. Stability.
3. Testability.
4. Extensibility.
5. Readability.

Do not pursue:

1. Premature abstraction.
2. Clever-but-obscure patterns.
3. Sweeping refactors.
4. Unverified complex architectures.

## 2. Knowledge Base Index

The project's complete documentation index, Timestamp Protocol (TS-Protocol), and document routing tables:

```text
project-docs/00-overview/README.md
```

Read this entry document before every collaboration session to confirm document versions are synchronized with code.

## 3. Task-to-Document Router [Router]

AI loads documents on-demand based on task type. Avoid polluting context with irrelevant information.

| Task Type | Required Docs | Optional Docs | Notes |
|-----------|--------------|---------------|-------|
| Bug fix / interaction issue | {{ERROR_DOCS}}, {{TECH_DOCS}} | {{TEST_DOCS}} | Check error archive FIRST to avoid repeating past mistakes |
| New feature | {{FEATURE_DOCS}}, {{TECH_DOCS}}, {{CODE_DOCS}}, {{FILE_DOCS}} | {{TEST_DOCS}} | Confirm feature boundaries and file placement |
| Refactoring | {{AUDIT_DOCS}}, {{CODE_DOCS}}, {{FILE_DOCS}} | {{DIRECTION_DOCS}} | Follow audit plan; do not cross scope boundaries |
| New assets/resources | {{FILE_DOCS}}, {{TECH_DOCS}}(resources section) | {{FEATURE_DOCS}} | Understand resource loading mechanism and directory rules |
| AI/model related | {{AI_DOCS}}, {{TECH_DOCS}}(AI section) | {{FEATURE_DOCS}} | Understand AI layered architecture |
| Writing tests | {{TEST_DOCS}}, {{TECH_DOCS}} | {{ERROR_DOCS}} | Reference acceptance criteria |
| UI/layout/style changes | {{TECH_DOCS}}(UI section) | {{FEATURE_DOCS}} | Confirm frontend-backend responsibility boundaries |
| Interaction (drag/click/events) | {{ERROR_DOCS}}, {{TECH_DOCS}} | - | Error archive is MANDATORY reading |

## 4. Reference Standards

Recommended references:

1. Framework official style guides and examples.
2. Language-specific coding conventions.
3. Existing code patterns within the project.

## 5. AI Collaboration Rules

Before every code change:

1. Read relevant files first.
2. Confirm the current architecture.
3. Do not refactor beyond the task scope.
4. Do not delete content the user hasn't confirmed.
5. Documentation first, large changes second.

After every code change:

1. Update relevant documentation.
2. Run build checks.
3. Describe the scope of changes.
4. Flag any unfinished risks.

## 6. Code Organization Rules

### Frontend

Rules:

1. One component = one clear responsibility.
2. Full windows use `views/`.
3. Reusable UI uses `components/`.
4. State lives in `stores/`.
5. Business logic lives in `engine/` or `services/`.
6. Framework calls wrapped in `composables/` or dedicated services.

### Backend

Rules:

1. Commands/routes registered centrally.
2. Business logic NOT crammed into the entry file.
3. Modules organized by domain.
4. Commands return explicit error messages.

## 7. Naming Conventions

1. File names use kebab-case or framework conventions.
2. Components use PascalCase.
3. Functions start with verbs.
4. Types use PascalCase.
5. Constants use UPPER_SNAKE_CASE.

## 8. Prohibitions

1. No cross-layer coupling (e.g., admin features crammed into a mini frontend window).
2. No large undocumented modules.
3. No hardcoded business data without explaining its source.
4. No mixing test code with production code.
5. No temporary fix scripts committed to the project root.

## 9. Build Requirements

After significant changes, always run:

```bash
{{BUILD_CHECK_COMMANDS}}
```

## 10. Documentation Requirements

New features must update at minimum:

1. Feature/requirements documentation.
2. Technical documentation.
3. Test documentation or acceptance criteria.

## 11. AI Pre-Output Self-Reflection Checklist [Self-Reflection]

> This is the core quality mechanism for AI collaboration in this project. Before outputting ANY code solution, the AI MUST go through each item and confirm it passes.

### Positioning Check

1. Does this change align with "{{PROJECT_POSITIONING_SHORT}}", or does it regress into something else?
2. Did I cram features into a layer where they don't belong? (If yes, redo.)

### Architecture Check

3. Did I introduce new hardcoded paths or magic numbers? (Must be config/manifest-driven.)
4. Is new code in the right directory? (Check file organization standards.)
5. Does it follow the boundary: "components don't do algorithms, stores don't do IO, engine doesn't do UI"?

### Documentation Check

6. Does this change require updating any documents? (Check TS-Protocol trigger rules.)
7. If docs need updating, did I actually update the timestamps?

### Simplicity Check

8. Is there a simpler way to achieve this? Did I introduce unnecessary abstractions or dependencies?
9. Am I over-engineering for a "maybe future" use case? (YAGNI principle.)

### Security Check

10. Could sensitive data be accidentally persisted or leaked?
11. Is user input being directly concatenated into commands or queries?

> Only when all 11 items pass may code output begin.
