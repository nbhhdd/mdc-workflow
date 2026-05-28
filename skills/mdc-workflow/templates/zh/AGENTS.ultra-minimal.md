---
template: AGENTS.ultra-minimal (zh)
usage: 超小项目（< 5 个源文件）。只需要一个 AGENTS.md 入口。
---

# {{PROJECT_NAME}}

{{ONE_LINE_DESCRIPTION}}

## 技术栈

{{TECH_STACK}}

## 构建与运行

```bash
{{BUILD_COMMANDS}}
```

## 文件结构

```
{{DIRECTORY_TREE}}
```

## AI 协作规则

改代码前：
1. 先读相关源码，确认当前实现方式。
2. 如果有 `project-docs/` 目录，阅读相关文档。

改代码后：
1. 执行构建检查。
2. 如果修复了一个花了超过 30 分钟的 Bug，追加到 `project-docs/错误记录.md`。

## 错误记录

```markdown
# 错误记录

## 1. [X] 已解决 ({{DATE}})
- 现象：
- 根因：
- 正确方案：
```

## 禁止事项

{{RULES}}
