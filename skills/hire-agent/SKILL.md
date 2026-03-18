# Skill: hire-agent

Draft a new specialist agent, inspect and compare against the existing library, then submit a governance-gated hire request before writing anything to disk.

---

## When to Use

Invoke when:
- No existing agent in `agents/` covers a required domain or task type
- The CEO identifies a capability gap during project planning
- The user explicitly requests a new agent be created

**Always check the existing library first.** Never create a new agent for a task that an existing specialist already handles. Use Glob on `agents/` before proceeding.

---

## Steps

### Step 1 — Inspect the Existing Library

Before drafting anything, orient yourself in the library.

1. List all agents in the target division:
   ```
   agents/<division>/
   ```
   If unsure which division, list the top-level `agents/` directory and pick the closest match.

2. Read **2–3 similar or adjacent agents** in that division. Extract:
   - Frontmatter fields in use (`name`, `description`, `color`, `emoji`, `vibe`, `tools`, `model`, `maxTurns`)
   - Document structure (sections present and their order)
   - Naming convention: `<division>-<kebab-role>.md`
   - Tone and depth of the persona

3. Check `~/.agency/tasks.md` for any existing active hire task for the same role — stop and report if a duplicate is found.

4. Output a comparison summary before drafting:

```
## Inspection Summary

Division: agents/<division>/
Existing similar agents reviewed:
  - <file>: <one-line summary>
  - <file>: <one-line summary>

Gap identified: <what none of the existing agents can do>
Proposed new agent: <working name>
Distinct from existing agents because: <specific reason>
```

---

### Step 2 — Draft the Agent Config

Using the inspection findings as reference, draft the new agent `.md` file.

**Frontmatter schema (specialist agents):**

```yaml
---
name: <Human-readable role name>
description: <One sentence: who this agent is and when to invoke it. Be specific enough that the CEO can match task to agent reliably.>
color: <css color name — pick one not already heavily used in this division>
emoji: <single emoji that represents the domain>
vibe: <One punchy sentence — the agent's personality and working style in plain English>
tools: Read, Write, Edit, Grep, Glob[, + others justified by role]
---
```

**Tool grant guidelines:**
| Tool | When to grant |
|------|--------------|
| `Read, Grep, Glob` | All specialists — always |
| `Write, Edit` | Any agent that produces deliverable files |
| `WebFetch, WebSearch` | Research-heavy roles (marketing, academic, product) |
| `Bash` | Only with CEO approval — flag in hire request |
| `Agent` | Never for specialists — orchestration is CEO/core team only |

**Document body — required sections (in order):**

1. `# <Name> Agent` — H1 title matching the `name` frontmatter
2. `## Identity & Memory` — Who this agent is, their personality, what they carry forward across tasks
3. `## Core Mission` — 3–5 focused mission areas. No fluff; each must be actionable.
4. `## Critical Rules` — Non-negotiable operating constraints. Things this agent must never skip.
5. `## Deliverable Template` — What a finished output from this agent looks like. Include a Markdown template or example.
6. `## Workflow` — Step-by-step working process (numbered, 3–6 steps)
7. `## Communication Style` — How this agent writes and speaks. Keep to 3–4 bullet points.

**Length target:** 100–200 lines. Specialist agents are stateless and focused — avoid padding.

---

### Step 3 — Hire Request (Governance Gate)

Before writing any file, invoke the `governance-gate` skill with the following structure:

```markdown
---
## 🔍 Governance Gate: Agent Hire Request

**Presented by:** agent-builder
**Division:** agents/<division>/
**Proposed file:** agents/<division>/<division>-<slug>.md
**Date:** <ISO-date>
**Goal:** <goal-id if this hire is tied to a project goal, otherwise "library expansion">

### What this is
A new specialist agent proposed for the library.

### Why this agent is needed
<The specific gap — what task or domain no existing agent handles. Reference the agents reviewed in Step 1.>

### Comparison with existing agents
| Agent | Covers | Does NOT cover |
|-------|--------|----------------|
| <existing-1> | <its scope> | <the gap> |
| <existing-2> | <its scope> | <the gap> |
| **Proposed** | <full scope of new agent> | — |

### What you are approving
- **Agent name:** <name>
- **Division:** agents/<division>/
- **Tools granted:** <list>
- **File to be written:** `agents/<division>/<division>-<slug>.md`

### What happens if you approve
The agent file will be written immediately. The new agent becomes available for delegation by any core agent.

### What changes if you reject
The draft is discarded. No file is written. A revised proposal can be submitted if requirements change.

### The Draft Agent

---

<Full draft agent .md content — frontmatter + all sections>

---

### Action Required

Please respond with one of:
- **APPROVED** — write the agent file now
- **REJECTED: <reason>** — discard, do not write
- **CHANGES: <specific requests>** — revise and resubmit gate

This gate will not proceed until you respond.
```

**WAIT for user response. Do not write any file until explicitly approved.**

---

### Step 4 — Write the Agent File

On **APPROVED**:

1. Write the agent file to the exact path shown in the hire request:
   ```
   agents/<division>/<division>-<slug>.md
   ```

2. Append to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [agent-builder] AGENT_HIRED: agents/<division>/<division>-<slug>.md — "<name>" approved by user
   [<ISO-date>] [agent-builder] ROLLBACK:agent-builder-v<n> — new agent written at agents/<division>/<division>-<slug>.md
   ```

3. Update task status to `done` in `~/.agency/tasks.md`.

On **REJECTED:**
1. Log to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [agent-builder] AGENT_HIRE_REJECTED: "<name>" — <user reason>
   ```
2. Do not write any file. Report outcome to CEO.

On **CHANGES:**
1. Log to `~/.agency/audit.log`:
   ```
   [<ISO-date>] [agent-builder] AGENT_HIRE_CHANGES_REQUESTED: "<name>" — <change summary>
   ```
2. Revise the draft and re-run the governance gate from Step 3.

---

### Step 5 — Confirm Hire

Output a short confirmation:

```
✓ Agent hired: <name>
  File:      agents/<division>/<division>-<slug>.md
  Tools:     <comma-separated list>
  Division:  <division>
  Invoke as: agents/<division>/<division>-<slug>
```

---

## Division & Naming Reference

| Division | Prefix | Slug example |
|----------|--------|-------------|
| `engineering/` | `engineering-` | `engineering-rust-engineer` |
| `marketing/` | `marketing-` | `marketing-podcast-editor` |
| `design/` | `design-` | `design-motion-designer` |
| `testing/` | `testing-` | `testing-load-tester` |
| `sales/` | `sales-` | `sales-enterprise-closer` |
| `product/` | `product-` | `product-pricing-strategist` |
| `project-management/` | `project-management-` | `project-management-risk-tracker` |
| `paid-media/` | `paid-media-` | `paid-media-yt-ads-buyer` |
| `support/` | `support-` | `support-knowledge-base-writer` |
| `spatial-computing/` | `spatial-computing-` | `spatial-computing-ar-designer` |
| `specialized/` | `specialized-` | `specialized-quantum-engineer` |
| `game-development/` | `game-development-` | `game-development-vfx-artist` |
| `academic/` | `academic-` | `academic-economist` |

File slug rules: lowercase, hyphen-separated, no spaces, no special characters.

---

## Rules

- **Never write a file without governance gate approval** — not even a draft
- **Never create a duplicate** — compare against existing agents before proposing
- **Never grant `Bash` or `Agent` tools** to a specialist without explicit CEO authorisation noted in the hire request
- **Agent files are plain Markdown only** — no scripts, no code execution blocks intended to run
- **Log every hire, rejection, and change request** to `~/.agency/audit.log`
- **Maximum 3 revision cycles** — if the gate is rejected 3 times, escalate to CEO for direction
