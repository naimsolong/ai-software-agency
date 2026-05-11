# Skill: pr-review

Review a GitHub pull request with a structured two-pass analysis: Pass 1 examines code correctness and quality, Pass 2 assesses system impact and risk. Uses generalised stack checklists that adapt to the detected project type. Supports full reviews and follow-up re-reviews of revised PRs.

---

## When to Use

Invoke when:
- A developer or the Code Reviewer agent needs to review an open PR
- The user asks for a structured review of a specific PR number
- A PR has been updated and needs a follow-up review of the new changes

**Do NOT invoke if:**
- The PR has already been reviewed and no new commits have been pushed
- There is no open PR to review (run `gh pr list` first)
- The task is a simple one-line fix that doesn't warrant a full two-pass review

---

## Steps

### Step 1 — Identify the PR

- If a PR number is provided in the context (e.g. the user said "review PR #42"), use it directly.
- Otherwise, run `gh pr list --limit 5 --state open` and display the results. Ask: "Which PR number would you like to review?"

---

### Step 2 — Detect Review Mode

Check the user's intent:

- **Follow-up review:** If the user mentions reviewing new changes, fixes, updates, or latest commits (e.g. "review the fixes", "check the new code", "review Naim's updates"). This is a follow-up.
- **Full review:** Otherwise, treat as a first-time review.

---

### Step 3 — Fetch Project Context

If the project slug is known (from conversation context or `CLAUDE.md`):
- Read `~/.agency/projects/<slug>/prd.md` for feature context
- Read `~/.agency/projects/<slug>/tests.md` for test plan context

If no project slug is known, note "No project context available" and proceed. The review will be based purely on the diff.

---

### Step 4 — Fetch PR Details

Run these commands:

```
gh pr view <number> --json title,author,baseRefName,headRefName,labels,body
gh pr diff <number>
```

**Critical rule:** Only use `gh pr diff <number>` for the review diff. Never use local `git diff` against the base branch — the local branch may contain uncommitted or unpushed changes that are not part of the PR.

**For follow-up reviews, also:**
- Fetch existing PR comments: `gh pr view <number> --comments --json comments` to find previous review comments
- List commits: `gh api repos/{owner}/{repo}/pulls/<number>/commits` to identify new commits since the last review
- Get the diff for new commits using `gh api repos/{owner}/{repo}/commits/<sha>` to focus the review

---

### Step 5 — Detect PR Type

From the changed file paths in the diff, classify the PR:

| Type | File patterns (examples) |
|------|-------------------------|
| **Backend** | `app/`, `database/`, `routes/`, `config/`, `*.php`, `*.py`, `*.go`, `*.rb`, `*.java`, `src/main/` |
| **Frontend** | `*.vue`, `*.tsx`, `*.jsx`, `*.ts`, `*.js`, `src/`, `*.scss`, `*.css`, `components/` |
| **Full-stack** | Significant changes in both Backend and Frontend patterns |
| **Infrastructure** | `Dockerfile`, `*.yml`, `*.yaml`, `terraform/`, `.github/`, `Makefile` |
| **General** | Mixed or unclear — apply the General checklist only |

This determines which checklist sections are relevant in Pass 1.

---

### Step 6 — Pass 1: Code & Correctness

Review the diff against the applicable checklists below. **Only mention items that are violated** — do not print the full checklist.

#### Backend Checklist

- Business logic separated from controllers/route handlers
- Input validated at the boundary (controllers, form requests, middleware)
- Error responses consistent and safe — no internal stack traces or sensitive data leaked
- Database operations use parameterized queries or ORM bindings — no string interpolation
- Sensitive data (passwords, tokens, PII) not exposed in responses or logs
- Configuration externalised — no hardcoded environment-specific values
- Idempotency considered for state-changing operations (POST, PUT, DELETE)

#### Frontend Checklist

- Shared state managed through stores or context, not component-local state for cross-component data
- API/service layer separated from UI components — no inline fetch/axios calls in render logic
- All data shapes typed or interfaced — no `any` types for API responses or form data
- Reusable logic extracted to utilities, hooks, or composables — not duplicated across components
- Form submissions validate before calling the API — client-side validation runs first
- No hardcoded API endpoints or URLs — use service modules or environment config
- State derived rather than redundantly stored — compute values instead of syncing duplicate state

#### General Checklist (applies to all stacks)

- Error handling covers: network failures, empty states, invalid data, and unexpected server responses
- Async operations handle loading, error, and success states — no unhandled promises
- No secrets committed — no API keys, tokens, passwords, or private keys in the diff
- Logging is present for debugging without leaking sensitive data
- Patterns consistent with the surrounding codebase — don't introduce a new pattern in isolation
- Adequate test coverage for new or changed code paths

**Also flag:**
- Logic errors, edge cases not handled, missing null/undefined checks
- Race conditions or concurrency issues in async code
- Resource leaks (unclosed connections, missing cleanup in effects/listeners)

---

### Step 7 — Pass 2: Impact & Risk

Re-read the diff with a fresh lens, focused entirely on what this PR could break for existing users, data, or client applications:

- **API contract changes:** Are any response fields renamed, removed, or restructured? Are request parameters changed? Will old client app versions break?
- **Data & migration safety:** Are new required columns added without defaults or backfill? Could a migration fail or lock tables on large datasets? Does the code assume DB changes not included in this PR?
- **Behavioural changes:** Does this PR change how an existing feature works for current users? Side effects on other features sharing the same models, routes, or stores?
- **Deployment ordering:** Does this require backend to deploy before frontend (or vice versa)? Will there be a window where one stack is deployed and the other isn't, causing errors?
- **Shared constants/enums:** Are shared enums, config values, or constants changed in ways that other parts of the system consume?

For each issue found, indicate severity:
- 🔴 **Critical** — will break existing users, data, or client apps
- 🟡 **Warning** — potential risk, needs verification or a migration plan

If no impact concerns for a section, omit that section entirely.

---

### Step 8 — Produce Review Blocks

**For full reviews:**

**Comment 1 — Code & Correctness:**

```
### Code Review: [PR Title] (#[number])

#### Summary
[1-3 sentences describing what this PR does. Reference PRD context if available.]

#### Code Quality
[Only convention violations found. If none: "Code follows project conventions."]

#### Potential Issues
[Logic errors, edge cases, missing null checks, unhandled errors found. If none: "No obvious issues found."]

#### Suggestions
[Optional non-blocking improvements — naming, refactoring, code clarity.]

#### Verdict
[Approved | Needs minor changes | Needs major changes]
```

**Comment 2 — Impact & Risk:**

```
### Impact Review: [PR Title] (#[number])

#### API Contract Changes
[Or omit if none]

#### Data & Migration Safety
[Or omit if none]

#### Behavioural Changes
[Or omit if none]

#### Deployment Considerations
[Or omit if none]
```

If no impact concerns at all: "**No impact on existing users, data, or client apps.**"

**For follow-up reviews, use these formats instead:**

**Comment 1 — Code Follow-up:**

```
### Code Review: [PR Title] — Follow-up (#[number])

#### Summary
[1-2 sentences describing what changed in the new commits]

#### What Was Fixed
| Original Issue | Status |
|---|---|
| [Description of issue] | **Fixed** — [how] / **Not addressed** |

#### Remaining Issues
[Issues from original review NOT addressed, plus NEW issues from fix commits. If none: "All issues addressed."]

#### Verdict
[Approved | Needs minor changes | Needs major changes]
```

**Comment 2 — Impact Follow-up:**

```
### Impact Review: [PR Title] — Follow-up (#[number])

[Do the fix commits introduce any new impact concerns? If none: "No new impact concerns."]
```

---

### Step 9 — Governance Gate

Display both review blocks to the user, then present:

```
---
## PR Review Gate

Two comments prepared for PR #[number].

Please respond:
  POST          — post both comments to the PR now
  REVISE        — describe what to change; I will revise the review
  VIEW ONLY     — display only; do not post anything
```

**Wait for explicit response.** Do not post any comment until the user approves.

---

### Step 10 — Post on Approval

On **POST**:

1. Post Comment 1:
   ```
   gh pr comment <number> --body "<Comment 1 content>"
   ```

2. Post Comment 2:
   ```
   gh pr comment <number> --body "<Comment 2 content>"
   ```

3. Append to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [code-reviewer] PR_REVIEWED: #[number] "<PR title>" — Verdict: <verdict>
   ```

On **REVISE**: adjust the review per the user's requests and re-run Step 9.

On **VIEW ONLY**: report that no comments were posted and stop.

---

### Step 11 — Confirm

Output:

```
✓ PR review complete.
  PR:       #[number] — [title]
  Verdict:  [Approved | Needs minor changes | Needs major changes]
  Comments: [Posted | Not posted]
```
