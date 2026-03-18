# AI Software Agency

A complete, CEO-led AI Software Agency packaged as a Claude Code plugin. It ships a team of specialised Claude Sub Agents across four departments — Product, Design, Development, and QA — orchestrated by a strategic CEO agent.

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

## Skills Reference

| Skill | Invoke | Description |
|-------|--------|-------------|
| `start-project` | `/start-project` | Initialise agency workspace, begin CEO orchestration |
| `task-checkout` | Agents invoke automatically | Atomically claim a task before starting |
| `budget-check` | Agents invoke automatically | Check and log spend per agent/task |
| `memory-sync` | Agents invoke at session end | Persist learnings to agent MEMORY.md |
| `governance-gate` | Agents invoke before handoffs | Present deliverable for human approval |
| `goal-tree` | Agents invoke for context | Show full goal ancestry for a task |

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
│   └── goal-tree/SKILL.md
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
