# 来源与项目事实契约

## 来源登记

每条外部资料至少保留：

```text
source_id:
source_type: 官方通知 / 官方标准或一手文档 / 教材课程 / 考生回忆 / 机构预测 / 个人建议
published_at:
checked_at:
location:
confidence: 高 / 中 / 低
conflict_note:
```

最新官方通知优先于旧资料；技术机制以一手文档校正；多份回忆冲突时只保留交叉出现的内容，并标记缺口。

## 项目事实登记

```text
topic:
status: 已实施 / 已观察 / 待本人确认 / 计划
scenario:
architect_action:
tradeoff:
result:
evidence_location:
safe_sentence:
forbidden_claim:
```

只有 `已实施` 或 `已观察` 且有证据位置的内容，才可以写成项目已发生事实。指标示范值、设计目标和实测结果必须分开；没有结果时使用定性描述或 `[待本人确认]`。
