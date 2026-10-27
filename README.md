# 软考系统架构设计师 Skills

本仓库面向软考高级系统架构设计师，提供 8 个 Skill，覆盖学习编排、综合知识、专业英语、案例分析和论文训练。每个 Skill 都有独立的工作流、参考资料和输出边界，可以单独调用，也可以按复习顺序组合使用。

<div align="center">
  <img src="assets/rk-skills.svg" width="100%" alt="软考系统架构设计师八个命令流程图：先用 /rk-study 编排学习，再用 /rk-basic 补基础，用 /rk-english 记英语，用 /rk-case-card 背案例专题，用 /rk-case-drill 练具体真题，最后进入论文训练。" />
</div>

## 从这里开始

先用 `rk-study` 选择下一项任务，再调用对应的专项 Skill：

```text
/rk-study 继续上次软考学习，优先安排最薄弱主题，只给我下一项任务。
```

推荐流程：

`rk-study` → `rk-basic` / `rk-english` → `rk-case-card` → `rk-case-drill` → `rk-essay-template` → `rk-essay-final` → `rk-essay`

`rk-study` 可以读取工作区中的可选状态文件，例如 `.rk-local/study-state.md`、`.rk-local/mistake-index.md` 和 `.rk-local/fact-ledger.md`。没有这些文件时，Skill 仍按当前对话运行。

## Skill 速览

| Skill | 适用任务 | 主要输出 |
| --- | --- | --- |
| /rk-study | 继续学习、安排复习、选择薄弱项、限时训练 | 下一项任务、掌握三态、错误标签、来源和事实边界 |
| /rk-basic | 理解综合知识、计算题、易混点、举一反三 | 通俗讲解、公式步骤、题型判断、变式练习、错题规则 |
| /rk-english | 复习专业英语高频词 | 专题词表、中文含义、考点例句、可选小测 |
| /rk-case-card | 背案例专题和考场卡 | 今日卡、专题卡、新方向转译卡、复习记录 |
| /rk-case-drill | 练真题、案例题和变式题 | 题干拆解、分层提示、训练估分、答案改写、下一轮训练 |
| /rk-essay-template | 根据题目和项目事实生成论文母版 | 题目拆解、主题适配、论点卡、可替换模板 |
| /rk-essay-final | 考前按主题整理论点卡 | 适配判断、题干义务、项目素材、背诵句、风险提示 |
| /rk-essay | 诊断和修改论文草稿 | 题干覆盖、事实检查、训练估分、优先修改项 |

## 常用调用

### 基础知识

```text
/rk-basic 通俗讲解 Redis 缓存穿透、击穿、雪崩的区别，再给一道变式题。
```

计算题、图题和操作题会保留题干条件、步骤、结果、易错点和下一次练习。

### 案例分析

```text
/rk-case-card 1 今日背
/rk-case-drill 真题拆
/rk-case-drill 提示：Redis 缓存一致性这问我不会，先别直接给答案。
```

案例训练优先让用户作答，再逐层提供线索、答题骨架和对照讲解。真题或回忆资料会标记来源、年份、缺图和题干完整度。

### 论文训练

```text
/rk-essay-template 根据论文题目、真题要求和我的项目事实，生成一份可替换的考场写作模板。
/rk-essay-final 论分布式事务及其解决方案
/rk-essay 根据题目、项目事实和我的草稿，诊断过线风险并给出优先修改项。
```

论文 Skill 只使用用户提供或当前工作区配置的事实。没有证据的内容标为 [待确认] 或 计划，不会自动补造项目指标。

## 安装与更新

### 使用 `npx skills`

安装全部 Skill：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g -y
```

也可以只安装指定 Skill：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g --skill rk-study --skill rk-basic --skill rk-english --skill rk-case-card --skill rk-case-drill --skill rk-essay --skill rk-essay-template --skill rk-essay-final -y
```

更新已安装版本时，重新执行对应安装命令。更新后新开一个任务，让客户端重新加载 Skill。

只更新论文模板：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g --skill rk-essay-template -y
```

### 使用 Codex 插件

```bash
codex plugin marketplace add Jaxanyn/ruankao-sa-skills
codex plugin add rk@rk
```

安装后新开一个任务，让 Codex 重新加载插件。

### 使用 Claude Code 插件

```text
/plugin marketplace add Jaxanyn/ruankao-sa-skills
/plugin install rk@rk
```

## 边界

- 训练估分用于复习判断，不等同于官方阅卷结果，也不承诺通过考试。
- 不虚构题干、项目数据、技术栈、评分细则或官方政策。
- 报名时间、考试安排、大纲和地区政策以当次官方通知为准。
- 预测、考生回忆和个人建议保留来源性质与日期，不写成官方真题或命题保证。
- 公共仓库只保存通用工作流。个人错题、项目事实和本机路径放在工作区的私有状态文件中。

## 维护

根目录 `skills/` 是公开 Skill 源，`plugins/rk/skills/` 是 Codex 和 Claude Code 插件使用的镜像。修改 Skill 时先改根目录，再同步镜像：

```powershell
powershell -NoProfile -File scripts/sync-plugin-skills.ps1
```

提交前运行检查：

```powershell
powershell -NoProfile -File scripts/sync-plugin-skills.ps1 -Check
powershell -NoProfile -File scripts/validate-skills.ps1
```

`validate-skills.ps1` 会检查 Skill 名称、引用文件、本机绝对路径、插件镜像和 JSON 元数据。

## 目录结构

```text
ruankao-sa-skills/
├── .agents/plugins/marketplace.json
├── .claude-plugin/marketplace.json
├── skills/
│   ├── rk-study/
│   ├── rk-basic/
│   ├── rk-english/
│   ├── rk-case-card/
│   ├── rk-case-drill/
│   ├── rk-essay/
│   ├── rk-essay-final/
│   └── rk-essay-template/
├── plugins/rk/
│   ├── .codex-plugin/plugin.json
│   ├── .claude-plugin/plugin.json
│   └── skills/
├── scripts/
│   ├── sync-plugin-skills.ps1
│   └── validate-skills.ps1
├── LICENSE
└── README.md
```

## License

MIT
