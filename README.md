# AI Software Agency

A complete, CEO-led AI Software Agency packaged as a Claude Code plugin. It ships a team of specialised skills across four departments — Product, Design, Development, and QA — orchestrated by a strategic CEO skill, plus a 173-skill specialist library across 17 divisions.

## Installation

### Via Claude Code Marketplace (recommended)

```shell
/plugin marketplace add naimsolong/ai-software-agency
/plugin install ai-software-agency@ai-software-agency
```

### Direct plugin install

```shell
/plugin install naimsolong/ai-software-agency
```

After installation, start a project:

```shell
/start-project
```

---

1. **Transparency first** — every decision is documented; skills never act silently on critical choices
2. **Quality over speed** — ship correct software, not fast software
3. **Human in the loop for critical decisions** — governance gates are mandatory before any handoff
4. **Goal-aware execution** — every skill always knows *why* it is doing a task, not just *what*
5. **Atomic work** — a task is claimed before starting; duplicate work never happens
6. **Memory continuity** — skills update their memory before ending every session

---

## What It Does

The AI Software Agency turns a business goal into production-ready software autonomously, with human confirmation gates at every critical decision point.

```
You: "Build a user authentication system"
  └─ /ceo sets goal, runs feasibility check → you approve it
  └─ /product-manager asks 3-5 questions, writes PRD → you approve it
  └─ /qa-lead writes test cases from PRD (before any code) → you approve
  └─ /uiux-designer creates pixel-perfect wireframes + Tailwind specs → you approve
  └─ /fullstack-developer implements from specs, commits to git
  └─ /qa-lead validates implementation, reports pass/fail
  └─ /ceo delivers: "Done. All tests pass."
```

> **Fixed-path orchestration:** Every phase runs on a prescribed path defined by the skill — same questions, same rubric, same output format, every time. No skill skips steps or decides the flow. Human approval at each gate is the only thing that advances the sequence.

## Core Skills

| Skill | Invoke | Role | Key Deliverable |
|-------|--------|------|-----------------|
| `ceo` | `/ceo` | Orchestrates all departments, enforces governance | Project status, goal tree |
| `product-manager` | `/product-manager` | Refines requirements, writes PRDs | `~/.agency/projects/<slug>/prd.md` |
| `uiux-designer` | `/uiux-designer` | Creates pixel-perfect design specs and wireframes | `~/.agency/projects/<slug>/design.md` |
| `fullstack-developer` | `/fullstack-developer` | Implements from approved specs | Application code (git commits) |
| `qa-lead` | `/qa-lead` | Writes tests before dev, validates after dev | `~/.agency/projects/<slug>/tests.md` |

## Specialist Skills Library

Beyond the five core skills, the agency ships **173 specialist skills** across 17 divisions. Any core skill may delegate to a specialist when the task requires domain depth beyond the core team's scope.

```
/ceo
└── Specialist Skills Library (173 skills across 17 divisions)
    ├── skills/specialists/engineering/         — Backend, frontend, DevOps, security, AI, etc.
    ├── skills/specialists/design/              — Brand, UX research, visual storytelling, etc.
    ├── skills/specialists/marketing/           — SEO, social, content, growth, TikTok, etc.
    ├── skills/specialists/sales/               — Deal strategy, pipeline, outbound, coaching
    ├── skills/specialists/testing/             — API, accessibility, performance, workflow
    ├── skills/specialists/product/             — Sprint prioritization, feedback, trend research
    ├── skills/specialists/project-management/  — Studio ops, Jira workflow, experiment tracking
    ├── skills/specialists/paid-media/          — PPC, programmatic, creative strategy, tracking
    ├── skills/specialists/support/             — Analytics, finance, legal compliance, infra
    ├── skills/specialists/spatial-computing/   — visionOS, XR, macOS Metal, terminal integration
    ├── skills/specialists/specialized/         — MCP builder, agent builder, skill builder, ZK
    ├── skills/specialists/game-development/    — Unity, Unreal, Godot, Roblox, Blender, etc.
    ├── skills/specialists/academic/            — Anthropology, history, psychology, narratology
    ├── skills/specialists/business/            — Cultural intelligence, consulting, presales
    ├── skills/specialists/data/                — Orchestration, consolidation, identity graph
    ├── skills/specialists/operations/          — Workflow, supply chain, recruitment, governance
    └── skills/specialists/bonus/               — Studio coach
```

| Division | Skills | Examples |
|----------|--------|---------|
| `engineering/` | 33 | backend-architect, frontend-developer, security-engineer, devops-automator, ai-engineer |
| `marketing/` | 29 | seo-specialist, tiktok-strategist, content-creator, growth-hacker, linkedin-content-creator |
| `design/` | 16 | ui-designer, ux-researcher, brand-guardian, image-prompt-engineer, visual-storyteller |
| `game-development/` | 20 | unity-architect, godot-gameplay-scripter, narrative-designer, unreal-world-builder |
| `sales/` | 10 | deal-strategist, outbound-strategist, pipeline-analyst, discovery-coach, salesforce-architect |
| `support/` | 8 | finance-tracker, legal-compliance-checker, analytics-reporter, infra-maintainer |
| `testing/` | 8 | api-tester, accessibility-auditor, performance-benchmarker, reality-checker |
| `project-management/` | 7 | project-shepherd, jira-workflow-steward, studio-producer, studio-operations |
| `paid-media/` | 7 | ppc-strategist, programmatic-buyer, tracking-specialist, creative-strategist |
| `spatial-computing/` | 6 | visionos-spatial-engineer, xr-immersive-developer, xr-interface-architect |
| `academic/` | 5 | academic-anthropologist, academic-historian, academic-psychologist, academic-narratologist |
| `business/` | 5 | cultural-intelligence-strategist, french-consulting-market, government-digital-presales-consultant |
| `data/` | 5 | agents-orchestrator, data-consolidation-agent, identity-graph-operator, model-qa |
| `operations/` | 5 | workflow-architect, supply-chain-strategist, recruitment-specialist, automation-governance-architect |
| `product/` | 4 | sprint-prioritizer, feedback-synthesizer, trend-researcher, behavioral-nudge-engine |
| `specialized/` | 4 | mcp-builder, skill-builder, specialized-agent-builder, zk-steward |
| `bonus/` | 1 | studio-coach |

**Delegation rules:**
- Specialists are invoked via the `Agent` tool by the CEO skill, using their path: e.g. `skills/specialists/engineering/engineering-frontend-developer`
- Specialists operate under the same governance framework — handoffs still require a `governance-gate`
- Specialists are stateless by default; the CEO may create a persistent memory file for recurring specialists
- Never delegate to a specialist if the task is within a core skill's domain

### Hiring New Skills/Agents

If a project needs a domain that no existing specialist covers, the agency can grow its own library on-demand via a **governance-gated hire**:

```
/ceo identifies gap
  └─ Delegates to skills/specialists/specialized/specialized-agent-builder
       └─ Inspects library, compares 2+ existing specialists
            └─ Drafts new skill config
                 └─ /hire-agent → Governance Gate → [YOU APPROVE]
                      └─ New skill file written to skills/specialists/<division>/<slug>/SKILL.md
```

**How to trigger a hire:**
```
/ceo I need a specialist for [domain] — nothing in the library covers it.
```

The CEO will delegate to `specialized-agent-builder`, which will inspect the existing library, draft a new specialist, and present the full config for your approval before writing anything. No skill file is ever created without your explicit sign-off.

**Hire governance rules:**
- Only the CEO may initiate a hire
- The agent builder must compare ≥ 2 existing specialists before drafting
- `Bash` and `Agent` tools are never granted to new specialists without explicit CEO authorisation in the hire request
- Every hire and rejection is logged to `~/.agency/audit.log` with a rollback tag
- The project task that triggered the hire is a blocker until the hire is approved

### Creating New Skills

If a workflow step should be reusable across projects but no existing skill covers it, the agency can author a new plugin skill on-demand via a **governance-gated scaffold**:

```
/ceo identifies workflow gap
  └─ Delegates to skills/specialists/specialized/skill-builder
       └─ Inspects skills library + plugin manifest
            └─ Defines spec (slug, worker surface, UI surface)
                 └─ Drafts SKILL.md + plugin.json append
                      └─ /create-skill → Governance Gate → [YOU APPROVE]
                           └─ skills/<slug>/SKILL.md written
                                └─ .claude-plugin/marketplace.json updated
                                     └─ Package verified ✓
```

**How to trigger a skill creation:**
```
/ceo I need a new skill for [workflow] — no existing skill covers it.
```

**Alpha SDK runtime conventions the agency enforces:**

| Convention | Rule |
|-----------|------|
| File path | `skills/<slug>/SKILL.md` — filename must be exactly `SKILL.md` |
| Registration | `"skills/<slug>"` appended to `.claude-plugin/marketplace.json` |
| User invocation | `/<slug>` |
| Worker surface | Inline Markdown prompt — runs in calling skill's session, same tools |
| UI surface | Terminal Markdown — `✓` success, `⚠️` warning, `✗` failure |
| Required sections | H1 title, one-liner, `## When to Use`, `## Steps`, final `✓` block |

---

## Key Features

- **Human confirmation gates** — You approve every deliverable before work advances to the next stage. No department proceeds without your sign-off.
- **Test-first workflow** — QA writes the test plan *before* the developer starts coding.
- **Feasibility check** — Structured 7-question analysis before any department work begins.
- **Atomic task checkout** — No two agents work on the same task. Each task is locked before work begins.
- **Persistent memory** — Skills remember decisions, preferences, and context across sessions.
- **Goal-aware execution** — Every task carries its full goal ancestry so skills always know *why*, not just *what*.
- **Audit log** — Every action is appended to `~/.agency/audit.log` for full transparency.
- **Rollback support** — Approved states are tagged in the audit log and can be restored from git history.
- **PR review** — Structured two-pass pull request review with correctness and risk analysis.
- **Research sparring** — Exploratory investigation partner for architecture, code, and domain problems.

## Quick Start

### Option A — Using the `start-project` skill (recommended)

In Claude Code, invoke:
```
/start-project
```

The skill will walk you through:
1. Naming the project
2. Defining the business goal
3. Creating the `~/.agency/` workspace
4. Handing off to the CEO to begin

### Option B — Direct skill invocation

Invoke any core skill directly from Claude Code:
```
/ceo                  — Start a project or get an agency status report
/product-manager      — Create or refine requirements
/uiux-designer        — Design a feature
/fullstack-developer  — Implement a feature
/qa-lead              — Write tests or validate an implementation
```

## Project Workspace

Every project uses a `~/.agency/` directory in your home directory (shared across all projects):

```
~/.agency/
├── config.json           # Agency configuration
├── tasks.md              # Atomic task registry
├── goals.md              # Business goal hierarchy
├── audit.log             # Append-only action log
├── projects/
│   └── <your-project>/
│       ├── prd.md        # Product Requirements Document (PM)
│       ├── design.md     # Design Specification (Designer)
│       ├── tests.md      # Test Plan (QA Lead)
│       └── changelog.md  # Release history (Developer)
└── memory/
    └── <agent>/MEMORY.md # Per-agent persistent memory
```

`~/.agency/` lives in your home directory — it is outside any project repo and not version-controlled by default.

## The Governance Gate

Every handoff between departments requires your explicit approval:

```
── Governance Gate: PRD ──────────────────────────────────

Presented by: product-manager
Deliverable: ~/.agency/projects/auth-v1/prd.md

What this is:
  A complete Product Requirements Document for the user authentication system.

What you are approving:
  - JWT-based auth with refresh tokens
  - Email/password login (no OAuth in v1)
  - 3 user stories covering login, logout, and session refresh

What happens if you approve:
  QA will write test cases from this PRD, then Design will create the UI specs.

[Full PRD content shown here]

Please respond with:
  APPROVED | REJECTED: <reason> | CHANGES: <requests>
```

You will never be surprised by what gets built — every major decision goes through you.

## Task Lifecycle

Every task moves through a defined state machine tracked in `~/.agency/tasks.md`:

```
pending → in-progress → review → done
                    ↘ blocked
```

| Status | Meaning |
|--------|---------|
| `pending` | Available to claim |
| `in-progress` | Claimed by an agent (agent name + timestamp recorded) |
| `review` | Work done, awaiting governance-gate approval |
| `done` | Approved and complete |
| `blocked` | Cannot proceed — reason documented in task entry |

Skills use the `/task-checkout` skill to atomically claim a task before starting. No agent starts work on an already `in-progress` task.

## Rollback Protocol

Every governance gate approval writes a rollback marker to `~/.agency/audit.log`:

```
[ROLLBACK:v<n>] <date> <agent> approved <deliverable> at <file>
```

To roll back to a previous approved state:
1. Find the rollback tag in `~/.agency/audit.log`
2. Restore the file from git history at that commit
3. Create a new task to redo the work from that point
4. Log the rollback action in `~/.agency/audit.log`

## Memory Protocol

Skills maintain persistent memory across sessions using Markdown files at `~/.agency/memory/<agent>/MEMORY.md`.

**At the start of every session**, each skill:
1. Reads its `MEMORY.md` — loading project context, key decisions, and user preferences
2. Checks `~/.agency/tasks.md` for any previously `in-progress` task

**At the end of every session**, each skill invokes `/memory-sync` to record:
- Decisions made (with rationale)
- User preference signals
- Patterns discovered
- Open items and blockers

Specialist skills are stateless by default. For recurring specialists, the CEO may create a memory file at `~/.agency/memory/<division>-<agent-name>/MEMORY.md`.

---

## Commit Message Format

All skill commits follow this format:

```
[agent:<type>] <verb>(<scope>): <description>

Task: #<task-id>
Goal: <goal-id>
```

| Prefix | Role |
|--------|------|
| `dev` | Senior Fullstack Developer |
| `ceo` | CEO |
| `pm` | Product Manager |
| `qa` | QA Lead |
| `design` | UI/UX Designer |
| `eng` | Any engineering specialist |
| `mkt` | Any marketing specialist |
| `specialist` | Any other specialist |

Example:
```
[agent:dev] feat(auth): add JWT refresh token endpoint

Task: #T-007
Goal: G-002 → P-001 → B-001
```

---

## Skills Reference

| Skill | Invoke | Description |
|-------|--------|-------------|
| `start-project` | `/start-project` | Initialise agency workspace, begin CEO orchestration |
| `ceo` | `/ceo` | Orchestrate the agency — set goals, delegate, enforce governance |
| `product-manager` | `/product-manager` | Translate business goals into precise, unambiguous requirements |
| `uiux-designer` | `/uiux-designer` | Create wireframes, design specs, and component systems |
| `fullstack-developer` | `/fullstack-developer` | Implement features, write code, commit changes |
| `qa-lead` | `/qa-lead` | Write test plans before dev; validate implementations before release |
| `feasibility-check` | `/feasibility-check` | Structured 7-question feasibility analysis before any department work |
| `governance-gate` | `/governance-gate` | Present deliverable for human approval; mandatory before handoffs |
| `task-checkout` | `/task-checkout` | Atomically claim a task before starting (no double-work) |
| `memory-sync` | `/memory-sync` | Persist session learnings to agent MEMORY.md |
| `goal-tree` | `/goal-tree` | Show full goal ancestry for a task |
| `testcase-generate` | `/testcase-generate` | Generate structured test cases from a PRD and optional design/diff |
| `pr-review` | `/pr-review` | Two-pass pull request review: correctness + system impact |
| `research-sparring` | `/research-sparring` | Exploratory investigation sparring partner |
| `hire-agent` | `/hire-agent` | Draft + governance-gate a new specialist skill |
| `create-skill` | `/create-skill` | Scaffold + governance-gate a new plugin skill |
| `install-tooling` | `/install-tooling` | Confirm + install MCP connectors and desktop software on-demand |

## Installing MCP Connectors and Developer Tools

Invoke `/install-tooling` when a project needs additional integrations. Nothing installs silently — every tool requires explicit confirmation.

### MCP Connectors
Integrated into Claude Code via `~/.claude/settings.json`:

| Connector | What it unlocks |
|-----------|----------------|
| **ClickUp** | Read/write tasks, lists, docs from ClickUp workspaces |
| **Linear** | Read/create Linear issues, projects, and cycles |
| **GitHub** | Repos, issues, PRs, code, commits — read and write |
| **Figma** | Figma files, components, frames, and styles |
| **Pencil.dev** | AI-generated wireframes and UI mockups |
| **Refero.design** | Real-world UI design screenshot reference library |
| **Maestro** | Mobile UI test automation and flow running |
| **Playwright** | Real browser automation and E2E testing |

### Desktop Software

| App | What it does | Platform |
|-----|-------------|----------|
| **Laravel Herd** | Zero-config local PHP/Laravel dev environment | macOS |
| **Fork** | Visual Git client for branch, diff, and stash management | macOS, Windows |
| **OrbStack** | Lightweight Docker/container runtime + Linux VMs | macOS |
| **Beekeeper Studio** | SQL database GUI (Postgres, MySQL, SQLite, and more) | macOS, Windows, Linux |
| **GitHub CLI (`gh`)** | GitHub repos, PRs, and issues from the terminal | macOS, Linux, Windows |

**To install:**
```
/ceo Install the Playwright MCP and Beekeeper Studio.
/install-tooling
```

The skill presents one confirmation gate per tool and waits for your explicit **INSTALL** response before taking any action.

## GitHub Repository Operations

Invoke `engineering-github-operator` when you need to interact with GitHub repositories — browsing, cloning, pushing, or opening pull requests.

**Invoke with:**
```
/ceo List my GitHub repos and clone the ai-software-agency repo.
/ceo Push my changes and create a PR for the current branch.
```

**Supported operations:**

| Operation | Notes |
|-----------|-------|
| List repos | `gh repo list` — shows name, description, default branch |
| Clone | `gh repo clone` — asks target directory |
| Pull | `git pull` — confirms repo and branch first |
| Push | `git push` — shows commits to be pushed; never force-pushes without explicit consent |
| Create PR | `gh pr create` — collects title, body, base branch interactively |
| List PRs / Issues | Read-only; no confirmation needed |

## Configuration

Edit `~/.agency/config.json` to customise:

```json
{
  "settings": {
    "require_governance_gates": true,
    "require_task_checkout": true,
    "max_governance_gate_revisions": 3
  }
}
```

See `templates/agency-config.json` for the full default configuration.

## Export & Import

Export your agency workspace as a portable, secret-scrubbed template:

```bash
bash scripts/export-agency.sh agency-template.tar.gz
```

Import in a new project:

```bash
bash scripts/init-agency.sh new-project
tar -xzf agency-template.tar.gz -C .
# Update ~/.agency/config.json with the new project details
```

## File Structure

```
ai-software-agency/
├── .claude-plugin/
│   └── marketplace.json             # Plugin manifest
├── skills/
│   ├── ceo/SKILL.md                 # CEO orchestrator
│   ├── product-manager/SKILL.md
│   ├── uiux-designer/SKILL.md
│   ├── fullstack-developer/SKILL.md
│   ├── qa-lead/SKILL.md
│   ├── start-project/SKILL.md
│   ├── feasibility-check/SKILL.md
│   ├── task-checkout/SKILL.md
│   ├── memory-sync/SKILL.md
│   ├── governance-gate/SKILL.md
│   ├── goal-tree/SKILL.md
│   ├── testcase-generate/SKILL.md
│   ├── pr-review/SKILL.md
│   ├── research-sparring/SKILL.md
│   ├── hire-agent/SKILL.md          ← draft + governance-gate a new specialist
│   ├── create-skill/SKILL.md        ← scaffold + governance-gate a new skill
│   ├── install-tooling/SKILL.md     ← confirm + install MCPs and desktop tools
│   └── specialists/                 ← 173 specialist skills across 17 divisions
│       ├── engineering/
│       ├── design/
│       ├── marketing/
│       ├── sales/
│       ├── testing/
│       ├── product/
│       ├── project-management/
│       ├── paid-media/
│       ├── support/
│       ├── spatial-computing/
│       ├── specialized/
│       ├── game-development/
│       ├── academic/
│       ├── business/
│       ├── data/
│       ├── operations/
│       └── bonus/
├── templates/
│   ├── prd-template.md
│   ├── design-spec-template.md
│   ├── test-plan-template.md
│   └── agency-config.json
├── scripts/
│   ├── init-agency.sh
│   └── export-agency.sh
├── CLAUDE.md                    # Shared standards for all skills
└── README.md
```

## How Skills Coordinate

The CEO skill uses the Claude Code `Agent` tool to spawn department sub-agents and pass context:

1. **Goal tree** — every delegation includes the full B-id → P-id → F-id → T-id chain
2. **File references** — skills reference `~/.agency/projects/<slug>/` files, never duplicate content
3. **Governance gates** — each department signals the CEO when a deliverable is ready; the CEO presents it to the user
4. **Memory continuity** — each skill loads its own `MEMORY.md` to pick up where the last session ended

## Workflow Sequence

```
/start-project
  │
  ├─ /ceo: feasibility check → scope approval gate → [YOU APPROVE]
  │
  ├─ /product-manager: discovery questions → PRD → approval gate → [YOU APPROVE]
  │
  ├─ /qa-lead: test cases from PRD → test plan gate → [YOU APPROVE]
  │
  ├─ /uiux-designer: wireframes + CSS specs → design gate → [YOU APPROVE]
  │
  ├─ /fullstack-developer: task checkout → implement → commit
  │
  └─ /qa-lead: execute tests → release gate → [YOU APPROVE]
        └─ /ceo: delivery report
```

## Contributing

Skills are plain Markdown files — fork and customise your team freely.

- Add new specialist skills in `skills/specialists/<division>/<slug>/SKILL.md`
- Add new workflow skills in `skills/<skill-name>/SKILL.md`
- Register each new skill path in `.claude-plugin/marketplace.json`

---

## Credits

This project is built on the shoulders of two excellent open-source works:

- **[agency-agents](https://github.com/msitarzewski/agency-agents)** by [@msitarzewski](https://github.com/msitarzewski) — The specialist skills library is derived from this comprehensive collection of professional AI agent personalities, each with distinct expertise, workflows, and deliverables designed for tools like Claude Code.

- **[Project-AI-MemoryCore](https://github.com/Kiyoraka/Project-AI-MemoryCore)** by [@Kiyoraka](https://github.com/Kiyoraka) — The persistent memory architecture (identity core, session memory, preference tracking) is inspired by this open-source framework for building AI companions that maintain context across conversations using Markdown files as a database.
