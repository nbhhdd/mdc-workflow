---
name: mdc-workflow
description: Initialize or upgrade a project's Multi-Document Co-driven (MDC) workflow system. Use when the user asks to "set up MDC", "initialize document workflow", "create project docs system", "set up TS-Protocol", "create multi-document agent workflow", "建立文档工作流", "初始化文档体系", "搭建 MDC", or wants to establish a structured documentation-driven development system. Also triggers when user describes document-code desync problems or wants reusable AI collaboration standards.
version: 2.0.0
disable-model-invocation: true
user-invocable: true
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
---

# MDC Workflow — Multi-Document Co-driven Agent Workflow

为任意项目建立"多文档解耦 + 时间戳闭环 + 按需路由 + 自反思校验"的 AI 协作基础设施。

Establish a "multi-document decoupling + timestamp closed-loop + on-demand routing + self-reflection" AI collaboration infrastructure for any project. No code required — pure Markdown orchestrates the LLM.

## Quick Start / 快速开始

1. User types `/mdc-workflow` or says "建立文档工作流 / set up MDC workflow"
2. Ask about: project name, tech stack, scale, language preference
3. Pick template set by scale (ultra-minimal → full)
4. Generate docs, filling `{{PLACEHOLDERS}}` with project context
5. List files to be created → wait for user confirmation → write

## Scale Selection / 规模选择

| Scale | Files Generated | When to Use |
|-------|----------------|-------------|
| **ultra-minimal** | `AGENTS.md` + `project-docs/错误记录.md` | Personal tool, < 5 source files |
| **minimal** | ultra-minimal + `00-总览/README.md` | Solo project, < 10 files |
| **standard** | AGENTS.md + 5 docs (router, code-standards, error-archive, file-standards, test-strategy) | Team 3-10, 6+ months |
| **full** | standard + 01-方向 + 02-需求 + 03-架构 + 05-AI + 08-版本 | Team > 10, 2+ years |

## Language Selection / 语言选择

Ask: "项目文档使用什么语言？/ What language for the project docs?"

| Answer | Template Dir | Doc Directory Names |
|--------|-------------|-------------------|
| 中文 / Chinese / zh | `templates/zh/` | `00-总览/`, `06-代码规范/`, `10-错误记录/` etc. |
| English / en | `templates/en/` | `00-overview/`, `06-standards/`, `10-errors/` etc. |
| 双语 / Bilingual | Generate from both, primary router in preferred language | Mixed |

## Template Inventory / 模板清单

### Chinese (`templates/zh/`)

| Stage | Template | Output |
|-------|----------|--------|
| Entry | `AGENTS.md` | `./AGENTS.md` |
| Entry (ultra-minimal) | `AGENTS.ultra-minimal.md` | `./AGENTS.md` |
| Router | `router.md` | `project-docs/00-总览/README.md` |
| Code Standards | `code-standards.md` | `project-docs/06-代码规范/代码编写与AI协作规范.md` |
| Error Archive | `error-archive.md` | `project-docs/10-错误记录/错误档案.md` |
| File Standards | `file-standards.md` | `project-docs/07-文件规范/项目文件存放规范.md` |
| Test Strategy | `test-strategy.md` | `project-docs/04-测试文档/测试策略与验收标准.md` |

### English (`templates/en/`)

| Stage | Template | Output |
|-------|----------|--------|
| Entry | `AGENTS.md` | `./AGENTS.md` |
| Entry (ultra-minimal) | `AGENTS.ultra-minimal.md` | `./AGENTS.md` |
| Router | `router.md` | `project-docs/00-overview/README.md` |
| Code Standards | `code-standards.md` | `project-docs/06-standards/code-and-ai-collaboration.md` |
| Error Archive | `error-archive.md` | `project-docs/10-errors/error-archive.md` |
| File Standards | `file-standards.md` | `project-docs/07-files/project-file-standards.md` |
| Test Strategy | `test-strategy.md` | `project-docs/04-testing/test-strategy.md` |

## Post-Generation / 生成后

1. Tell user the doc system is ready
2. Remind: AI enters workflow via `AGENTS.md` each new session
3. Optional: run `scripts/check-docs.sh` to verify doc-code timestamp consistency
4. Tell user: run `/mdc-workflow` later to add missing doc modules

## Compatibility / 兼容性

If project already has docs:
- Never overwrite existing content without permission
- Add `last_updated` field to existing doc headers
- Fill missing entries in the router's metadata index
- Mark stale docs with `[needs update]` instead of editing silently

## Scripts / 脚本

- `scripts/check-docs.sh` — Cross-platform script that scans `project-docs/` for `last_updated` timestamps and compares against git log modification times of associated code modules. Reports any doc that is older than its linked code.

## Anti-Abuse / 防滥用

- Do NOT overwrite existing files unless user explicitly approves
- Do NOT run destructive operations on non-git projects
- Always list files to be created → wait for confirmation → then write
- Templates are read-only; generated files are written to the user's project
