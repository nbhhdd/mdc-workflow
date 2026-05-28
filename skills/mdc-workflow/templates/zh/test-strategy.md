---
template: 04-测试文档/测试策略与验收标准.md
usage: 定义测试分类、验收标准、测试存放规范。
---

# 测试策略与验收标准

## 一、测试目标

{{TEST_GOALS}}

测试分为：

{{TEST_CATEGORIES}}

## 二、必须执行的基础测试

每次重要改动后必须执行：

```bash
{{BUILD_CHECK_COMMANDS}}
```

## 三、功能测试验收项

{{FUNCTIONAL_TEST_ITEMS}}

## 四、性能测试验收项（如适用）

{{PERFORMANCE_TEST_ITEMS}}

## 五、安全测试验收项（如适用）

{{SECURITY_TEST_ITEMS}}

## 六、测试代码存放规范

测试代码统一放在：

```text
{{TEST_DIR}}
├─ unit/
├─ integration/
├─ e2e/
├─ fixtures/
└─ manual/
```
