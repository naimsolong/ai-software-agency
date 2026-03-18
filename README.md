# AI Software Agency

A complete, CEO-led AI Software Agency packaged as a Claude Code plugin. It ships a team of specialised Claude Sub Agents across four departments — Product, Design, Development, and QA — orchestrated by a strategic CEO agent.

## Agency Values

1. **Transparency first** — every decision is documented; agents never act silently on critical choices
2. **Quality over speed** — ship correct software, not fast software
3. **Human in the loop for critical decisions** — governance gates are mandatory before any handoff
4. **Goal-aware execution** — every agent always knows *why* it is doing a task, not just *what*
5. **Atomic work** — a task is claimed before starting; duplicate work never happens
6. **Memory continuity** — agents update their memory before ending every session

---

## What It Does

The AI Software Agency turns a business goal into production-ready software autonomously, with human confirmation gates at every critical decision point.

```
You: "Build a user authentication system"
  └─ CEO sets goal, asks for scope approval
  └─ Product Manager asks 3-5 questions, writes PRD → you approve it
  └─ QA Lead writes test cases from PRD (before any code) → you approve
  └─ UI/UX Designer creates pixel-perfect wireframes + Tailwind specs → you approve
  └─ Developer implements from specs, commits to git
  └─ QA Lead validates implementation, reports pass/fail
  └─ CEO delivers: "Done. All tests pass."
```

## Departments & Agents

| Agent | Role | Model | Key Deliverable |
|-------|------|-------|-----------------|
| `ceo` | Orchestrates all departments, enforces budget and governance | Opus | Project status, goal tree |
| `product-manager` | Refines requirements, writes PRDs | Sonnet | `~/.agency/projects/<slug>/prd.md` |
| `uiux-designer` | Creates pixel-perfect design specs and wireframes | Sonnet | `~/.agency/projects/<slug>/design.md` |
| `fullstack-developer` | Implements from approved specs | Sonnet | Application code (git commits) |
| `qa-lead` | Writes tests before dev, validates after dev | Sonnet | `~/.agency/projects/<slug>/tests.md` |

## Specialist Agent Library

Beyond the five core agents, the agency ships **156 specialist agents** across 13 divisions. Any core agent may delegate to a specialist when the task requires domain depth beyond the core team's scope.

```
CEO
└── Specialist Agent Library (156 agents across 13 divisions)
    ├── agents/engineering/         — Backend, frontend, DevOps, security, AI, etc.
    ├── agents/design/              — Brand, UX research, visual storytelling, etc.
    ├── agents/marketing/           — SEO, social, content, growth, TikTok, etc.
    ├── agents/sales/               — Deal strategy, pipeline, outbound, coaching
    ├── agents/testing/             — API, accessibility, performance, workflow
    ├── agents/product/             — Sprint prioritization, feedback, trend research
    ├── agents/project-management/  — Studio ops, Jira workflow, experiment tracking
    ├── agents/paid-media/          — PPC, programmatic, creative strategy, tracking
    ├── agents/support/             — Analytics, finance, legal compliance, infra
    ├── agents/spatial-computing/   — visionOS, XR, macOS Metal, terminal integration
    ├── agents/specialized/         — Blockchain, MCP builder, Salesforce, ZK, etc.
    ├── agents/game-development/    — Unity, Unreal, Godot, Roblox, Blender, etc.
    └── agents/academic/            — Anthropology, history, psychology, narratology
```

| Division | Agents | Examples |
|----------|--------|---------|
| `engineering/` | 23 | backend-architect, frontend-developer, security-engineer, devops-automator, ai-engineer |
| `marketing/` | 27 | seo-specialist, tiktok-strategist, content-creator, growth-hacker, linkedin-content-creator |
| `specialized/` | 27 | mcp-builder, salesforce-architect, blockchain-security-auditor, workflow-architect |
| `game-development/` | 20 | unity-architect, godot-gameplay-scripter, narrative-designer, unreal-world-builder |
| `design/` | 8 | ui-designer, ux-researcher, brand-guardian, image-prompt-engineer, visual-storyteller |
| `testing/` | 8 | api-tester, accessibility-auditor, performance-benchmarker, reality-checker |
| `sales/` | 8 | deal-strategist, outbound-strategist, pipeline-analyst, discovery-coach |
| `paid-media/` | 7 | ppc-strategist, programmatic-buyer, tracking-specialist, creative-strategist |
| `support/` | 6 | finance-tracker, legal-compliance-checker, analytics-reporter, infra-maintainer |
| `spatial-computing/` | 6 | visionos-spatial-engineer, xr-immersive-developer, xr-interface-architect |
| `product/` | 5 | sprint-prioritizer, feedback-synthesizer, trend-researcher, behavioral-nudge-engine |
| `project-management/` | 6 | project-shepherd, jira-workflow-steward, studio-producer, studio-operations |
| `academic/` | 5 | academic-anthropologist, academic-historian, academic-psychologist, academic-narratologist |

**Delegation rules:**
- Specialists are invoked via the `Agent` tool using their path: e.g. `agents/engineering/engineering-frontend-developer`
- Specialists operate under the same governance framework — handoffs still require a `governance-gate`
- Specialists are stateless by default; the CEO may create a persistent memory file for recurring specialists
- Never delegate to a specialist if the task is within a core agent's domain

### Hiring New Agents

If a project needs a domain that no existing specialist covers, the agency can grow its own library on-demand via a **governance-gated hire**:

```
CEO identifies gap
  └─ Delegates to specialized-agent-builder
       └─ Inspects library, compares 2+ existing agents
            └─ Drafts new agent config
                 └─ hire-agent skill → Governance Gate → [YOU APPROVE]
                      └─ Agent file written to agents/<division>/<slug>.md
```

**How to trigger a hire:**
```
@ceo I need an agent for [domain] — nothing in the library covers it.
```

The CEO will delegate to `specialized-agent-builder`, which will inspect the existing library, draft a new agent, and present the full config for your approval before writing anything. No agent file is ever created without your explicit sign-off.

**Hire governance rules:**
- Only the CEO may initiate a hire
- The agent builder must compare ≥ 2 existing agents before drafting
- `Bash` and `Agent` tools are never granted to new specialists without explicit CEO authorisation in the hire request
- Every hire and rejection is logged to `~/.agency/audit.log` with a rollback tag
- The project task that triggered the hire is a blocker until the hire is approved

### Creating New Skills

If a workflow step should be reusable across projects or agents but no existing skill covers it, the agency can author a new plugin skill on-demand via a **governance-gated scaffold**:

```
CEO identifies workflow gap
  └─ Delegates to specialized-skill-builder
       └─ Inspects skills library + plugin.json
            └─ Defines spec (slug, worker surface, UI surface)
                 └─ Drafts SKILL.md + plugin.json append
                      └─ create-skill skill → Governance Gate → [YOU APPROVE]
                           └─ skills/<slug>/SKILL.md written
                                └─ .claude-plugin/plugin.json updated
                                     └─ Package verified ✓
```

**How to trigger a skill creation:**
```
@ceo I need a new skill for [workflow] — no existing skill covers it.
```

**Alpha SDK runtime conventions the agent enforces:**

| Convention | Rule |
|-----------|------|
| File path | `skills/<slug>/SKILL.md` — filename must be exactly `SKILL.md` |
| Registration | `"skills/<slug>"` appended to `.claude-plugin/plugin.json` |
| User invocation | `/<slug>` |
| Worker surface | Inline Markdown prompt — runs in calling agent's session, same tools |
| UI surface | Terminal Markdown — `✓` success, `⚠️` warning, `✗` failure |
| Required sections | H1 title, one-liner, `## When to Use`, `## Steps`, final `✓` block |

**Skill creation governance rules:**
- Only the CEO may initiate skill creation
- The skill builder must inspect ≥ 2 existing skills before drafting
- `plugin.json` updates are append-only — no existing entries removed
- Slug must match the directory name exactly
- Verification is mandatory after writing (file, sections, JSON validity, slug uniqueness)
- Every outcome is logged to `~/.agency/audit.log`

---

## Key Features

- **Human confirmation gates** — You approve every deliverable before work advances to the next stage. No department proceeds without your sign-off.
- **Test-first workflow** — QA writes the test plan *before* the developer starts coding.
- **Atomic task checkout** — No two agents work on the same task. Each task is locked before work begins.
- **Persistent memory** — Agents remember decisions, preferences, and context across sessions.
- **Budget governance** — Per-agent budget tracking with automatic alerts and hard stops.
- **Goal-aware execution** — Every task carries its full goal ancestry so agents always know *why*, not just *what*.
- **Audit log** — Every action is appended to `~/.agency/audit.log` for full transparency.
- **Rollback support** — Approved states are tagged in the audit log and can be restored from git history.
- **Portable templates** — Export and import your agency configuration with secret scrubbing.

## Installation

### As a Claude Code Plugin (project-scoped)

1. Clone or copy this repository into your project:
   ```bash
   git clone <this-repo> .claude/plugins/ai-software-agency
   ```

2. Or install globally in `~/.claude/plugins/ai-software-agency`

3. The agents, skills, and hooks load automatically when Claude Code starts.

### Manual (copy agents to project)

Copy the `agents/` directory to your project's `.claude/agents/`:

```bash
cp -r agents/* .claude/agents/
```

## Quick Start

### Option A — Using the `start-project` skill (recommended)

In Claude Code, invoke:
```
/start-project
```

The skill will walk you through:
1. Naming the project
2. Defining the business goal
3. Setting the budget
4. Creating the `~/.agency/` workspace
5. Handing off to the CEO to begin

### Option B — Using the init script

```bash
bash scripts/init-agency.sh my-project-slug
```

Then invoke the CEO agent:
```
@ceo I want to build [describe your project]
```

### Option C — Direct agent invocation

Invoke any agent directly from Claude Code:
```
@ceo        — Start a project or get an agency status report
@product-manager — Create or refine requirements
@uiux-designer   — Design a feature
@fullstack-developer — Implement a feature
@qa-lead         — Write tests or validate an implementation
```

## Project Workspace

Every project uses a `~/.agency/` directory in your home directory (shared across all projects):

```
~/.agency/
├── config.json           # Agency configuration and budgets
├── tasks.md              # Atomic task registry
├── goals.md              # Business goal hierarchy
├── budget.md             # Per-agent spend tracking
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

Agents use the `task-checkout` skill to atomically claim a task before starting. No agent starts work on an already `in-progress` task.

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

Agents maintain persistent memory across sessions using Markdown files at `~/.agency/memory/<agent>/MEMORY.md`.

**At the start of every session**, each agent:
1. Reads its `MEMORY.md` — loading project context, key decisions, and user preferences
2. Checks `~/.agency/tasks.md` for any previously `in-progress` task

**At the end of every session**, each agent invokes the `memory-sync` skill to record:
- Decisions made (with rationale)
- User preference signals
- Patterns discovered
- Open items and blockers

Specialist agents are stateless by default. For recurring specialists, the CEO may create a memory file at `~/.agency/memory/<division>-<agent-name>/MEMORY.md`.

## Budget Awareness

Per-agent budgets are tracked in `~/.agency/budget.md`. Rules:

- Every agent invokes `budget-check` at the **start of every task**
- If remaining budget is **< 20%**, the agent alerts the CEO before proceeding
- If budget is **exhausted**, the agent stops immediately and escalates — never goes over
- Only the CEO can approve budget reallocations between agents

## Commit Message Format

All agent commits follow this format:

```
[agent:<type>] <verb>(<scope>): <description>

Task: #<task-id>
Goal: <goal-id>
```

| Prefix | Agent |
|--------|-------|
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
| `task-checkout` | Agents invoke automatically | Atomically claim a task before starting |
| `budget-check` | Agents invoke automatically | Check and log spend per agent/task |
| `memory-sync` | Agents invoke at session end | Persist learnings to agent MEMORY.md |
| `governance-gate` | Agents invoke before handoffs | Present deliverable for human approval |
| `goal-tree` | Agents invoke for context | Show full goal ancestry for a task |
| `hire-agent` | `specialized-agent-builder` invokes | Inspect library, draft new agent, governance-gate the hire |
| `create-skill` | `specialized-skill-builder` invokes | Inspect skills library, draft SKILL.md + plugin.json update, governance-gate the new skill |

## Configuration

Edit `~/.agency/config.json` to customise:

```json
{
  "budget": {
    "total": 50,
    "per_agent_percentage": {
      "ceo": 0.20,
      "fullstack-developer": 0.35
    },
    "alert_threshold_pct": 20
  },
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
│   └── plugin.json              # Plugin manifest
├── agents/
│   ├── ceo.md                   # CEO orchestrator
│   ├── product-manager.md
│   ├── uiux-designer.md
│   ├── fullstack-developer.md
│   └── qa-lead.md
├── skills/
│   ├── start-project/SKILL.md
│   ├── task-checkout/SKILL.md
│   ├── budget-check/SKILL.md
│   ├── memory-sync/SKILL.md
│   ├── governance-gate/SKILL.md
│   ├── goal-tree/SKILL.md
│   ├── hire-agent/SKILL.md          ← draft + governance-gate a new agent
│   └── create-skill/SKILL.md        ← scaffold + governance-gate a new skill
├── templates/
│   ├── prd-template.md
│   ├── design-spec-template.md
│   ├── test-plan-template.md
│   └── agency-config.json
├── scripts/
│   ├── init-agency.sh
│   └── export-agency.sh
├── hooks/
│   └── hooks.json
├── CLAUDE.md                    # Shared standards for all agents
└── README.md
```

## How Agents Coordinate

The CEO uses the Claude Code `Agent` tool to spawn department sub-agents and pass context:

1. **Goal tree** — every delegation includes the full B-id → P-id → F-id → T-id chain
2. **File references** — agents reference `~/.agency/projects/<slug>/` files, never duplicate content
3. **Governance gates** — each department signals the CEO when a deliverable is ready; the CEO presents it to the user
4. **Memory continuity** — each agent loads its own `MEMORY.md` to pick up where the last session ended

## Workflow Sequence

```
/start-project
  │
  ├─ CEO: scope approval gate → [YOU APPROVE]
  │
  ├─ PM: discovery questions → PRD → approval gate → [YOU APPROVE]
  │
  ├─ QA: test cases from PRD → test plan gate → [YOU APPROVE]
  │
  ├─ Designer: wireframes + CSS specs → design gate → [YOU APPROVE]
  │
  ├─ Dev: task checkout → implement → commit
  │
  └─ QA: execute tests → release gate → [YOU APPROVE]
        └─ CEO: delivery report
```

## Contributing

Agents are plain Markdown files — fork and customise your team freely.

- Add new agents in `agents/`
- Add new skills in `skills/<skill-name>/SKILL.md`
- Adjust budget splits in `templates/agency-config.json`

---

## Credits

This project is built on the shoulders of two excellent open-source works:

- **[agency-agents](https://github.com/msitarzewski/agency-agents)** by [@msitarzewski](https://github.com/msitarzewski) — The specialist agent library (156 agents across 13 divisions) is derived from this comprehensive collection of professional AI agent personalities, each with distinct expertise, workflows, and deliverables designed for tools like Claude Code.

- **[Project-AI-MemoryCore](https://github.com/Kiyoraka/Project-AI-MemoryCore)** by [@Kiyoraka](https://github.com/Kiyoraka) — The persistent memory architecture (identity core, session memory, preference tracking) is inspired by this open-source framework for building AI companions that maintain context across conversations using Markdown files as a database.
