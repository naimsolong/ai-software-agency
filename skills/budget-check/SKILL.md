# Skill: budget-check

Check the current budget allocation and spending for an agent before starting a task. Enforces spend limits and escalates to the CEO when budgets are running low.

---

## When to Use

Invoke at the **start of every task**. The CEO should also invoke this before delegating expensive tasks to departments.

---

## Steps

### 1. Read Budget File

Read `~/.agency/budget.md`.

If the file doesn't exist: STOP and report "Budget file missing — workspace may not be initialised."

### 2. Identify Your Budget

Find your agent's row in the Per-Agent Allocation table:
- Allocated amount
- Amount spent so far
- Remaining amount
- Percentage used

### 3. Evaluate Budget Status

Calculate:
```
remaining_pct = (remaining / allocated) * 100
```

| Remaining % | Status | Action |
|-------------|--------|--------|
| > 50% | Green | Proceed normally |
| 20–50% | Yellow | Note usage, proceed but be efficient |
| 10–20% | Orange | Alert CEO before starting task |
| < 10% | Red | STOP — escalate to CEO for authorisation |
| 0% | Exhausted | STOP — cannot proceed |

### 4. Low Budget Escalation

If remaining < 20%, before proceeding send this message to CEO:

```
⚠️ Budget Alert: <agent-name>

Current spend: <spent> / <allocated> (<pct>% used)
Remaining: <remaining>

Task about to start: <task title>
Estimated cost for this task: <rough estimate>

Please confirm: APPROVE to proceed | ADJUST to reallocate budget | HALT to stop work.
```

**Wait for CEO response before proceeding.**

### 5. Log the Check

Append to `~/.agency/budget.md` under Spend Log:

```
| <ISO-date> | <agent> | T-<id> | <estimated cost or "TBD"> | Starting task |
```

### 6. Log to Audit

Append to `.agency/audit.log`:
```
[<ISO-date>] [<agent-name>] BUDGET_CHECK: T-<id> — remaining: <remaining> (<pct>% left)
```

### 7. Confirm or Report

**If budget is sufficient:**
```
✓ Budget check passed.
  Agent: <agent>
  Allocated: <amount>
  Spent: <amount> (<pct>%)
  Remaining: <amount>
  Status: Green — proceeding
```

**If budget is exhausted:**
```
✗ Budget exhausted for <agent>.
  Allocated: <amount>
  Spent: <amount> (100%)
  Remaining: 0

Escalating to CEO. Work halted on Task #<id>.
```

---

## Updating Spend After Task Completion

When a task is complete, update `budget.md`:

1. Add actual spend to the agent's "Spent" total
2. Recalculate "Remaining"
3. Add a completion row to the Spend Log:
```
| <ISO-date> | <agent> | T-<id> | <actual cost> | Task complete |
```

---

## CEO Budget Reallocation

Only the CEO can approve budget reallocations. The format is:

```json
{
  "action": "reallocate",
  "from_agent": "ceo",
  "to_agent": "fullstack-developer",
  "amount": 1000,
  "reason": "Additional implementation tasks added",
  "approved_by": "CEO",
  "date": "<ISO-date>"
}
```

Log all reallocations to `~/.agency/audit.log`:
```
[<ISO-date>] [CEO] BUDGET_REALLOCATE: <amount> moved from <from> to <to> — <reason>
```
