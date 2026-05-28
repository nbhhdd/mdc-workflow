---
template: AGENTS.minimal.md
usage: 小项目的极简入口。如果项目小于 5 个文件，用这个就够了。
---

# {{PROJECT_NAME}}

{{ONE_LINE_DESCRIPTION}}

## 技术栈

{{TECH_STACK}}

## 目录结构

```
{{DIRECTORY_TREE}}
```

## 构建与运行

```bash
{{BUILD_COMMANDS}}
```

## AI 协作规则

改代码前：

1. 先读相关文件，确认当前架构。
2. 查 `project-docs/` 中的相关文档。

改代码后：

1. 执行构建检查。
2. 如果改动涉及重要逻辑，追加到 `project-docs/错误记录.md`。

## 禁止事项

{{RULES}}
