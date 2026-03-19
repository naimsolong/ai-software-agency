---
name: governance-gate
description: "INVOKE THIS SKILL before any department handoff. Presents a deliverable to the user for explicit approval — a mandatory blocking gate that no work advances past without an APPROVED/REJECTED/CHANGES response."
---

# Skill: governance-gate

Present a deliverable or plan to the user for explicit approval before proceeding. This is a mandatory blocking gate — no work advances to the next department without passing through here.

---

## When to Use

Required at every department handoff:

1. **CEO → All:** Project scope and budget approval (before any work starts)
2. **Product Manager → Design/Dev/QA:** PRD approval
3. **QA Lead → Development:** Test plan approval
4. **UI/UX Designer → Development:** Design spec approval
5. **QA Lead → CEO:** Release readiness approval (before delivery)

**Never skip this gate.** Even if the deliverable seems obviously correct.

---

## Steps

### 1. Identify the Gate Context

Know:
- **Which agent** is presenting the deliverable
- **What deliverable** is being presented (PRD, design spec, test plan, etc.)
- **What happens next** if approved
- **What the rollback point** is

### 2. Prepare the Presentation

Structure the governance gate presentation:

```markdown
---
## 🔍 Governance Gate: <Deliverable Name>

**Presented by:** <agent-name>
**Deliverable:** <file path>
**Date:** <ISO-date>
**Goal:** <B-id> — <description>

### What this is
<One paragraph summary of what was created and why>

### What you are approving
<Bulleted list of the key decisions/commitments in this deliverable>

### What happens if you approve
<What the next step will be — which department picks this up>

### What changes if you reject
<What will be revised — be specific>

### The Deliverable
---

<Full content of the deliverable file — pasted in full, not summarised>

---
### Action Required

Please respond with one of:
- **APPROVED** — proceed to next stage
- **REJECTED: <reason>** — go back to revise
- **CHANGES: <specific requests>** — revise these points and resubmit

This gate will not proceed until you respond.
```

### 3. Present to User

Output the full governance gate presentation. Include the complete deliverable content — not a summary.

### 4. Wait for Response

**Do not proceed.** Do not take any action. Do not make assumptions about what the user will say. Wait for an explicit response.

If the user asks a clarifying question instead of approving/rejecting — answer it, then repeat the approval prompt.

### 5. Handle the Response

**APPROVED:**
1. Log approval to `~/.agency/audit.log`:
```
[<ISO-date>] [<agent>] GATE_PASSED: <deliverable> approved by user
[<ISO-date>] [<agent>] ROLLBACK:<agent>-v<n> — <deliverable> approved at <file-path>
```
2. Update task status to `done` in `~/.agency/tasks.md`
3. Report to CEO: "Gate passed. [Deliverable] approved. Ready for next stage."

**REJECTED:**
1. Log rejection to `~/.agency/audit.log`:
```
[<ISO-date>] [<agent>] GATE_REJECTED: <deliverable> rejected — <user reason>
```
2. Update task status back to `in-progress`
3. Revise the deliverable based on rejection reason
4. Re-run the governance gate when revision is complete

**CHANGES:**
1. Log to `audit.log`:
```
[<ISO-date>] [<agent>] GATE_CHANGES_REQUESTED: <deliverable> — <change summary>
```
2. Apply requested changes to the deliverable
3. Re-run the governance gate with a note: "Changes applied per your request: [summary]"

---

## Rollback Tags

Every GATE_PASSED entry creates a rollback marker in `audit.log`:

```
[ROLLBACK:<agent>-v<n>] <ISO-date> <deliverable> approved at <file-path> (git: <commit-sha if available>)
```

To roll back to a previous approved state:
1. Find the rollback tag in `audit.log`
2. Restore the file from git history
3. Log the rollback: `[<date>] [CEO] ROLLBACK_EXECUTED: reverted to ROLLBACK:<agent>-v<n>`

---

## Escalation

If a gate is blocked (user requests changes multiple times without progress):
- After 3 revision cycles on the same deliverable
- Report to CEO: "Gate for [deliverable] has been revised <n> times without approval. Requesting CEO review and direction."
