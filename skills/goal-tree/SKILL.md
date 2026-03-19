---
name: goal-tree
description: "INVOKE THIS SKILL when delegating a task. Retrieves the full goal ancestry from task to root business objective so every agent understands why they are doing their work, not just what."
---

# Skill: goal-tree

Retrieve the full goal ancestry for any task — showing the chain from a specific task all the way up to the root business objective. Ensures every agent understands *why* they are doing their work, not just *what*.

---

## When to Use

- When delegating a task (CEO must include the goal tree in every delegation message)
- When starting a task (confirm you understand the "why")
- When a task seems to conflict with higher-level goals

---

## Steps

### 1. Read Goals File

Read `~/.agency/goals.md`.

If the file doesn't exist: STOP and report "Goals file missing — run start-project skill first."

### 2. Find the Task

Locate the task by its ID (T-<n>) in `goals.md` or `~/.agency/tasks.md`.

### 3. Trace the Ancestry

Walk up the parent chain:
- Task → Feature → Project Goal → Business Goal

Build the tree representation.

### 4. Output the Goal Tree

Format:

```markdown
## Goal Tree for Task #T-<id>

Business Goal: B-001 — <description>
  Purpose: <why this matters to the business/user>
  Success Metric: <how we know B-001 is achieved>
  └─ Project Goal: P-001 — <description>
       Scope: <what this project covers>
       └─ Feature: F-001 — <description>
            Requirement Source: PRD § <section>
            └─ Task: T-001 — <description> [CURRENT]
                 Owner: <agent>
                 Status: <status>
                 Acceptance Criteria:
                   ✓ AC-1.1: <criterion>
                   ✓ AC-1.2: <criterion>
```

### 5. Provide Context Note

After the tree, add:

```markdown
**Context for this task:**
You are working on T-<id> because:
→ The business wants to achieve: <B-id description>
→ This project was created to: <P-id description>
→ This feature enables: <F-id description>
→ Your specific task is: <T-id description>

Completing this task correctly advances the business goal by: <specific contribution>
```

---

## Updating the Goal Tree

### Adding a New Business Goal

```markdown
## B-<n>: <Description>

**Created:** <date>
**Status:** active | complete | paused
**Description:** <full description>
**Success Metric:** <measurable outcome>
**Target Users:** <who benefits>

### Child Goals
- P-<n>: <project goal>

### Tasks
(populated as work begins)
```

### Adding a Project Goal

Under its parent business goal:
```markdown
- P-<n>: <project description>
  - F-<n>: <feature>
    - T-<n>: <task> [pending]
```

---

## Goal Status Tracking

Update goal statuses as work progresses:

| Status | Meaning |
|--------|---------|
| `active` | Work is in progress toward this goal |
| `complete` | All tasks done, success metric achieved |
| `paused` | Temporarily deprioritised |
| `blocked` | Cannot proceed — dependency or decision needed |
| `cancelled` | No longer pursuing this goal — reason documented |

Log all status changes to `~/.agency/audit.log`:
```
[<date>] [CEO] GOAL_STATUS: B-001 → complete (all tasks done, metric achieved)
```
