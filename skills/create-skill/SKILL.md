---
name: create-skill
description: "INVOKE THIS SKILL when a reusable workflow step is needed that no existing skill covers. Inspects existing skills, drafts SKILL.md and plugin.json registration, gates for governance approval, then writes and verifies the new skill."
---

# Skill: create-skill

Scaffold a new plugin skill for the agency runtime. Inspects existing skills for conventions, drafts the `SKILL.md` and `plugin.json` registration entry, presents a governance gate for approval, then writes on approval and verifies the package is valid.

---

## When to Use

Invoke when:
- A new reusable workflow step is needed that no existing skill covers
- An example skill needs to be added to the library
- Plugin authoring conventions need to be documented or scaffolded

**Always check the existing skills library first.** If an existing skill can be extended or composed, prefer that over creating a new one.

---

## Alpha SDK / Runtime Primer

Understanding the runtime before authoring:

### Worker Surface
A skill is a Markdown prompt file that Claude reads and executes within the current agent session. It is **not** a separate process — it runs inline, with access to the same tools as the invoking agent (`Read`, `Write`, `Edit`, `Bash`, `Grep`, `Glob`, etc.). The skill file instructs Claude to perform a sequence of steps, exactly as if a human had typed the instructions.

### UI Surface
Output is rendered as Markdown in the terminal:
- Use `##` headers for major sections
- Use ` ```code blocks``` ` for file paths, commands, and structured output
- Use `✓` confirmation prefix for success messages
- Use `⚠️` for warnings, `✗` for failures
- Governance gate patterns (blocking prompts) are the primary UI interaction model — always use the `governance-gate` skill format when human approval is needed
- Never assume approval; always present a clearly labelled action prompt

### Route Conventions
```
skills/
└── <skill-slug>/
    └── SKILL.md          ← required; must be exactly this filename
```

- Slug: lowercase, hyphen-separated (e.g., `create-skill`, `hire-agent`, `budget-check`)
- Registered in `.claude-plugin/plugin.json` as `"skills/<skill-slug>"` (no trailing slash, no filename)
- Invoked by agents: reference the skill by name in instructions (e.g., "invoke the `create-skill` skill")
- Invoked by users: `/create-skill` (slash + slug, matching the directory name exactly)

### Scaffold Anatomy
Every skill file must have:
1. `# Skill: <name>` — H1 title, name must match the directory slug
2. One-line description immediately below the title (no heading, no blank line)
3. `---` separator
4. `## When to Use` — when to invoke it and when NOT to
5. `## Steps` — numbered steps (`### Step N — <title>`)
6. Each step: clear instructions, file paths, log formats, and confirmation output
7. Audit log entry format for each significant action
8. A final `✓` confirmation block at the end of the happy path

---

## Steps

### Step 1 — Inspect Existing Skills

Before drafting, read the library:

1. List all current skill directories:
   ```
   skills/
   ```

2. Read **2–3 existing skill files** most similar to what is being created. Extract:
   - Section structure and ordering
   - Step naming conventions
   - Audit log entry formats used
   - Confirmation output format
   - How they reference `~/.agency/` files

3. Read `.claude-plugin/plugin.json` to:
   - See the current skills array
   - Confirm the new slug is not already registered
   - Note the exact registration format (`"skills/<slug>"`)

4. Output an inspection summary:
   ```
   ## Skill Inspection Summary

   Existing skills reviewed:
     - <slug>: <one-line purpose>
     - <slug>: <one-line purpose>

   Slug availability: "<proposed-slug>" — not registered ✓
   Closest existing skill: <slug> (covers: <scope>)
   Gap: <what the proposed skill does that none of the above do>
   ```

---

### Step 2 — Define the Skill Spec

Before drafting, answer these questions (from the requester or by reasoning from the request):

| Field | Value |
|-------|-------|
| **Slug** | `<lowercase-hyphenated>` |
| **Title** | Human-readable name |
| **One-liner** | What it does in one sentence |
| **Invoked by** | Which agents / user command |
| **Worker surface** | What tools it needs (Read/Write/Edit/Bash/etc.) |
| **UI surface** | Does it block for user input? Does it show a governance gate? |
| **Inputs** | What context/files it reads |
| **Outputs** | What files it writes; what it logs |
| **Audit log actions** | Key `~/.agency/audit.log` entries it produces |
| **Governance gate needed?** | Yes / No — if yes, at which step |

---

### Step 3 — Draft the Skill File

Write the full `SKILL.md` following the scaffold anatomy:

```markdown
# Skill: <slug>

<One-line description — no heading, placed directly under the H1.>

---

## When to Use

<When to invoke. When NOT to invoke. Keep to 3–5 bullet points.>

---

## Steps

### Step 1 — <Action Title>

<Instructions. Reference files with full paths. Include exact log entry formats.>

### Step 2 — <Action Title>

...

### Step N — Confirm

Output:
\```
✓ <Skill name> complete.
  <Key output line>
  <Key output line>
\```
```

Also draft the `plugin.json` registration line:
```json
"skills/<slug>"
```

---

### Step 4 — Governance Gate

Before writing any file, present the full draft for approval via the `governance-gate` skill:

```markdown
---
## 🔍 Governance Gate: New Skill — `<slug>`

**Presented by:** skill-builder
**Files to be written:**
  - `skills/<slug>/SKILL.md`
  - `.claude-plugin/plugin.json` (updated — skills array)
**Date:** <ISO-date>
**Goal:** <goal-id or "plugin library expansion">

### What this skill does
<Purpose in 1–2 sentences.>

### Surface type
- **Worker:** <tools it uses>
- **UI:** <how it presents output; does it block for user approval?>
- **Invocation:** `/` + `<slug>` or agent reference

### Why a new skill is needed
<Gap vs. existing skills. Reference the comparison from Step 1.>

### plugin.json change
Before:
\```json
"skills": [ ...<current list>... ]
\```

After:
\```json
"skills": [ ...<current list>, "skills/<slug>" ]
\```

### The Draft Skill File

---

<Full SKILL.md content>

---

### Action Required

Please respond with one of:
- **APPROVED** — write both files now
- **REJECTED: <reason>** — discard draft
- **CHANGES: <requests>** — revise and resubmit

This gate will not proceed until you respond.
```

**WAIT for user response. Do not write any file until explicitly approved.**

---

### Step 5 — Write Files

On **APPROVED**:

1. Create the directory and write the skill file:
   ```
   skills/<slug>/SKILL.md
   ```

2. Update `.claude-plugin/plugin.json` — add `"skills/<slug>"` to the `skills` array. Preserve all existing entries; only append.

3. Append to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [skill-builder] SKILL_CREATED: skills/<slug>/SKILL.md — "<title>" approved by user
   [<ISO-date>] [skill-builder] PLUGIN_JSON_UPDATED: skills/<slug> registered in .claude-plugin/plugin.json
   [<ISO-date>] [skill-builder] ROLLBACK:skill-builder-v<n> — skill at skills/<slug>/SKILL.md
   ```

4. Update `~/.agency/tasks.md` task status to `done`.

On **REJECTED**:
```
[<ISO-date>] [skill-builder] SKILL_REJECTED: "<slug>" — <user reason>
```

On **CHANGES**:
```
[<ISO-date>] [skill-builder] SKILL_CHANGES_REQUESTED: "<slug>" — <change summary>
```
Revise and re-run Step 4.

---

### Step 6 — Verify the Package

After writing, run these verification checks:

**1. File existence**
```
skills/<slug>/SKILL.md  — exists ✓
```

**2. SKILL.md structure check**
Confirm presence of all required sections:
- `# Skill: <slug>` matches the directory name ✓
- One-line description present ✓
- `## When to Use` section ✓
- `## Steps` with at least one `### Step` ✓
- Final confirmation block ✓

**3. plugin.json validity**
- Read `.claude-plugin/plugin.json`
- Confirm it is valid JSON (no trailing commas, balanced braces)
- Confirm `"skills/<slug>"` appears exactly once in the array ✓
- Confirm no existing entries were removed ✓

**4. Slug uniqueness**
- Confirm the slug appears only once in the skills array ✓

Output the verification report:
```
✓ Skill package verified: <slug>
  File:          skills/<slug>/SKILL.md
  plugin.json:   registered at position <n> in skills array
  Sections:      all required sections present
  JSON validity: valid
  Invoke as:     /<slug>  |  "invoke the <slug> skill"
```

---

## Naming & Slug Conventions

| Pattern | Example |
|---------|---------|
| `<verb>-<noun>` | `create-skill`, `hire-agent` |
| `<noun>-<action>` | `budget-check`, `memory-sync` |
| `<workflow-name>` | `start-project`, `governance-gate` |

- All lowercase, hyphen-separated
- No underscores, no camelCase, no abbreviations
- Must match the directory name exactly

---

## Rules

- **Never write files without governance gate approval**
- **Never modify existing entries in plugin.json** — only append
- **Never create a skill that duplicates an existing one** — check first
- **Slug must match directory name exactly** — a mismatch silently breaks invocation
- **SKILL.md must be the exact filename** — no variations
- **Log every creation, rejection, and change** to `~/.agency/audit.log`
- **Maximum 3 revision cycles** before escalating to CEO
