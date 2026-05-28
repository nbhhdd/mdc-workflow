---
template: 07-文件规范/项目文件存放规范.md
usage: 定义项目的目录结构、资源分类、文件命名规则。新人入职和 AI 协作的重要参考。
---

# 项目文件存放规范

## 一、目标

项目文件必须能支撑长期维护。

要求：

1. 文档集中。
2. 源码分层。
3. 静态资源分类。
4. 测试代码独立。
5. 版本档案保留。
6. 临时文件不得污染根目录。

## 二、推荐根目录结构

```text
{{PROJECT_NAME}}/
├─ {{SRC_DIR}}              # 正式前端/应用源码
├─ {{BACKEND_DIR}}          # 正式后端源码
├─ {{PUBLIC_DIR}}           # 运行时静态资源
├─ {{ASSETS_SOURCE_DIR}}    # 原始素材和创作源文件
├─ {{TEST_DIR}}             # 测试代码
├─ project-docs/            # 项目文档中心
├─ version-archive/         # 版本档案
├─ scripts/                 # 工具脚本
├─ dist/                    # 构建输出，不手写
└─ node_modules/            # 依赖，不手写
```

## 三、正式代码与测试代码

正式代码：

```text
{{SRC_DIR}}
{{BACKEND_DIR}}
```

测试代码：

```text
{{TEST_DIR}}
├─ unit/
├─ integration/
├─ e2e/
├─ fixtures/
└─ manual/
```

规则：

1. 测试代码不得散落在根目录。
2. 临时验证脚本放 `scripts/experiments/`。
3. 测试夹具放 `{{TEST_DIR}}/fixtures/`。

## 四、静态资源规范

运行时资源：

```text
{{PUBLIC_DIR}}
├─ assets/
├─ sounds/
└─ ui/
```

原始素材：

```text
{{ASSETS_SOURCE_DIR}}
├─ characters/
├─ voice/
├─ prompts/
└─ references/
```

## 五、文档规范

所有正式文档放：

```text
project-docs/
```

## 六、版本保留规范

目录：

```text
version-archive/
├─ releases/
├─ snapshots/
├─ changelog/
└─ migration-notes/
```

每个重要版本保留：

1. 版本号。
2. 日期。
3. 功能说明。
4. 已知问题。
5. 数据迁移说明。

## 七、迁移策略

不要一次性大搬家。

推荐：

1. 先建立新目录。
2. 新文件全部进入新目录。
3. 老文件逐步迁移。
4. 每次迁移后跑构建。
5. 路径变更必须更新引用。
