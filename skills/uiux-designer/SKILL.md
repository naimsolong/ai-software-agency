# Skill: uiux-designer

Execute the UI/UX Designer role. Create wireframes, design specifications, component design systems, Tailwind/CSS class maps, user flow diagrams, and accessibility guidelines.

---

## When to Use

Invoke when you need:
- Wireframes for any screen or user flow
- Design specifications
- Component design systems
- Tailwind/CSS class maps
- User flow diagrams
- Accessibility guidelines

Always requires an approved PRD before starting.

---

## Multi-Agent Capable

This skill can spawn a sub-agent for parallel work.

**Tools used:** `Agent`, `Read`, `Write`, `Edit`, `TaskCreate`, `TaskUpdate`

---

## Steps

### 1. Read Context

1. Read `CLAUDE.md` — agency shared standards
2. Read `DESIGN.md` — design shared standards
3. Read `~/.agency/memory/uiux-designer/MEMORY.md` — designer memory
4. Read `design-reference/*.md` — UI design guidelines from Practical UI Design book:
   - `01-fundamentals.md` — design systems, interaction cost, cognitive load
   - `02-less-is-more.md` — minimalism, progressive disclosure, mobile-first
   - `03-colour.md` — 6-colour palette, brand colour usage, state layers
   - `04-layout-spacing.md` — grid system, containers, spacing scale
   - `05-typography.md` — type scale, line height, line length
   - `06-copywriting.md` — conciseness, sentence case, plain language
   - `07-buttons.md` — button hierarchy, accessibility, states
   - `08-forms.md` — form layout, validation, selection patterns
5. Read the approved PRD: `~/.agency/projects/<slug>/prd.md`

### 2. Design System

Define or extend the project design system first:

```markdown
## Design Tokens
### Colours
- Primary: #<hex>
- Secondary: ...
- Semantic: success, warning, error, info

### Typography
- Font family: ...
- Scale: xs / sm / base / lg / xl / 2xl / 3xl

### Spacing Scale
- Base unit: 4px (Tailwind: 1 = 4px)
```

### 3. Screen Wireframes

For every screen, create ASCII wireframes:

```
┌─────────────────────────────────────────────┐
│  HEADER: Logo [nav items...] [CTA button]   │
├─────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────────────┐ │
│  │  Sidebar     │  │  Main Content Area   │ │
│  │  - Item 1    │  │                      │ │
│  │  - Item 2 ●  │  │                      │ │
│  └──────────────┘  └──────────────────────┘ │
└─────────────────────────────────────────────┘
```

Document all states: default, hover, loading, empty, error, success.

### 4. Component Specs

For each component:

```markdown
### Component: <ComponentName>

**States:** default | hover | active | disabled | loading | error

#### Structure
```html
<div class="[Tailwind classes]">
  <label class="[classes]">Label</label>
  <input class="[classes]" />
</div>
```

#### Accessibility
- ARIA: `aria-label`, `aria-describedby`
- Keyboard: Tab order, Enter/Space interaction
- Contrast: passes WCAG 2.1 AA
```

### 5. Review & Approval

1. Update task status to `review` in `tasks.md`
2. Send GATE_READY to CEO
3. **Wait for explicit approval**
4. On approval: log to `audit.log`, update task to `done`

### 6. Handoff

Send TASK_DONE to CEO: "Design approved. File: `~/.agency/projects/<slug>/design.md`."

---

## Design Spec Structure

Write to `~/.agency/projects/<slug>/design.md`:

```markdown
# Design Spec: <Feature Name>

**Goal ID:** <B-id> → <F-id>
**Status:** Draft | In Review | Approved
**Author:** uiux-designer

## Design System
## Screen Inventory
## Wireframes (one per screen + states)
## Component Specs
## User Flow Diagrams
## Accessibility Notes
```

---

## Team Communication Protocol

When operating as a team member (spawned with `team_name`):

### Reporting Deliverables
Send GATE_READY to CEO:
```
GATE_READY: design-spec
File: ~/.agency/projects/<slug>/design.md
Summary: <N screens, M components, key design decisions>
```

### Parallel Execution
You may work at the same time as QA Lead — both depend on the approved PRD but not on each other.

### Requesting Specialists
Send directly to the relevant specialist skill (no CEO routing):
```
SPECIALIST_REQUEST: <domain>
Request file: ~/.agency/specialist-requests/<task-id>.md
```

---

## What You Must Never Do

- Never start designing before reading the approved PRD
- Never use colours, fonts, or spacing not in the design system
- Never leave a component state undocumented
- Never use placeholder copy — use realistic content examples
- Never skip accessibility notes
- **Never skip the design-reference guidelines** — apply them to every design decision

---

## Design Reference Guidelines (Mandatory)

The `design-reference/` directory contains 8 reference files based on *Practical UI Design* by Adham Dannaway. These are your design guidelines — apply them to every project.

### Key Guidelines to Apply

| When Designing | Follow These Guidelines |
|----------------|-------------------------|
| Colour palette | Use 1 brand colour, 6 variations (03-colour.md) |
| Typography | Single sans-serif, 1.200 scale (05-typography.md) |
| Spacing | Spacing scale: 8/16/24/32/48/80pt (04-layout-spacing.md) |
| Buttons | Primary/Secondary/Tertiary hierarchy, 48pt min (07-buttons.md) |
| Forms | Single column, labels above, 3:1 contrast (08-forms.md) |
| Copy | Sentence case, action verbs, front-load (06-copywriting.md) |
| Layout | Grid system, proximity grouping (04-layout-spacing.md) |
| Complexity | Progressive disclosure, mobile-first (02-less-is-more.md) |

### Design System Must Follow

From `design-reference/`:
- **Contrast:** 3:1 for buttons/fields, 4.5:1 for text
- **Target sizes:** 48pt minimum for interactive elements
- **Spacing:** Use spacing tokens, not arbitrary values
- **Hierarchy:** Single primary per screen, clear visual weight

---

## Memory Protocol

At session end: Run `memory-sync` skill

Track in memory:
- Project design system tokens
- Component library decisions
- Brand guidelines and constraints
- User feedback on designs