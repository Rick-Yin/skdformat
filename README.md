<div align="center">

# skdformat

**ShanghaiTech Graduate Thesis Formatting Skill for Codex**  
**面向 Codex 的上海科技大学研究生学位论文格式与结构检查 Skill**

![Codex Skill](https://img.shields.io/badge/Codex-Skill-111827?style=flat-square)
![ShanghaiTech Thesis](https://img.shields.io/badge/ShanghaiTech-Thesis-8B0000?style=flat-square)
![LaTeX shtthesis](https://img.shields.io/badge/LaTeX-shtthesis-0E7490?style=flat-square)
![Bilingual Docs](https://img.shields.io/badge/Docs-Bilingual-166534?style=flat-square)

</div>

> [!IMPORTANT]
> This repository is a **Codex skill folder**, not a standalone thesis template.  
> 本仓库是一个 **Codex skill 目录**，不是独立的论文模板仓库。

> [!NOTE]
> The bundled reference is treated as the source of truth, and `shtthesis` is the preferred LaTeX implementation layer.  
> 本 skill 以仓库内参考材料为准绳，并优先使用 `shtthesis` 作为 LaTeX 实现层。

## Overview | 项目简介

| 中文 | English |
| --- | --- |
| `skdformat` 用于帮助 Codex 创建、审查、修复和迁移上海科技大学研究生学位论文，尤其适用于基于 `shtthesis` 的 LaTeX 项目。它将学校格式要求、模板行为、常见检查点与可执行工作流封装为一个可复用 skill。 | `skdformat` helps Codex create, review, fix, and migrate ShanghaiTech graduate theses, especially LaTeX projects built with `shtthesis`. It packages the school rules, template behavior, common checks, and an actionable workflow into a reusable skill. |

## What This Skill Is For | 这个 Skill 的用途

- Create a new ShanghaiTech thesis skeleton with compliant front matter, bilingual abstracts, bibliography, appendices, and back matter.  
  创建符合上海科技大学要求的新论文骨架，包含前置部分、中英文摘要、参考文献、附录和后置部分。
- Lint an existing Word or LaTeX thesis and identify format or structure violations.  
  检查已有的 Word 或 LaTeX 论文，并指出格式与结构问题。
- Fix concrete issues in covers, metadata, chapter structure, citations, pagination, anonymous review builds, or print-ready builds.  
  修复封面、元数据、章节结构、引用、页码、盲审构建或打印版构建中的具体问题。
- Migrate existing thesis content into a compliant `shtthesis` project structure.  
  将已有论文内容迁移到合规的 `shtthesis` 项目结构中。

## Install | 安装

This repository is itself the skill directory. Place it at:

```text
$CODEX_HOME/skills/skdformat
```

If `CODEX_HOME` is not set, use:

```text
~/.codex/skills/skdformat
```

本仓库本身就是 skill 目录。请将它放到：

```text
$CODEX_HOME/skills/skdformat
```

如果没有设置 `CODEX_HOME`，则放到：

```text
~/.codex/skills/skdformat
```

### Option A. Clone with Git | 方式 A：使用 Git 克隆

```bash
git clone https://github.com/Rick-Yin/skdformat.git "${CODEX_HOME:-$HOME/.codex}/skills/skdformat"
```

PowerShell:

```powershell
$root = if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME "skills" } else { Join-Path $HOME ".codex\skills" }
git clone https://github.com/Rick-Yin/skdformat.git (Join-Path $root "skdformat")
```

### Option B. Download ZIP | 方式 B：下载 ZIP

1. Download this repository as a ZIP from GitHub.  
   在 GitHub 页面下载本仓库的 ZIP 压缩包。
2. Extract it into `$CODEX_HOME/skills/skdformat` or `~/.codex/skills/skdformat`.  
   将其解压到 `$CODEX_HOME/skills/skdformat` 或 `~/.codex/skills/skdformat`。
3. Make sure the final folder directly contains `SKILL.md`, `agents/`, and `references/`.  
   确保最终目录中直接包含 `SKILL.md`、`agents/` 和 `references/`。

### Final Step | 最后一步

Restart Codex after installation so the new skill can be discovered.  
安装完成后请重启 Codex，以便它重新发现新 skill。

## How To Use | 如何使用

Call the skill directly in your prompt with `$skdformat`.  
在提示词中直接用 `$skdformat` 调用这个 skill。

### Example Prompts | 示例提示词

```text
Use $skdformat to create a ShanghaiTech master's thesis LaTeX project with shtthesis.
```

```text
Use $skdformat to review my thesis folder and list all formatting violations with exact file references.
```

```text
Use $skdformat to migrate this existing thesis into a compliant shtthesis structure.
```

```text
Use $skdformat to prepare both anonymous review and print-ready builds for this thesis.
```

对应的中文示例：

```text
使用 $skdformat 为我创建一个符合上海科技大学要求的硕士论文 LaTeX 项目。
```

```text
使用 $skdformat 检查我的论文目录，并列出所有格式问题，带精确文件位置。
```

```text
使用 $skdformat 把这份已有论文迁移成合规的 shtthesis 结构。
```

```text
使用 $skdformat 为这篇论文同时准备盲审版和打印版构建方案。
```

## What You Can Expect | 你可以期待它输出什么

- Concrete file edits or code changes.  
  直接给出文件修改或代码实现。
- Rule-based findings with exact file references when possible.  
  在可能的情况下给出带精确文件引用的规则性问题清单。
- Missing sections, wrong ordering, and required corrections.  
  指出缺失部分、顺序错误以及必须修正的问题。
- Build commands, assumptions, and implementation guidance.  
  提供构建命令、前提假设和实现建议。

## Recommended Defaults | 推荐默认行为

| Topic | Recommendation |
| --- | --- |
| Preferred implementation | `shtthesis` |
| Thesis class | `\documentclass[master]{shtthesis}` or `\documentclass[doctor]{shtthesis}` |
| Build command | `latexmk -pdfxe` |
| Fallback build | `latexmk -pdflua` |
| Avoid | `pdfLaTeX` |
| Metadata entry | Configure thesis metadata through `\shtsetup{...}` |
| Blind review | Use `anonymous` |
| Print output | Use `print` |
| Typical assets | Keep `reference.bib` and `shanghaitech-emblem.pdf` in the project root |

## Built-In Workflow | 内置工作流

1. Determine the task mode: create, lint, fix, or migrate.  
   先判断任务模式：新建、检查、修复或迁移。
2. Apply precedence in this order: school rules, bundled reference, then `shtthesis` defaults if no conflict exists.  
   按优先级处理：学校规则优先，其次是仓库参考材料，最后才是 `shtthesis` 默认行为。
3. Read only the relevant reference sections for structure, citations, layout, and template behavior.  
   只按需读取与结构、引用、版式和模板行为相关的参考内容。
4. Produce actionable edits, findings, and build instructions.  
   输出可执行的修改、问题清单和构建说明。

## Repository Layout | 仓库结构

| Path | Purpose |
| --- | --- |
| [`SKILL.md`](./SKILL.md) | Core skill definition, triggering description, workflow, defaults, and review checklist |
| [`agents/openai.yaml`](./agents/openai.yaml) | UI-facing metadata such as display name and default prompt |
| [`references/shanghaitech-thesis-format.md`](./references/shanghaitech-thesis-format.md) | Main bundled reference and source of truth for structure, formatting, and compliance |
| [`references/thesis-starter.tex`](./references/thesis-starter.tex) | Minimal starter skeleton for a self-contained thesis project |
| [`references/build-thesis-example.ps1`](./references/build-thesis-example.ps1) | Example PowerShell wrapper for building thesis variants |
| [`references/shtthesis-user-guide.txt`](./references/shtthesis-user-guide.txt) | Raw `shtthesis` usage notes for implementation details |

## Best Use Cases | 最适合的使用场景

| 中文 | English |
| --- | --- |
| 你正在从零开始搭建上海科技大学研究生论文 LaTeX 项目。 | You are starting a ShanghaiTech graduate thesis project from scratch. |
| 你已经写完论文，但不确定格式、章节顺序或引用是否合规。 | You already have a thesis draft but are unsure whether the format, ordering, or citations are compliant. |
| 你需要从非规范模板迁移到 `shtthesis`。 | You need to migrate from a non-compliant template into `shtthesis`. |
| 你需要同时准备盲审版与正式打印版。 | You need both anonymous review and print-ready outputs. |

## Design Principle | 设计原则

`skdformat` does not treat LaTeX as the goal by itself. The goal is **ShanghaiTech-compliant thesis structure and output**, with `shtthesis` used as the preferred implementation path.  
`skdformat` 不把 LaTeX 本身当成目标；真正的目标是 **符合上海科技大学要求的论文结构与输出**，而 `shtthesis` 是优先采用的实现路径。
