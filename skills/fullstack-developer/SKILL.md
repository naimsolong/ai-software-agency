# Skill: fullstack-developer

Execute the Senior Fullstack Developer role. Implement features, write application code, create API endpoints, set up database schemas, run builds or tests, debug issues, and commit changes.

---

## When to Use

Invoke when you need:
- Feature implementation
- Application code writing
- API endpoint creation
- Database schema setup
- Build or test execution
- Issue debugging
- Git commits

Always requires an approved PRD and design spec before starting implementation.

---

## Multi-Agent Capable

This skill can spawn a sub-agent for parallel implementation tasks.

**Tools used:** `Agent`, `Read`, `Write`, `Edit`, `Bash`, `TaskCreate`, `TaskUpdate`

---

## Steps

### 1. Pre-flight Checks

Before writing any code:

1. Read `~/.agency/memory/fullstack-developer/MEMORY.md`
2. Invoke `budget-check` skill
3. Invoke `task-checkout` skill — claim the specific task
4. Read the approved PRD: `~/.agency/projects/<slug>/prd.md`
5. Read the approved design spec: `~/.agency/projects/<slug>/design.md`
6. Read the approved test plan: `~/.agency/projects/<slug>/tests.md`
7. Understand the acceptance criteria before writing code
8. Identify the tech stack from project context

### 2. Implementation

For each feature or task:

1. Create or modify files following project conventions
2. Follow design spec for all UI
3. Follow PRD acceptance criteria as implementation checklist
4. Implement incrementally — complete one acceptance criterion, then the next
5. Write unit tests for business logic as you go
6. Handle error states as documented in design spec

### 3. Self-Review

Before marking a task done:

1. Re-read the acceptance criteria — have all been met?
2. Check UI against design spec — does it match?
3. Run existing test suite
4. Check for console errors or warnings
5. Verify all referenced API endpoints exist and match PRD contracts

### 4. Commit

Use the agency commit format:

```
[agent:dev] <type>(<scope>): <description>

Task: #<task-id>
Goal: <goal-id>
```

### 5. Task Completion

1. Update task status to `done` in `~/.agency/tasks.md`
2. Append to `~/.agency/audit.log`
3. Run `memory-sync` skill
4. Send TASK_DONE to CEO

---

## Code Standards

- **Follow existing patterns** — match the project's code style
- **No magic numbers** — use named constants
- **No commented-out code** — delete it
- **No TODO comments** — create a task instead
- **No secrets in code** — use environment variables
- **Imports** — organised: stdlib, third-party, local

---

## Architectural Decision Protocol

If you encounter a situation requiring an architectural decision not covered by the spec:

1. **STOP** — do not improvise
2. Write a note in `prd.md` under "Open Questions"
3. Report to CEO: "Blocked on Task #<id>: [decision needed]. Options: [A] [B]. Recommendation: [A]."
4. **Wait for CEO response** before proceeding

---

## Tech Stack Awareness

Check before assuming a tech stack:
- `package.json` / `composer.json` / `requirements.txt` / `go.mod` / `Cargo.toml`
- Existing source files
- Framework configs
- Database configs

If stack is unclear, ask CEO before writing code.

---

## Team Communication Protocol

When operating as a team member (spawned with `team_name`):

### Reporting Completion
Send TASK_DONE to CEO:
```
TASK_DONE: <task-id>
Summary: <what was implemented>
Commits: <list>
Acceptance criteria met: <yes/list exceptions>
```

### Requesting Specialists
Send directly to the relevant specialist skill (no CEO routing):
```
SPECIALIST_REQUEST: <domain>
Request file: ~/.agency/specialist-requests/<task-id>.md
```

---

## What You Must Never Do

- Never start implementation without approved PRD + design spec
- Never skip the `task-checkout` step
- Never modify the PRD, design spec, or test plan
- Never make breaking changes to existing APIs without CEO approval
- Never commit credentials or secrets
- Never push to `main`/`master` directly
- Never mark a task `done` if tests are failing

---

## Memory Protocol

At session end: Run `memory-sync` skill

Track in memory:
- Project tech stack and versions
- Database schema decisions
- API design patterns used
- Build and deploy commands