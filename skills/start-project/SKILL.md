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
5. **Technology preferences** — any stack constraints or preferences?

Wait for all answers before proceeding.

### 2. Create Directory Structure

Create `~/.agency/` in the user's home directory if it doesn't exist:

```
~/.agency/
├── config.json
├── tasks.md
├── goals.md
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
  "settings": {
    "enable_memory": true,
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

### 6. Write `audit.log`

```
[<ISO-date>] [SYSTEM] PROJECT_INIT: Project <project-slug> initialised via start-project skill
[<ISO-date>] [SYSTEM] GOAL_CREATED: B-001 — <business goal>
[<ISO-date>] [SYSTEM] TASKS_CREATED: T-001 through T-005 created in tasks.md
```

### 7. Initialise Agent Memory Files

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

### 8. No `.gitignore` Update Needed

`~/.agency/` lives in the user's home directory, outside any project repository. No `.gitignore` entry is required.

### 9. Create Project Team

After workspace initialisation (Steps 1-9), the CEO creates the team and spawns all core agents:

1. **Run `TeamCreate`** with the project slug:
   ```
   TeamCreate(team_name="project-{slug}", description="Full delivery team for B-001: {goal}")
   ```

2. **Create native tasks** for all 5 deliverables:
   ```
   TaskCreate for: "Write PRD"            (owner: pm)
   TaskCreate for: "Write test plan"      (owner: qa)
   TaskCreate for: "Create design spec"    (owner: designer)
   TaskCreate for: "Implement feature"    (owner: dev)
   TaskCreate for: "Validate implementation" (owner: qa)
   ```

3. **Spawn all 5 core agents** as teammates (via CEO, after feasibility gate):
   ```
   Agent(subagent_type="asa:product-manager",  team_name="project-{slug}", name="pm")
   Agent(subagent_type="asa:uiux-designer",    team_name="project-{slug}", name="designer")
   Agent(subagent_type="asa:qa-lead",          team_name="project-{slug}", name="qa")
   Agent(subagent_type="asa:fullstack-developer", team_name="project-{slug}", name="dev")
   Agent(subagent_type="asa:delegate-agent",    team_name="project-{slug}", name="delegate")
   ```

All agents go idle after spawning. CEO assigns work via SendMessage. Specialists (spawned by `delegate`) are ephemeral — spawned WITHOUT `team_name`.

### 10. Confirm Initialisation

Output a summary:

```
✓ Agency workspace initialised for project: <project-slug>

Files created:
  ~/.agency/config.json
  ~/.agency/tasks.md (5 tasks registered)
  ~/.agency/goals.md (B-001 created)
  ~/.agency/audit.log
  ~/.agency/projects/<slug>/ (4 document placeholders)
  ~/.agency/memory/<agent>/MEMORY.md (5 agents)

Team: project-<slug> created with 5 core agents
Tasks: 5 native tasks created (T-001 through T-005)

Next: CEO runs feasibility gate, then spawns team. Business goal: <B-001>
```

## Memory Protocol

At session end: Run `memory-sync` skill

Track in memory:
- Initial project setup decisions
- User preferences for project structure
- Any setup issues encountered
