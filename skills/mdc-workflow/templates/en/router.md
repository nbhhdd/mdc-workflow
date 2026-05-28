---
template: 00-overview/README.md (en)
usage: Documentation hub + TS-Protocol + metadata index. The central router of the doc system.
---

# {{PROJECT_NAME}} Documentation Center

> last_updated: {{CURRENT_DATE}}

This is the unified entry point for development, maintenance, testing, refactoring, and product decisions in {{PROJECT_NAME}}.

## 1. Project Positioning

> {{PROJECT_POSITIONING}}

## 2. Document Categories

| Directory | ID | Purpose |
|-----------|----|---------|
| `00-overview` | - | Entry point, routing, TS-Protocol. |
{{DOC_CATEGORIES}}

## 3. Recommended Reading Order

For newcomers (linear read):

{{READING_ORDER}}

For AI collaboration (task-routed):

> Do not read all documents. Look up your task type in Section 5 (TS-Protocol trigger rules) or the Router table in `06-standards/code-and-ai-collaboration.md` Section 3. Only load the documents relevant to the current task.

## 4. Current Development Progress

Current phase: {{CURRENT_PHASE_GOAL}}

| Priority | Feature | Status |
|----------|---------|--------|
{{PROGRESS_TABLE}}

## 5. Document Metadata & Timestamp Protocol [TS-Protocol]

> This is the core mechanism of the project's documentation system. It ensures that AI automatically maintains doc-code consistency after every code change, eliminating "doc rot leading to AI cognitive drift."

### 5.1 Document Metadata Index

Every formal document MUST include a `last_updated` field in its header (format: `YYYYMMDD-HHMM`). Current document status:

| ID | Document | Path | Last Updated | Linked Code Modules |
|----|----------|------|-------------|---------------------|
{{DOC_METADATA_TABLE}}

### 5.2 Trigger Rules: Which Changes Require Which Doc Updates

| Change Type | Docs That MUST Be Updated | Notes |
|-------------|--------------------------|-------|
| Core business logic changes | {{TECH_DOCS}} | Tech architecture + audit docs |
| Feature add/remove/change | {{FEATURE_DOCS}} | Feature planning doc |
| Major bug fix (interaction/rendering/window) | {{ERROR_DOCS}} | Append entry to error archive |
| UI component structure changes | {{TECH_DOCS}} | Update directory structure and component inventory |
| File/directory changes | {{FILE_DOCS}} | File organization standards |
| AI/model invocation logic changes | {{AI_DOCS}} | AI-related docs |
| New or modified tests | {{TEST_DOCS}} | Test strategy doc |
| Product direction/priority changes | {{DIRECTION_DOCS}} | Direction report |
| Coding standard or collaboration rule changes | {{CODE_DOCS}} | Code standards doc |

### 5.3 Watchdog Mechanism: AI Must Self-Check Before Execution

Before modifying any code, the AI MUST:

1. **Identify task type**: Which category above does this change fall under?
2. **Load relevant docs**: Per the trigger rules, read ONLY the required documents.
3. **Verify timestamps**: If a document's `last_updated` is significantly older than the code's last modification time, the document may be stale.
4. **Handle staleness**: Stale document found → sync the document FIRST, then write code (never the reverse).

### 5.4 Timestamp Update Procedure

After completing a task and before outputting final code, the AI MUST:

1. Update the document's `last_updated` timestamp in this index table.
2. Update the `last_updated` field in the document's header.
3. Append or modify the affected sections in the document.

> This mechanism achieves "human-driven → AI-driven": AI writes code → AI maintains docs automatically. Humans only review results.
