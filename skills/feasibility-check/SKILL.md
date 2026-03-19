# Skill: feasibility-check

Structured, fixed-path feasibility analysis before any department work begins. Asks 7 fixed discovery questions, applies a 4-criterion evaluation rubric, produces a structured report via a prescribed verdict decision tree, and gates before PM delegation. The skill defines every question, criterion, and output format — the model fills in content but never decides the path.

---

## When to Use

Invoke when:
- The CEO has received a project brief and scope approval, and is about to delegate to the Product Manager
- A new feature request arrives mid-project that has not yet been assessed
- A previously rejected request is resubmitted with a revised scope

**Do NOT invoke if:**
- The request has already passed a feasibility gate in this session (check `~/.agency/projects/<slug>/feasibility.md`)
- The task is a bug fix or minor copy change (non-feature work is exempt)
- No project goal or feature description has been provided yet — collect that first via `start-project`

---

## Steps

### Step 1 — Ask 7 Fixed Discovery Questions

Present **exactly** the following 7 questions as a numbered list. Do not add, remove, or reorder them. Wait for answers to all 7 before proceeding to Step 2.

```
## Feasibility Discovery — 7 Questions

Please answer all 7 questions before I continue. You can answer briefly.

1. What problem does this feature solve? (one sentence)
2. Who are the primary users affected, and how do they encounter this problem today?
3. What does success look like? (measurable outcome — not a feature list)
4. What existing functionality is adjacent to or affected by this?
5. Are there known technical blockers, hard dependencies, or platform constraints?
6. What is the smallest version of this that would still be valuable?
7. Are there hard constraints — deadline, budget ceiling, platform limit, or regulatory requirement?
```

Record all answers verbatim. Do not interpret or summarise at this stage.

---

### Step 2 — Apply Fixed Evaluation Rubric

Evaluate the answers using exactly these four criteria. Scores and classifications are prescribed — do not invent new categories.

#### Criterion A — Clarity Score (0–3)

| Score | Meaning |
|-------|---------|
| 3 | Request is fully understood — problem, users, success criteria all clear |
| 2 | Minor gaps — one answer is vague but does not block understanding |
| 1 | Significant gaps — two or more answers are unclear or contradictory |
| 0 | Cannot understand the request — fundamental intent is missing |

#### Criterion B — Technical Complexity

| Level | Meaning |
|-------|---------|
| Low | UI-only change; no new data model or API endpoint |
| Medium | New component or screen; extends an existing data model or API |
| High | New data model, new API, or cross-cutting concern (auth, permissions, logging) |
| Critical | Architecture change, database migration, or new external dependency |

#### Criterion C — Risk Assessment

Rate each category as **Low**, **Medium**, or **High**:

| Risk Category | Assess |
|---------------|--------|
| Data risk | Could this corrupt, lose, or expose data? |
| UX regression risk | Could this break existing user flows? |
| Integration risk | Does this touch external APIs or third-party systems? |
| Scope creep risk | Is the boundary of this feature clearly defined? |

#### Criterion D — Information Completeness

Mark each item as **✓** (present) or **✗** (missing):

| Item | Status |
|------|--------|
| Business goal is clear | |
| Success criteria are measurable | |
| Affected users are identified | |
| Technical constraints are known | |
| Out-of-scope is defined | |

---

### Step 3 — Apply Fixed Verdict Decision Tree

Apply the following rules **in order**. Use the first rule that matches. Do not use model judgment to override the tree.

```
IF Clarity Score = 0
  → Verdict: NOT FEASIBLE
  → Reason: "Request is too unclear to assess. Return to the user for clarification."

ELSE IF Clarity Score = 1 AND any Risk category = High
  → Verdict: NOT FEASIBLE
  → Reason: "Significant information gaps combined with high risk make this unsafe to proceed."

ELSE IF Technical Complexity = Critical AND 2 or more Completeness items = ✗
  → Verdict: FEASIBLE WITH CONDITIONS
  → Reason: "Critical complexity with incomplete information — conditions must be met before proceeding."

ELSE IF any Risk category = High
  → Verdict: FEASIBLE WITH CONDITIONS
  → Reason: "High risk in one or more categories — mitigation conditions required."

ELSE
  → Verdict: FEASIBLE
  → Reason: "Request is clear, complexity is manageable, and risks are acceptable."
```

---

### Step 4 — Produce Structured Feasibility Report

Output the report using **exactly** this template. Do not omit sections. Save the report to `~/.agency/projects/<slug>/feasibility.md` after the governance gate passes.

```
## Feasibility Report — <Feature Name>

**Date:** <ISO date>
**Project:** <project slug>
**Assessed by:** CEO (feasibility-check skill)

---

### Verdict: <FEASIBLE | FEASIBLE WITH CONDITIONS | NOT FEASIBLE>

### Discovery Summary
<2–3 sentences summarising what was learned from the 7 questions. Neutral — no recommendation yet.>

### Evaluation

**Clarity Score:** <n>/3
**Technical Complexity:** <Low | Medium | High | Critical>

**Risk Assessment:**

| Risk Category | Level |
|---------------|-------|
| Data risk | <Low | Medium | High> |
| UX regression risk | <Low | Medium | High> |
| Integration risk | <Low | Medium | High> |
| Scope creep risk | <Low | Medium | High> |

**Information Completeness:**

| Item | Status |
|------|--------|
| Business goal is clear | <✓ | ✗> |
| Success criteria are measurable | <✓ | ✗> |
| Affected users are identified | <✓ | ✗> |
| Technical constraints are known | <✓ | ✗> |
| Out-of-scope is defined | <✓ | ✗> |

### Conditions
<List specific conditions that must be met before proceeding. Only present if verdict is FEASIBLE WITH CONDITIONS. If FEASIBLE, write "None." If NOT FEASIBLE, write "N/A — request must be clarified and resubmitted.">

### CEO Recommendation
<One paragraph. State the verdict plainly, explain the single most important factor, and tell the user what the next step is.>
```

---

### Step 5 — Governance Gate

Present the full feasibility report to the user, then display the gate prompt:

```
---
## Feasibility Gate

Verdict: <FEASIBLE | FEASIBLE WITH CONDITIONS | NOT FEASIBLE>

Please respond:
  PROCEED        — approve this assessment; CEO will delegate to Product Manager
  REVISE SCOPE   — revise the feature scope; I will re-run the rubric with your new answers
  REJECT         — cancel this feature; no department work will begin
```

**Rules:**
- Wait for explicit response. Do not proceed without it.
- On **PROCEED**: continue to Step 6.
- On **REVISE SCOPE**: return to Step 2 with the original Step 1 answers carried forward. Allow the user to amend any answer. Maximum **3 revision cycles**. If the 3rd revision still does not reach FEASIBLE or FEASIBLE WITH CONDITIONS, output:
  ```
  ⚠️ Maximum revision cycles reached (3). This feature cannot be approved in its current form.
  Recommend: Break the request into smaller, better-defined features and restart.
  ```
  Then stop — do not delegate to PM.
- On **REJECT**: continue to Step 6 with `REJECTED` status.

---

### Step 6 — Log, Save, and Signal

1. Save the feasibility report to `~/.agency/projects/<slug>/feasibility.md`.

2. Append to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [ceo] [feasibility-check] FEASIBILITY_GATE_<PASSED|REJECTED>: <feature-name> — Verdict: <verdict>
   [ROLLBACK:feasibility-<slug>-<ISO-date>] Gate decision recorded. To revert: delete feasibility.md and re-run skill.
   ```

3. If gate returned **PROCEED**:
   ```
   ✓ Feasibility gate passed.
     Feature: <feature name>
     Verdict: <verdict>
     Report:  ~/.agency/projects/<slug>/feasibility.md

   Proceeding to Product Manager delegation.
   ```
   Signal CEO to continue to PM delegation.

4. If gate returned **REJECT**:
   ```
   ✗ Feature rejected at feasibility gate.
     Feature: <feature name>
     No department work will begin.
     Log:     ~/.agency/audit.log
   ```
   Stop. Do not delegate to PM.