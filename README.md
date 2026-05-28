<p align="center">
  <h1 align="center">MDC Workflow</h1>
  <p align="center"><strong>Stop your docs from rotting. Let AI maintain them automatically.</strong></p>
  <p align="center">
    <a href="#"><img src="https://img.shields.io/badge/version-2.0.0-blue" alt="Version"></a>
    <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green" alt="License"></a>
    <a href="#"><img src="https://img.shields.io/badge/platform-Claude%20Code-purple" alt="Platform"></a>
    <a href="#"><img src="https://img.shields.io/badge/languages-中文%20%7C%20English-orange" alt="Languages"></a>
  </p>
</p>

---

## The Problem / 痛点

You're 3 weeks into a project. The AI has helped you write 50 files. But your project docs still describe the architecture from week 1. **The AI reads stale docs and generates wrong code.** You're spending more time fixing AI's mistakes than writing features.

Sound familiar?

This happens because **humans are the bottleneck in the doc-code sync loop**. We write code, but we forget to update the docs. The AI then reads outdated docs and produces code that doesn't match reality. Rinse and repeat.

## The Solution / 解决方案

**MDC Workflow** automates the doc-code synchronization loop. It's a Claude Code skill that sets up a self-maintaining documentation system in your project.

> AI writes code → AI checks which docs need updating → AI updates docs → AI updates timestamps
>
> The human only reviews. The loop is closed.

### Four Mechanisms, One System

| Mechanism | What It Does | The "Before vs After" |
|-----------|-------------|----------------------|
| **Multi-Document Decoupling** | Split docs by topic. Feed AI only what's relevant. | Before: AI reads a 50-page dump, misses key details. After: AI reads 2 precise docs, nails the fix. |
| **TS-Protocol** (Timestamp Closed-Loop) | Every doc has a `last_updated` timestamp. AI auto-updates it. | Before: docs frozen at week 1. After: timestamps prove docs are current. |
| **Router** (Task→Document Mapping) | 8 task types mapped to exactly which docs to read. | Before: "which doc should I read?" After: "bug fix → read D12 + D03". |
| **Self-Reflection** (11-Item Checklist) | AI must pass 11 checks before outputting code. | Before: AI ships code that violates architecture. After: AI catches its own mistakes. |

### Built from Real Pain

This isn't a theoretical framework. It was developed during the construction of [Buddy AI](https://github.com/user/buddy-ai), a Tauri + Vue 3 desktop application. The error archive contains **13 documented failed approaches** — each one a lesson that this system now prevents from recurring.

---

## Quick Start / 快速开始

### 1. Install

```bash
# Clone the repo
git clone https://github.com/nbhhdd/mdc-workflow.git
cd mdc-workflow

# Install as a Claude Code plugin
cc --plugin-dir .
```

### 2. Use

In any project, type:

```
/mdc-workflow
```

The AI will ask:
1. What's your project called? What does it do?
2. What's your tech stack?
3. How big is the project? (ultra-minimal → full)
4. 中文 or English?

Then it generates your documentation system in **under 2 minutes**.

### 3. Verify

```bash
# Check that all docs are in sync with code
bash skills/mdc-workflow/scripts/check-docs.sh --verbose
```

---

## What You Get / 生成的文件

### Ultra-Minimal (personal tools, < 5 files)

```
.
└── AGENTS.md              ← AI collaboration entry point
```

### Standard (teams of 3-10, 6+ month projects)

```
.
├── AGENTS.md                          ← AI enters workflow here every session
└── project-docs/
    ├── 00-overview/README.md          ← Router + TS-Protocol + metadata index
    ├── 04-testing/test-strategy.md    ← Test acceptance criteria
    ├── 06-standards/code-and-ai-collaboration.md  ← Router table + Self-Reflection
    ├── 07-files/project-file-standards.md         ← Directory & resource rules
    └── 10-errors/error-archive.md                ← Bug knowledge base
```

### Full (teams > 10, 2+ year projects)

Standard + `01-direction/` + `02-features/` + `03-architecture/` + `05-ai/` + `08-versions/`

---

## How It Compares / 与竞品对比

| | MDC Workflow | superpowers | claude-md-improver | attune |
|---|---|---|---|---|
| Doc-code sync automation | ✅ TS-Protocol | ❌ | ❌ | ❌ |
| Task→document routing | ✅ 8 types | ❌ | ❌ | ❌ |
| AI self-reflection gate | ✅ 11 items | ❌ | ❌ | ❌ |
| Bilingual (中/EN) | ✅ | ❌ | ❌ | ❌ |
| Scale tiers | ✅ 4 tiers | ❌ | ❌ | ❌ |
| Verification script | ✅ bash | ❌ | ❌ | ❌ |
| Full dev lifecycle | ❌ | ✅ | ❌ | ✅ |
| Instant setup | ❌ (2 min) | ✅ (30s) | ✅ (10s) | ✅ (30s) |

**MDC Workflow is the only tool that automates doc-code synchronization.** Other tools help you write better docs or manage workflows — but none close the loop between code changes and doc updates.

---

## The TS-Protocol in Action / TS-Protocol 工作原理

```
┌──────────┐     ┌──────────────┐     ┌────────────┐
│ AI edits │────▶│ Check Router │────▶│ Which docs  │
│  a file  │     │   table      │     │ to update?  │
└──────────┘     └──────────────┘     └──────┬─────┘
                                             │
                    ┌────────────────────────┘
                    ▼
┌──────────┐     ┌──────────────┐     ┌────────────┐
│ Doc &    │◀────│  Append /    │◀────│ Update the  │
│timestamp │     │  modify doc  │     │ relevant    │
│ updated  │     │  sections    │     │ documents   │
└──────────┘     └──────────────┘     └────────────┘

Next session:
┌──────────┐     ┌──────────────┐     ┌────────────┐
│ AI reads │────▶│ Checks doc   │────▶│ Stale? Sync │
│ AGENTS.md│     │ timestamps   │     │ first, then │
│          │     │ vs git log   │     │ write code  │
└──────────┘     └──────────────┘     └────────────┘
```

---

## Project Structure / 项目结构

```
mdc-workflow/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest (v2.0.0)
├── skills/
│   └── mdc-workflow/
│       ├── SKILL.md             # Main skill definition
│       ├── scripts/
│       │   └── check-docs.sh    # Doc timestamp validator
│       ├── references/
│       │   ├── methodology.md   # 中文方法论
│       │   └── en/
│       │       └── methodology.md  # English methodology
│       └── templates/
│           ├── zh/ (8 files)    # Chinese templates
│           └── en/ (7 files)    # English templates
├── .gitignore
├── LICENSE
└── README.md
```

---

## Real-World Usage / 实战案例

This system was developed and battle-tested on **[Buddy AI](https://github.com/user/buddy-ai)**, a Tauri 2 + Vue 3 + PixiJS desktop companion application:

- **12 documents** maintained across 10 directories
- **13 failed interaction approaches** documented in the error archive (each saved hours of repeated debugging)
- **TS-Protocol** caught a document contradiction between two architecture docs that would have caused implementation errors
- Reduced AI context pollution by ~60% (AI reads 2-3 targeted docs instead of the full 50-page dump)

---

## FAQ

**Q: Does this work with Cursor / Windsurf / Copilot?**
A: The generated documents (`AGENTS.md`, `project-docs/`) work with any AI coding tool that reads project files. The `/mdc-workflow` skill itself is Claude Code-specific.

**Q: Do I need to use all 10 document types?**
A: No. Start with ultra-minimal (`AGENTS.md` only). Add more as your project grows. Run `/mdc-workflow` again to upgrade.

**Q: What if I already have project docs?**
A: The skill detects existing docs and only adds missing pieces. It never overwrites your content.

**Q: Does this work for non-software projects?**
A: The templates assume a software project structure, but the methodology (multi-document decoupling + TS-Protocol) applies to any LLM-assisted work.

---

## Contributing / 贡献

Issues and PRs welcome. Before submitting a PR:

1. Test the skill locally: `cc --plugin-dir .`
2. Run the verification script: `bash skills/mdc-workflow/scripts/check-docs.sh`
3. Ensure templates work in both `zh/` and `en/`

---

## License / 许可

MIT — do whatever you want, just keep the copyright notice.

---

<p align="center">
  <sub>Built with hard-earned debugging experience. If this saves you even one afternoon of fighting stale docs, it was worth it.</sub>
</p>
