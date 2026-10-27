# 软考系统架构设计师 Skills

把软考高级系统架构设计师备考拆成八个可调用的 AI 教练：学习编排、基础知识、专业英语、案例必背卡、案例真题训练、论文模板生成、论文考前押题材料、论文草稿诊断。

`ruankao-sa-skills` 适合在复习知识点、记专业英语、背案例专题、拆案例题、整理项目素材、生成论文母版、考前押题生成论点卡和打磨论文草稿时使用。每个 Skill 都有自己的工作流、参考资料和输出边界，可以单独调用，也可以按备考节奏串起来。

<div align="center">
  <img src="assets/rk-skills.svg" width="100%" alt="软考系统架构设计师八个命令流程图：先用 /rk-study 编排学习，再用 /rk-basic 补基础，用 /rk-english 记英语，用 /rk-case-card 背案例专题，用 /rk-case-drill 练具体真题，最后进入论文训练。" />
  <p><sub>紧凑两行命令地图：/rk-case-card 负责背案例必备专题，/rk-case-drill 负责练具体案例题。</sub></p>
</div>

## What You Get

| Skill | 你遇到的问题 | 它会产出什么 |
| --- | --- | --- |
| `/rk-study` | 想继续上次学习、按薄弱点安排任务、记录掌握状态 | 下一项任务、掌握三态、错误标签、来源和事实边界 |
| `/rk-basic` | 选择题知识点看不懂、计算题不会拆步骤、易混概念记不牢、想举一反三 | 通俗讲解、考点解释、计算步骤、知识框架、变式练习、考前速记 |
| `/rk-english` | 专业英语 5 道题想快速记高频词，不想看太长解析 | 按专题分类的英语词汇、中文含义、真题或考点例句中文意思 |
| `/rk-case-card` | 不知道今天背什么，想用 4 个入口完成今日背、稳分题、新方向和记录 | 背诵菜单、今日卡、专题卡、新方向转译卡、复习记录模板 |
| `/rk-case-drill` | 想按今日卡练题、练新方向、拆真题、卡住要提示、或围绕错题举一反三 | 训练菜单、短练题、分层提示、题干拆解、训练估分、改写稿、变式练习 |
| `/rk-essay-template` | 有真实项目材料，想按不同论文题目整理一份考场可改写母版 | 题目拆解、真题映射、主题适配、架构师视角检查、论点卡、可替换论文模板 |
| `/rk-essay-final` | 考前遇到押题主题，想基于固定项目快速生成可背论点卡 | 适配判断、题干义务、3 张论点卡、项目素材、背诵句、跑题提醒 |
| `/rk-essay` | 已经写出论文草稿，但不知道是否覆盖题干、哪里容易失分 | 题目覆盖诊断、项目事实检查、训练估分、优先修改项 |

推荐节奏：先用 `rk-study` 读取学习状态并选择下一步；基础知识用 `rk-basic`，专业英语用 `rk-english`，案例背诵用 `rk-case-card`，具体案例训练用 `rk-case-drill`，论文模板用 `rk-essay-template`，考前论点卡用 `rk-essay-final`，论文诊断用 `rk-essay`。每次完成后回到 `rk-study` 记录掌握状态和下一项任务。

## Quick Start

推荐用 `npx skills` 安装，适合 Codex、Claude Code、Cursor 等支持 `SKILL.md` 的 Agent：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g --skill rk-study --skill rk-basic --skill rk-english --skill rk-case-card --skill rk-case-drill --skill rk-essay --skill rk-essay-template --skill rk-essay-final -y
```

安装后新开一个任务，让客户端重新加载 Skill，然后直接调用：

```text
/rk-case-card
```

如果你的 `skills` CLI 会自动发现仓库根目录下的 `skills/`，也可以使用更短的安装命令：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g -y
```

已经安装过的用户，直接重新执行上面的安装命令即可更新到最新版本。更新后新开一个任务，让客户端重新加载 Skill。

## Install

### Recommended: `npx skills`

安装指定的八个 Skill：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g --skill rk-study --skill rk-basic --skill rk-english --skill rk-case-card --skill rk-case-drill --skill rk-essay --skill rk-essay-template --skill rk-essay-final -y
```

把 `codex` 换成你的目标 Agent，例如 `claude-code`、`cursor` 或其它 `skills` CLI 支持的 Agent。

### Update Existing Install

已经用 `npx skills` 安装过时，重新执行同一条 `add` 命令即可覆盖为仓库最新版本：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g --skill rk-study --skill rk-basic --skill rk-english --skill rk-case-card --skill rk-case-drill --skill rk-essay --skill rk-essay-template --skill rk-essay-final -y
```

只更新论文模板命令：

```bash
npx skills@latest add Jaxanyn/ruankao-sa-skills -a codex -g --skill rk-essay-template -y
```

更新后关闭当前任务并新开一个任务，确保客户端重新加载最新的 `SKILL.md`。

### Codex Plugin

```bash
codex plugin marketplace add Jaxanyn/ruankao-sa-skills
codex plugin add rk@rk
```

安装后新开一个任务，让 Codex 重新加载插件。

### Claude Code Plugin

```text
/plugin marketplace add Jaxanyn/ruankao-sa-skills
/plugin install rk@rk
```

安装后新开一个任务，让 Claude Code 重新加载插件。

## Examples

继续学习并选择下一项任务：

```text
/rk-study 继续上次软考学习，优先安排最薄弱主题，只给我下一项任务。
```

补基础知识：

```text
/rk-basic 帮我解释流水线吞吐率怎么计算，并给一道练习题。
```

通俗讲解知识点：

```text
/rk-basic 通俗讲解 Redis 缓存穿透、击穿、雪崩的区别，再用一句考试话术总结。
```

围绕一道题举一反三：

```text
/rk-basic 举一反三：这道流水线题我会算了，换一个条件让我再练一题。
```

记专业英语：

```text
/rk-english 输出“安全”专题的 10 个高频词，只列英语词汇、中文和例句中文意思。
```

背案例必备专题：

```text
/rk-case-card

案例背诵
1. 今日背
2. 稳分题
3. 新方向
4. 记录
```

练具体案例题：

```text
/rk-case-drill

案例训练
1. 今日练
2. 新题练
3. 真题拆
4. 估分改
```

案例题卡住时要提示：

```text
/rk-case-drill 提示：Redis 缓存一致性这问我不会，先别直接给答案。
```

案例题举一反三：

```text
/rk-case-drill 举一反三：我刚才不会写缓存一致性的改进措施，换个场景再出一问。
```

先生成论文母版：

```text
/rk-essay-template 根据论文题目、真题要求和我的项目事实，生成一份可替换的考场写作模板；理论部分用论点卡展开，并检查是否站在架构师视角。
```

考前押题生成论点卡：

```text
/rk-essay-final 论分布式事务及其解决方案
```

诊断论文草稿：

```text
/rk-essay 根据题目、项目事实和我的草稿，诊断这篇论文的过线风险，给出训练估分和优先修改项。
```

串联复习：

```text
先用 /rk-basic 通俗讲解 Redis 缓存一致性，再用 /rk-basic 举一反三做一道变式题；如果进入案例题，再用 /rk-case-card 1 今日背，最后用 /rk-case-drill 举一反三练一问。
```

## Boundaries

训练估分只用于复习判断，不等同于官方阅卷结果，也不承诺通过考试。

Skill 不会虚构题干、项目数据、技术栈、评分细则或官方政策。报名时间、考试安排、大纲和地区政策等信息，请以当次官方通知为准。

生成内容适合用来复习、诊断和考场前改写。`rk-case-card` 输出的是背诵卡，不是官方押题；`rk-case-drill` 给出的训练估分和修改建议不能替代官方阅卷；`rk-essay-template` 输出的是可替换母版，不是万能范文；`rk-essay-final` 输出的是考前论点卡和素材，不是完整定稿；`rk-essay` 给出的训练估分和修改建议也不能替代官方阅卷。

## For Maintainers

这个仓库同时支持 `npx skills` 和 native plugin 两种分发方式：

- 根目录 [`skills/`](skills) 是 `npx skills` 的公开 Skill 源。
- [`plugins/rk/skills`](plugins/rk/skills) 是 Codex / Claude Code plugin 安装所需的镜像副本。
- 修改 Skill 时，优先改根目录 `skills/`，再同步到 plugin 目录。

发布前检查两套内容是否一致：

```powershell
powershell -NoProfile -File scripts/sync-plugin-skills.ps1 -Check
powershell -NoProfile -File scripts/validate-skills.ps1
```

`validate-skills.ps1` 会检查 Skill 名称、引用文件、公共 Skill 中的本机绝对路径、插件镜像和 JSON 元数据。

如果修改了根目录 Skill，再同步到 plugin：

```powershell
powershell -NoProfile -File scripts/sync-plugin-skills.ps1
```

## Structure

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
│       ├── rk-study/
│       ├── rk-basic/
│       ├── rk-english/
│       ├── rk-case-card/
│       ├── rk-case-drill/
│       ├── rk-essay/
│       ├── rk-essay-final/
│       └── rk-essay-template/
├── scripts/sync-plugin-skills.ps1
├── LICENSE
└── README.md
```

## License

MIT
