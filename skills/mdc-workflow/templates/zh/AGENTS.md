---
template: AGENTS.md
usage: 放在项目根目录，作为 AI 协作的统一入口。每次 AI 会话开始时最先读取此文件。
---

# {{PROJECT_NAME}} 开发协作规范

## 项目定位

{{PROJECT_NAME}} 是 {{ONE_LINE_DESCRIPTION}}。

核心方向：

{{CORE_DIRECTIONS}}

## 文档入口

所有正式文档从这里开始：

```text
project-docs/00-总览/README.md
```

## 改代码前必须做

1. 阅读相关文档（根据任务类型查路由表：`project-docs/06-代码规范/代码编写与AI协作规范.md` 第三章）
2. 校验文档时间戳是否过期（查 `project-docs/00-总览/README.md` TS-Protocol 章节）
3. 阅读相关源码。
4. 明确本次改动属于哪个模块/层级。
5. 逐条通过自检清单（`project-docs/06-代码规范/代码编写与AI协作规范.md` 自反思章节）

## 改代码后必须做

1. 更新相关文档（按 TS-Protocol 触发规则表执行）。
2. 更新文档时间戳。
3. 执行：

```bash
{{BUILD_COMMANDS}}
```

4. 记录未完成风险。

## 目录规则

正式前端代码：

```text
{{SRC_DIR}}
```

正式后端代码：

```text
{{BACKEND_DIR}}
```

测试代码：

```text
{{TEST_DIR}}
```

正式文档：

```text
project-docs/
```

版本档案：

```text
version-archive/
```

原始素材：

```text
{{ASSETS_SOURCE_DIR}}
```

运行时静态资源：

```text
{{PUBLIC_DIR}}
```

工具脚本：

```text
scripts/
```

## 禁止事项

1. 禁止把临时脚本放在根目录。
2. 禁止把测试代码混入正式代码目录。
3. 禁止把资源原图直接塞进源码目录。
4. 禁止无文档地重构大模块。
{{ADDITIONAL_RULES}}
