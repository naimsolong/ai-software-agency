---
name: task-checkout
description: "INVOKE THIS SKILL before starting any task. Atomically claims a task from ~/.agency/tasks.md to prevent two agents working on the same task simultaneously."
---

# Skill: task-checkout

Atomically claim a task from `~/.agency/tasks.md` before starting work. Prevents two agents from working on the same task simultaneously (no double-work).

---

## When to Use

Every agent **must** invoke this skill before beginning any task. If the checkout fails (task already claimed), do not proceed — report the conflict to the CEO.

---

## Steps

### 1. Identify the Target Task

Know which task ID you are claiming before invoking this skill. The task ID comes from:
- The CEO's delegation message (e.g., "claim task T-003")
- The current task list in `~/.agency/tasks.md`

### 2. Read the Task Registry

Read `~/.agency/tasks.md` and find the target task row.

### 3. Check Task Status

**If status is `pending`:** Proceed to Step 4 — claim it.

**If status is `in-progress`:**
- Read the agent name and timestamp in the task entry
- STOP — do not claim the task
- Report to CEO: "Task #<id> is already in-progress by <agent> since <timestamp>. Cannot checkout."

**If status is `done`:**
- STOP — task is already complete
- Report to CEO: "Task #<id> is already done. No action taken."

**If status is `blocked`:**
- STOP — task is blocked
- Read the block reason
- Report to CEO: "Task #<id> is blocked: <reason>. Needs resolution before checkout."

### 4. Claim the Task

Update the task entry in `~/.agency/tasks.md`:
- Change `Status` from `pending` to `in-progress`
- Add agent name and ISO timestamp to the `Updated` field
- Add a claim note in the `Owner` column if not already set

Updated row format:
```
| T-003 | Create design spec | uiux-designer [claimed 2024-03-15T10:30:00Z] | in-progress | 2024-03-14 | 2024-03-15 |
```

### 5. Log to Audit

Append to `.agency/audit.log`:
```
[<ISO-date>] [<agent-name>] TASK_CHECKOUT: T-<id> "<task title>" claimed by <agent>
```

### 6. Confirm Checkout

Output:
```
✓ Task #<id> checked out: "<task title>"
  Status: in-progress
  Agent: <your agent name>
  Time: <ISO timestamp>

Proceeding with task.
```

---

## Completing a Task

When your work is done, update the task:

1. Change status from `in-progress` to `done` (or `review` if awaiting governance gate)
2. Update the `Updated` timestamp
3. Append to `~/.agency/audit.log`:
```
[<ISO-date>] [<agent-name>] TASK_COMPLETE: T-<id> "<task title>" completed
```

---

## Blocking a Task

If you cannot proceed with a task:

1. Change status to `blocked`
2. Add a block note to the task row: `BLOCKED: <reason>`
3. Append to `~/.agency/audit.log`:
```
[<ISO-date>] [<agent-name>] TASK_BLOCKED: T-<id> "<task title>" — <reason>
```
4. Report to CEO immediately

---

## Important Rules

- Never skip this skill — it is the only protection against duplicate work
- Never claim a task that belongs to a different department without CEO authorisation
- Never modify any task status except the one you are claiming
- If `~/.agency/tasks.md` is missing: STOP and report to CEO — the workspace may not be initialised
