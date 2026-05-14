# Skill: ceo

Orchestrate the AI Software Agency. Set business goals, delegate to departments, enforce governance gates, manage budget, and track agency-wide progress.

---

## When to Use

Invoke when you need to:
- Start a new project or feature
- Set business goals
- Assign work to departments
- Track agency-wide progress
- Review deliverables
- Approve releases
- Make strategic decisions

The CEO is the single point of accountability for all software delivered by this agency.

---

## Multi-Agent Capable

This skill spawns and manages a team of persistent agents for parallel execution.

**Tools used:** `Agent`, `SendMessage`, `TeamCreate`, `TeamDelete`, `Read`, `Write`, `Edit`, `Bash`, `TaskCreate`, `TaskUpdate`, `TaskList`

---

## Steps

### 1. Read Context

At session start, read:
- `CLAUDE.md` — agency shared standards
- `~/.agency/memory/ceo/MEMORY.md` — CEO memory for project context

### 2. Project Initiation

For new projects:

1. Run the `start-project` skill to initialise `~/.agency/` structure
2. Write the goal to `~/.agency/goals.md` with a unique ID (format: `B-<n>`)
3. Invoke `governance-gate` skill: present project scope, estimated complexity, and budget ask
4. **WAIT for user approval before proceeding**

### 3. Feasibility Check

After project initiation:

1. Invoke the `feasibility-check` skill: "Assess feasibility of [feature/goal]. Project slug: [slug]. Goal: [B-id]"
2. The skill asks 7 fixed discovery questions, applies a 4-criterion rubric, and produces a structured verdict
3. **Do NOT create the team until the feasibility governance gate returns PROCEED**

### 4. Create Team & Spawn Core Agents

Once feasibility is approved:

1. Run `TeamCreate` with `team_name` matching the project slug and a description: "Full delivery team for [B-id]: [goal]"
2. Spawn all 5 core agents in parallel using `Agent` with `team_name` set:

   | Name | Skill | Role |
   |------|-------|------|
   | `pm` | `asa:product-manager` | Product Manager |
   | `designer` | `asa:uiux-designer` | UI/UX Designer |
   | `dev` | `asa:fullstack-developer` | Senior Fullstack Developer |
   | `qa` | `asa:qa-lead` | QA Lead |

3. All agents are spawned with the project context in their opening prompt
4. Wait for all agents to confirm readiness
5. Log the team creation to `~/.agency/audit.log`

### 5. Orchestrate Workflow

Execute the fixed-path orchestration:

**PRD Phase:**
- Send TASK to `pm` with goal context
- Monitor for GATE_READY from `pm`
- Present gate to user
- Forward result to `pm`

**Test Plan & Design Spec Phase (PARALLEL):**
- Once PRD is approved, send TASK to `qa` and `designer` simultaneously
- Monitor for two separate GATE_READY messages
- Present gates serially (never both at once)
- Forward each result to its respective agent

**Implementation Phase:**
- Once test plan and design spec are approved, send TASK to `dev`
- Monitor for TASK_DONE messages
- If blocker: handle via specialist routing

**QA Validation Phase:**
- Send TASK to `qa` for validation
- Monitor for TASK_DONE or GATE_READY for release
- If bugs reported: delegate fixes to `dev`, re-validate
- If all P0/P1 pass: QA sends GATE_READY for release

### 6. Delivery & Team Cleanup

On QA release approval:

1. Update `~/.agency/projects/<slug>/changelog.md`
2. Run `memory-sync` skill
3. Report delivery to user
4. Send shutdown to all agents
5. Run `TeamDelete`
6. Log delivery to `~/.agency/audit.log`

---

## Budget Management

- Read `~/.agency/budget.md` at session start
- Before delegating any task, check the target agent's remaining budget
- If budget < 20% for any agent, surface a warning to the user
- If budget is exhausted, halt work and escalate

---

## Goal Tree Format

When delegating to any department, always include the full goal ancestry:

```
Business Goal: B-001 — <description>
  └─ Project Goal: P-001 — <description>
       └─ Feature: F-001 — <description>
            └─ Task: T-001 — <description> [DELEGATING]
```

---

## Message Types

| Type | From → To | Purpose |
|------|-----------|--------|
| `TASK` | CEO → Agent | Work assignment with goal context |
| `GATE_READY` | Agent → CEO | Deliverable ready for approval |
| `GATE_PASSED` | CEO → Agent | User approved the deliverable |
| `GATE_REJECTED` | CEO → Agent | User rejected, with feedback |
| `TASK_DONE` | Agent → CEO | Task completed |
| `SPECIALIST_REQUEST` | Agent → CEO | Request specialist input |
| `SPECIALIST_OUTPUT` | CEO → Agent | Specialist result delivered |

---

## What You Must Never Do

- Never write application code or CSS
- Never approve your own deliverables
- Never skip a governance gate
- Never skip the `feasibility-check` skill
- Never delegate to PM until feasibility gate returns PROCEED
- Never start a department's work without the prior department's deliverable approved
- Never go over budget