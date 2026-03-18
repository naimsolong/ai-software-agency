# PRD: [Feature Name]

**Goal ID:** [B-id] → [P-id] → [F-id]
**Status:** Draft
**Author:** product-manager
**Created:** [ISO-date]
**Last Updated:** [ISO-date]
**Project Slug:** [project-slug]

---

## Problem Statement

> *What problem are we solving? Who has this problem? What is the cost of not solving it?*

[Describe the problem in 2–3 paragraphs. Be specific about who experiences it and what the impact is.]

---

## Goals

> *What does success look like for this feature? How do we measure it?*

| Goal | Success Metric | Target |
|------|---------------|--------|
| [Goal 1] | [How measured] | [Target value] |
| [Goal 2] | [How measured] | [Target value] |

---

## Non-Goals

> *What are we explicitly NOT building in this version? This is as important as what we are building.*

- We will NOT: [explicit exclusion 1]
- We will NOT: [explicit exclusion 2]
- Future consideration: [thing that belongs in v2]

---

## Users & Personas

### Primary User: [Persona Name]

- **Role:** [job title / type of user]
- **Context:** [when/how they use this]
- **Goals:** [what they are trying to achieve]
- **Pain points:** [what currently frustrates them]
- **Technical proficiency:** Low / Medium / High

### Secondary User: [Persona Name] *(if applicable)*

[Same structure as above]

---

## User Stories

> *Each story must have testable acceptance criteria. Format: As a [user], I want [action], so that [outcome].*

### Story US-001: [Short Name]

**As a** [persona], **I want** [action], **so that** [outcome].

**Acceptance Criteria:**
- AC-001.1: Given [precondition], when [action], then [expected result]
- AC-001.2: Given [precondition], when [action], then [expected result]
- AC-001.3: [edge case or error state criterion]

**Priority:** P0 (must-have) | P1 (should-have) | P2 (nice-to-have)

---

### Story US-002: [Short Name]

**As a** [persona], **I want** [action], **so that** [outcome].

**Acceptance Criteria:**
- AC-002.1: Given [precondition], when [action], then [expected result]
- AC-002.2: [error/edge case]

**Priority:** P0 | P1 | P2

---

*(Add more stories as needed)*

---

## Functional Requirements

> *System behaviours required to make the user stories possible.*

| ID | Requirement | Priority | Story Ref |
|----|-------------|----------|-----------|
| FR-001 | [The system must...] | P0 | US-001 |
| FR-002 | [The system must...] | P1 | US-002 |
| FR-003 | [The system shall...] | P2 | US-001, US-002 |

---

## Non-Functional Requirements

| Category | Requirement | Target |
|----------|-------------|--------|
| Performance | Page load time | < 2s (P95) |
| Security | Authentication | Required for all endpoints |
| Accessibility | WCAG compliance | 2.1 AA |
| Browser support | Target browsers | [list] |
| Mobile | Responsive | Yes / No |
| Data retention | [data type] | [retention period] |

---

## Data Models *(if applicable)*

> *Key entities and their fields. Not a full schema — just enough for Design and Dev to align.*

### Entity: [EntityName]

```
[EntityName]
├── id: uuid (PK)
├── [field]: [type] — [description]
├── [field]: [type] — [description]
├── created_at: timestamp
└── updated_at: timestamp
```

**Relationships:**
- [EntityA] has many [EntityB]
- [EntityB] belongs to [EntityA]

---

## API Contracts *(if applicable)*

> *Key endpoints that need to be built. Format is suggestive — Dev defines the final implementation.*

### `POST /api/[resource]`

**Purpose:** [what this does]

Request body:
```json
{
  "field": "type — description",
  "field": "type — description"
}
```

Response (200):
```json
{
  "id": "uuid",
  "field": "value"
}
```

Error responses: 400 (validation), 401 (auth), 409 (conflict)

---

## Open Questions

> *Unresolved decisions that need answers before or during development.*

| # | Question | Raised by | Status | Answer |
|---|----------|-----------|--------|--------|
| 1 | [Question] | PM | Open | — |
| 2 | [Question] | PM | Open | — |

---

## Assumptions

> *Things we are treating as true without explicit confirmation. If any assumption is wrong, this PRD may need revision.*

1. [Assumption 1]
2. [Assumption 2]

---

## Dependencies

> *Other systems, teams, or features this depends on.*

| Dependency | Type | Status | Owner |
|------------|------|--------|-------|
| [System/feature] | Internal | Available | — |
| [Third-party API] | External | TBD | — |

---

## Approval Status

| Reviewer | Role | Decision | Date | Notes |
|----------|------|----------|------|-------|
| [User] | Stakeholder | Pending | — | — |

**Current status:** DRAFT — Pending governance gate approval
