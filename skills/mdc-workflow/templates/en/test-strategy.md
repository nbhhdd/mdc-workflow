---
template: 04-testing/test-strategy.md (en)
usage: Defines test categories, acceptance criteria, and test storage standards.
---

# Test Strategy and Acceptance Criteria

> last_updated: {{CURRENT_DATE}}

## 1. Test Objectives

{{TEST_GOALS}}

Test categories:

{{TEST_CATEGORIES}}

## 2. Mandatory Baseline Tests

After every significant change, always run:

```bash
{{BUILD_CHECK_COMMANDS}}
```

## 3. Functional Test Acceptance Criteria

{{FUNCTIONAL_TEST_ITEMS}}

## 4. Performance Test Acceptance Criteria (if applicable)

{{PERFORMANCE_TEST_ITEMS}}

## 5. Security Test Acceptance Criteria (if applicable)

{{SECURITY_TEST_ITEMS}}

## 6. Test Code Storage Standards

All test code goes in:

```text
{{TEST_DIR}}
├── unit/
├── integration/
├── e2e/
├── fixtures/
└── manual/
```

> **Note**: If the test directories are empty, the current alternative QA approach relies on:
> 1. Build verification (`{{BUILD_CHECK_COMMANDS}}`) after every change.
> 2. Embedded diagnostic/debug overlays during development.
> 3. Browser preview mode for non-platform-specific features.
> 4. Manual acceptance checklists.
>
> **Next step**: Add unit tests for core algorithms and API integration tests as soon as feasible.
