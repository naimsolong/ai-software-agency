# Skill: testcase-generate

Generate structured test cases and an issues tracking table from a PRD, optional Figma design, and optional implementation diff. Designed for the QA Lead agent's Test Planning mode — reads the approved PRD, analyses user stories and acceptance criteria, and produces organised test cases organised by feature area.

---

## When to Use

Invoke when:
- The QA Lead is in Mode 1 (Test Planning) and has an approved PRD at `~/.agency/projects/<slug>/prd.md`
- The Developer has completed implementation and the QA Lead needs targeted test cases from the code diff
- A feature has a Figma design that needs UI-specific test coverage

**Do NOT invoke if:**
- No PRD exists yet — the Product Manager must write and get it approved first
- The test plan has already been generated for this feature and no requirements have changed
- The task is a minor bug fix without new user-facing behaviour (manual test cases are sufficient)

---

## Steps

### Step 1 — Gather Inputs

Ask the user for:

1. **Project slug** (required) — the project directory name under `~/.agency/projects/`
2. **Figma link** (optional) — node URL for UI reference, e.g. `https://figma.com/design/:fileKey/:fileName?node-id=1-2`
3. **Dev branch** (optional) — the implementation branch name, for generating targeted test cases from code changes

Wait for all answers before proceeding.

---

### Step 2 — Fetch PRD and Context

1. Read the approved PRD:
   ```
   ~/.agency/projects/<slug>/prd.md
   ```
   If the file does not exist, stop and report: "No PRD found at `~/.agency/projects/<slug>/prd.md`. The Product Manager must create and get it approved first."

2. If a Figma link was provided, fetch the design context using the Figma MCP tools. Extract: screen layout, component names, interactive elements, and any design annotations.

3. If a dev branch was provided:
   - `git fetch origin <branch>`
   - `git log origin/main..origin/<branch> --oneline` to see commits
   - `git diff origin/main...origin/<branch> --stat` to see changed files
   - `git diff origin/main...origin/<branch>` to read the implementation diff

---

### Step 3 — Read Existing Test Plan

1. Read `~/.agency/projects/<slug>/tests.md` if it exists.

2. **This skill appends — it never overwrites.** Check the existing content:
   - Note the existing test case IDs (TC-001, TC-002, etc.) — do not reuse IDs
   - Check if a feature area with the same name already exists — if so, warn the user and ask whether to skip or update
   - Identify the insertion point: after the `## Test Cases` section header, or if that section is missing, create it

---

### Step 4 — Generate Test Cases

Analyse the PRD's user stories and acceptance criteria. Each user story becomes at least one feature area.

Organise output using this exact format:

```
## Test Cases — [Feature Area Name]

| Test Case | Steps | Expected Result |
|---|---|---|
| [Descriptive name] | 1. [Action] 2. [Action] 3. [Action] | [What should happen] |
```

Repeat for each feature area.

**Generation guidelines:**
- Cover happy path, error cases, edge cases, and boundary conditions
- For UI features: include visual/layout checks referencing Figma if provided
- For API features: include request/response validation, auth checks, error responses
- For CRUD operations: test create, read, update, delete, plus duplicates and not-found scenarios
- For flows with sequences: test correct order, skipping steps, and going backwards
- If code diff is available: generate test cases that specifically target the changed code paths
- Be specific in steps — mention exact buttons, fields, and values
- Keep test case names concise but descriptive

---

### Step 5 — Generate Edge Cases and Business Rules

After the feature-area test cases, produce:

```
## Edge Cases

| Test Case | Expected Result |
|---|---|
| [Edge case description] | [Expected behaviour] |

## Key Business Rules

- [Business rule extracted from PRD]
```

Edge cases should cover: empty states, boundary values, concurrent actions, network interruptions, and unusual input.

---

### Step 6 — Generate Issues Tracking Table

Produce an empty issues tracking template for QA execution:

```
## Issues Tracking

| Test date: [DATE] |
|---|
| No | Issues | Feature | Picture/Video/Link | Verify fix (Dev) | Verify fix (QA) |
| 1 | | | | | |
```

---

### Step 7 — Governance Gate

Present the full generated output to the user. Include:

1. An overview block:
   ```
   **Feature:** [Feature name from PRD]
   **PRD Reference:** ~/.agency/projects/<slug>/prd.md
   **Figma:** [link or "N/A"]
   **Dev Branch:** [branch or "N/A"]
   ```

2. The complete generated test cases, edge cases, and business rules

3. The empty issues tracking table

Then display the gate prompt:

```
---
## Test Case Approval Gate

The content above will be appended to `~/.agency/projects/<slug>/tests.md`.

Please respond:
  APPROVED      — write the generated test cases to tests.md
  CHANGES       — describe what needs to change; I will revise and resubmit
  REJECTED      — discard; no file will be written
```

**Wait for explicit response.** Do not write any file until approved.

---

### Step 8 — Append to Test Plan

On **APPROVED**:

1. Read `~/.agency/projects/<slug>/tests.md` one more time to confirm the insertion point is still valid.

2. Append the generated content after the `## Test Cases` header. If no `## Test Cases` header exists, create it:
   ```
   ## Test Cases
   ```
   Then insert the generated content below it.

3. **Preserve all existing content.** Only add the new sections. Do not modify or remove any existing TC-001 style test cases, bug reports, or other content.

4. Append to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [qa-lead] TEST_CASES_GENERATED: <feature-name> — appended to ~/.agency/projects/<slug>/tests.md
   ```

---

### Step 9 — Confirm

Output:

```
✓ Test cases generated for [feature name].
  Feature areas: [N]
  Test cases:    [N]
  Edge cases:    [N]
  File:          ~/.agency/projects/<slug>/tests.md
```

If the user needs to push the issues tracking table to an external system (ClickUp, Linear, etc.), note that the table is available in `tests.md` for manual or tool-assisted export.

On **CHANGES**: revise the generated content per the user's requests and re-run Step 7.

---

## Memory Protocol

At session end: Run `memory-sync` skill

Track in memory:
- Test case generation patterns
- Edge case discoveries
- PRD patterns that affect test coverage
