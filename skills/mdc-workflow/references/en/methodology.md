---
type: reference
purpose: Explains WHY the MDC workflow is effective and the design intent behind each component. Suitable for team sharing or onboarding.
---

# MDC Workflow Methodology

## 1. Why Multi-Document Co-driving?

### 1.1 The Nature of LLMs: Probability Engines

LLMs are fundamentally **probability prediction engines** based on parameterized weights. They don't "understand" your project — they compute "what's the most likely next token?"

- Vague input → diverging probability distribution → hallucinations
- Precise input → converging probability distribution → high-quality output

**Core insight**: AI output quality isn't determined by the AI alone — it's determined by the **precision of your constraints**.

### 1.2 The Single-Document Bottleneck

Traditional approach: dump all requirements, architecture, and conventions into one big document. Problems:

1. **Context dilution**: A 50-page document fed to AI → attention mechanism diluted by irrelevant information
2. **Modification coupling**: Changing one section risks breaking the entire structure
3. **Inefficient lookup**: AI can't quickly locate "which section is relevant to this bug fix"

### 1.3 The Multi-Document Advantage

Split docs into independent modules. Feed AI only what the current task needs:

```
Bug fix → only read "error archive" + "tech architecture"
New feature → only read "feature plan" + "tech architecture" + "code standards"
Refactoring → only read "audit plan" + "code standards" + "file standards"
```

This is the "high cohesion, low coupling" principle of software engineering mapped onto prompt engineering.

## 2. TS-Protocol: Timestamp Closed-Loop Update Mechanism

### 2.1 Why It's Necessary

In long-cycle human-AI collaboration, the most common failure mode is:

> Code iterated N versions → docs stuck at V1 → AI reads stale docs → produces code that doesn't match current architecture

This is a **human factors failure**, not an AI failure. The human forgot to update the docs.

### 2.2 How TS-Protocol Solves It

TS-Protocol shifts "update documentation" from the human's to-do list to the AI's automated workflow:

```
AI modifies code → checks trigger rules → knows which docs to update → updates docs → updates timestamps
```

Core value: **From "human-driven" to "AI-driven"**.

### 2.3 Watchdog Mechanism

Timestamps also serve as sentinels:

```
AI asked to modify code
  → reads linked docs' timestamps
  → compares timestamp vs. code modification time
  → if doc is stale: sync doc first, then write code
  → if doc is current: proceed directly
```

## 3. Router: Task-to-Document Mapping

### 3.1 Design Intent

The Router is a lightweight **Orchestrator**. It does one thing:

> Given task type → determine which documents to load

### 3.2 Why Not Just Read Everything

Even with 1M+ context windows, AI attention still dilutes across long contexts. Irrelevant documents are **noise** that interferes with the AI's extraction of core information. Selectively loading documents is like giving AI a "focus lens."

### 3.3 Routing Rule Design Principles

- **Required**: Documents that would cause errors if NOT read (e.g., error archive before fixing a bug)
- **Optional**: Helpful but not strictly necessary
- **Not listed**: Completely irrelevant to the current task

## 4. Self-Reflection: AI Pre-Output Checklist

### 4.1 Why Explicit Self-Reflection

Even with reasoning capabilities, modern LLMs in "quick-answer mode" tend to:

- Ignore user-specified constraints
- Produce code that looks correct but violates architectural principles
- Introduce unnecessary complexity

### 4.2 Checklist Psychology

11 items across 5 groups, deliberately paced:

| Group | Items | Psychological Effect |
|-------|-------|---------------------|
| Positioning | 2 | "First, think about WHO and WHAT I'm building for" |
| Architecture | 3 | "Then check if the skeleton is sound" |
| Documentation | 2 | "Confirm documentation sync responsibility" |
| Simplicity | 2 | "Pull back — don't over-engineer" |
| Security | 2 | "Final check on baseline risks" |

From "big picture" narrowing to "specific risks" — mirrors human deliberative decision paths.

### 4.3 Why 11 Items, Not 3 or 30

- 3 items: too coarse, misses critical risk surfaces
- 30 items: too long, AI may skip or rush through
- 11 items: ~30 seconds to complete a round of self-check, cost is negligible

## 5. Boundaries and Limitations

### When to Use

- Projects requiring long-term maintenance (≥3 months)
- Multi-person / multi-round AI collaboration
- Projects with non-trivial technical complexity

### When NOT to Use

- One-off scripts or prototypes
- Very small projects with minimal code assets
- Solo projects with no AI collaboration

### Common Failure Modes

1. **Not persisting**: Initial enthusiasm fades, docs stop being updated → back to square one
2. **Over-documentation**: Writing docs for every tiny function → maintenance cost exceeds value
3. **AI skipping the checklist**: Sometimes AI ignores self-reflection → must repeatedly emphasize in AGENTS.md
