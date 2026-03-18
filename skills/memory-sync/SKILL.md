# Skill: memory-sync

Update the calling agent's persistent memory file with session learnings, key decisions, and project context. Ensures continuity across conversations.

---

## When to Use

Invoke at the **end of every session** or after completing a major task. This is how agents "remember" context across conversations — without this, every session starts from zero.

---

## Memory File Location

Each agent's memory lives at:
```
~/.agency/memory/<agent-name>/MEMORY.md
```

Examples:
- `~/.agency/memory/ceo/MEMORY.md`
- `~/.agency/memory/product-manager/MEMORY.md`
- `~/.agency/memory/uiux-designer/MEMORY.md`
- `~/.agency/memory/fullstack-developer/MEMORY.md`
- `~/.agency/memory/qa-lead/MEMORY.md`

---

## Memory File Structure

Maintain these sections in order:

```markdown
# <Agent Name> Memory — Project: <project-slug>

**Last Updated:** <ISO-date>
**Sessions:** <count>

---

## 1. Identity Core

<Agent's role, personality, and communication style — stable across sessions>

## 2. Project Context

**Project:** <slug>
**Business Goal:** <B-id> — <description>
**Current Stage:** <requirements | design | development | qa | done>
**Tech Stack:** <list technologies>
**Key Files:**
- PRD: ~/.agency/projects/<slug>/prd.md
- Design: ~/.agency/projects/<slug>/design.md
- Tests: ~/.agency/projects/<slug>/tests.md

## 3. User Preferences

<Communication style preferences, vocabulary, how they give feedback, what they care about most>

## 4. Key Decisions (last 20)

<!-- Format: [date] Decision: <what> | Rationale: <why> | Impact: <effect> -->

## 5. Learned Patterns

<Recurring patterns, gotchas, shortcuts, what works well for this project/user>

## 6. Open Items

<Unresolved questions, items to follow up, known blockers>
```

---

## Steps

### 1. Read Current Memory

Read `.agency/memory/<your-agent-name>/MEMORY.md`.

If it doesn't exist, create it from the template above.

### 2. Identify Changes to Record

From this session, collect:

- **New decisions made** (with rationale)
- **New project context** (stack info, file locations, etc.)
- **User preference signals** (how they communicated, what they approved/rejected and why)
- **Patterns discovered** (recurring requirements, code patterns, QA patterns)
- **Open items** (questions raised but not yet answered)
- **Update the current stage** of the project

### 3. Update Memory File

Apply targeted updates:
- Add new decisions to Section 4 (Decision Log) — keep last 20, archive older ones
- Update Section 2 (Project Context) with any new information
- Update Section 3 (User Preferences) with new signals
- Append to Section 5 (Learned Patterns) if something new was discovered
- Resolve or add to Section 6 (Open Items)
- Update `Last Updated` timestamp and increment `Sessions` counter

### 4. Archive if Too Large

If `MEMORY.md` exceeds 500 lines:
1. Move entries older than 30 days from Decision Log to `MEMORY-archive.md`
2. Keep the most recent 20 decisions in the active file
3. Note at top of MEMORY.md: `See MEMORY-archive.md for full history`

### 5. Log to Audit

Append to `~/.agency/audit.log`:
```
[<ISO-date>] [<agent-name>] MEMORY_SYNC: Memory updated — <n> new decisions, <n> context updates
```

### 6. Confirm

Output:
```
✓ Memory synced for <agent-name>
  File: ~/.agency/memory/<agent>/MEMORY.md
  Decisions added: <n>
  Session count: <n>
  Last updated: <ISO-date>
```

---

## Reading Memory at Session Start

At the start of every session, read your `MEMORY.md` and:

1. Load the **Project Context** — know where the project is
2. Load **User Preferences** — adapt communication style
3. Check **Open Items** — are any pending questions now answered?
4. Review **Learned Patterns** — apply them immediately

Do not start any work without this context load.
