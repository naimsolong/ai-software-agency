# Skill: start-project

Initialize the AI Software Agency workspace for a new project. Creates the `~/.agency/` directory structure in the user's home directory, sets up all required files, and hands control to the CEO to begin orchestration.

---

## When to Use

Invoke at the very beginning of any new project or major feature initiative — before any department work begins.

---

## Steps

### 1. Collect Project Information

Ask the user for:

1. **Project name** — used as the directory slug (lowercase, hyphens)
2. **Business goal** — one sentence: what problem does this solve?
3. **Target users** — who will use this software?
4. **Key features** — bullet list of the 3-5 most important capabilities
5. **Budget** — total token budget for this project (or use default from config)
6. **Technology preferences** — any stack constraints or preferences?

Wait for all answers before proceeding.

### 2. Create Directory Structure

Create `~/.agency/` in the user's home directory if it doesn't exist:

```
~/.agency/
├── config.json
├── tasks.md
├── goals.md
├── budget.md
├── audit.log
├── projects/
│   └── <project-slug>/
│       ├── prd.md          (empty, will be written by PM)
│       ├── design.md       (empty, will be written by Designer)
│       ├── tests.md        (empty, will be written by QA)
│       └── changelog.md    (empty, will be written by Dev on merge)
└── memory/
    ├── ceo/MEMORY.md
    ├── product-manager/MEMORY.md
    ├── uiux-designer/MEMORY.md
    ├── fullstack-developer/MEMORY.md
    └── qa-lead/MEMORY.md
```

### 3. Write `config.json`

```json
{
  "company": "<company name or 'AI Software Agency'>",
  "project": "<project-slug>",
  "created": "<ISO-date>",
  "budget": {
    "total": <budget-value>,
    "per_agent": {
      "ceo": 0.2,
      "product-manager": 0.15,
      "uiux-designer": 0.15,
      "fullstack-developer": 0.35,
      "qa-lead": 0.15
    }
  },
  "settings": {
    "enable_memory": true,
    "enable_budget_tracking": true,
    "enable_audit_log": true,
    "require_governance_gates": true
  }
}
```

### 4. Write `goals.md`

```markdown
# Agency Goals

## B-001: <Business Goal>

**Created:** <ISO-date>
**Status:** active
**Description:** <business goal one-liner>
**Success Metric:** <how we measure success>
**Target Users:** <users>

### Child Goals
- P-001: <project goal — derived from B-001>

### Tasks
(populated by departments as work begins)
```

### 5. Write `tasks.md`

```markdown
# Task Registry

<!-- Format: | ID | Title | Owner | Status | Created | Updated |-->

| ID    | Title                          | Owner           | Status   | Created    | Updated    |
|-------|-------------------------------|-----------------|----------|------------|------------|
| T-001 | Create PRD                    | product-manager | pending  | <date>     | <date>     |
| T-002 | Write test plan from PRD      | qa-lead         | pending  | <date>     | <date>     |
| T-003 | Create design spec            | uiux-designer   | pending  | <date>     | <date>     |
| T-004 | Implement features            | fullstack-developer | pending | <date>  | <date>     |
| T-005 | Execute test validation       | qa-lead         | pending  | <date>     | <date>     |
```

### 6. Write `budget.md`

```markdown
# Budget Tracker

**Project:** <project-slug>
**Total Budget:** <total>
**Allocated:** <total>
**Spent:** 0
**Remaining:** <total>

## Per-Agent Allocation

| Agent                | Allocated | Spent | Remaining | % Used |
|----------------------|-----------|-------|-----------|--------|
| ceo                  | <20%>     | 0     | <20%>     | 0%     |
| product-manager      | <15%>     | 0     | <15%>     | 0%     |
| uiux-designer        | <15%>     | 0     | <15%>     | 0%     |
| fullstack-developer  | <35%>     | 0     | <35%>     | 0%     |
| qa-lead              | <15%>     | 0     | <15%>     | 0%     |

## Spend Log

| Date | Agent | Task | Estimated Cost | Notes |
|------|-------|------|---------------|-------|
```

### 7. Write `audit.log`

```
[<ISO-date>] [SYSTEM] PROJECT_INIT: Project <project-slug> initialised via start-project skill
[<ISO-date>] [SYSTEM] GOAL_CREATED: B-001 — <business goal>
[<ISO-date>] [SYSTEM] TASKS_CREATED: T-001 through T-005 created in tasks.md
```

### 8. Initialise Agent Memory Files

Write a starter `MEMORY.md` for each agent:

```markdown
# <Agent Name> Memory — Project: <project-slug>

**Initialised:** <ISO-date>
**Project:** <project-slug>
**Business Goal:** <B-001 description>

## Identity Core
<agent role and personality reminder>

## Project Context
- Stack: TBD (to be determined during implementation)
- Key Decisions: (none yet)

## User Preferences
(to be populated through interactions)

## Decision Log
(to be populated as work progresses)

## Learned Patterns
(to be populated through the project lifecycle)
```

### 9. No `.gitignore` Update Needed

`~/.agency/` lives in the user's home directory, outside any project repository. No `.gitignore` entry is required.

### 10. Confirm Initialisation

Output a summary:

```
✓ Agency workspace initialised for project: <project-slug>

Files created:
  ~/.agency/config.json
  ~/.agency/tasks.md (5 tasks registered)
  ~/.agency/goals.md (B-001 created)
  ~/.agency/budget.md (<budget> allocated)
  ~/.agency/audit.log
  ~/.agency/projects/<slug>/ (4 document placeholders)
  ~/.agency/memory/<agent>/MEMORY.md (5 agents)

Next: CEO will begin orchestration. Business goal: <B-001>
```

Delegate to the CEO agent to begin Step 1 of the orchestration workflow.
