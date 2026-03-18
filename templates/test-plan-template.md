# Test Plan: [Feature Name]

**Goal ID:** [B-id] → [F-id]
**Status:** Draft
**Author:** qa-lead
**Created:** [ISO-date]
**Last Updated:** [ISO-date]
**PRD Reference:** .agency/projects/[slug]/prd.md
**Phase:** Pre-Development (test planning) | Post-Development (execution)

---

## Test Scope

> *What is being tested in this plan.*

This test plan covers:
- [User story US-001]: [short name]
- [User story US-002]: [short name]
- [User story US-003]: [short name]

---

## Out of Scope

> *What is explicitly NOT being tested here (and why).*

- [Feature/area]: [reason — e.g., covered by another test suite, not part of this release]
- Performance load testing: [if not applicable]

---

## Test Environment Requirements

> *What must be set up before tests can run.*

| Requirement | Details |
|------------|---------|
| Application running at | `localhost:[port]` or [URL] |
| Database state | Fresh seed / specific fixtures |
| Test user accounts | [roles needed, e.g., admin, standard user, guest] |
| External services | [mocked / real — list any APIs] |
| Browser | [Chrome latest / Firefox / Safari] |
| Data prerequisites | [any data that must exist before testing] |

---

## User Stories Covered

| Story ID | Title | Priority | Test Cases |
|----------|-------|----------|-----------|
| US-001 | [Name] | P0 | TC-001, TC-002, TC-003 |
| US-002 | [Name] | P1 | TC-004, TC-005 |
| US-003 | [Name] | P2 | TC-006 |

---

## Test Cases

### Happy Path Tests

> *User follows the expected flow with valid data. These must all pass for any release.*

---

#### TC-001: [Test Name — Happy Path]

**Story Reference:** US-001
**AC Reference:** AC-001.1
**Category:** Happy Path
**Priority:** P0

**Preconditions:**
- User is logged in as [role]
- [Any required data state]

**Steps:**
1. Navigate to [page/route]
2. [Action — be specific: "Click the 'Add Item' button in the top-right corner"]
3. [Action — "Enter 'Test Item Name' in the Name field"]
4. [Action — "Click 'Save'"]

**Expected Result:**
- [Outcome 1: "Item appears in the list with name 'Test Item Name'"]
- [Outcome 2: "Success toast notification appears: 'Item created'"]
- [Outcome 3: "User is redirected to /items/[new-id]"]

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

#### TC-002: [Test Name — Happy Path]

**Story Reference:** US-001
**AC Reference:** AC-001.2
**Category:** Happy Path
**Priority:** P0

**Preconditions:**
- [preconditions]

**Steps:**
1. [step]
2. [step]

**Expected Result:**
- [outcome]

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

### Edge Case Tests

> *Boundary conditions, minimum/maximum values, empty states.*

---

#### TC-003: [Test Name — Edge Case]

**Story Reference:** US-001
**AC Reference:** AC-001.3
**Category:** Edge Case
**Priority:** P1

**Preconditions:**
- [preconditions]

**Steps:**
1. [step — e.g., "Enter a name with 255 characters (maximum allowed)"]
2. [step]

**Expected Result:**
- [outcome — e.g., "Name is accepted and saved at full length"]

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

#### TC-004: [Empty State Test]

**Story Reference:** US-001
**Category:** Edge Case
**Priority:** P1

**Preconditions:**
- No [items] exist in the system

**Steps:**
1. Navigate to [page]

**Expected Result:**
- Empty state UI is displayed with correct message
- CTA button is visible and clickable

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

### Error Path Tests

> *What happens when things go wrong — invalid input, unauthorised access, network errors.*

---

#### TC-005: [Validation Error Test]

**Story Reference:** US-001
**AC Reference:** AC-001.2
**Category:** Error Path
**Priority:** P0

**Preconditions:**
- User is on the [form page]

**Steps:**
1. Leave required field [field name] empty
2. Click 'Save'

**Expected Result:**
- Form does not submit
- Error message appears below [field]: "[Expected error text]"
- Field is highlighted with error styling (red border)
- User remains on the form

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

#### TC-006: [Unauthorised Access Test]

**Story Reference:** US-002
**Category:** Error Path
**Priority:** P0

**Preconditions:**
- User is NOT logged in (or lacks required role)

**Steps:**
1. Navigate directly to [protected route]

**Expected Result:**
- User is redirected to /login
- After login, user is redirected back to [original route]

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

#### TC-007: [Duplicate/Conflict Test]

**Story Reference:** US-001
**Category:** Error Path
**Priority:** P1

**Preconditions:**
- [Item with same unique identifier] already exists

**Steps:**
1. Attempt to create [item] with the same [unique field]
2. Submit form

**Expected Result:**
- Error response: "[Expected error message]"
- No duplicate created in database

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

### Regression Tests

> *Existing functionality that must still work correctly after this change is deployed.*

---

#### TC-008: [Regression Test Name]

**Area:** [existing feature that could be affected]
**Category:** Regression
**Priority:** P1

**Preconditions:**
- [state]

**Steps:**
1. [steps to verify existing functionality still works]

**Expected Result:**
- [existing behaviour is unchanged]

**Pass/Fail:** [ ] Pass  [ ] Fail
**Execution Date:** —
**Notes:** —

---

## Bug Reports

> *Populated during test execution phase. Not written ahead of time.*

*(No bugs yet — this section is populated when tests are executed after development)*

---

## Execution Summary

> *Filled in after test execution is complete.*

| Category | Total | Passed | Failed | Blocked | Skip |
|----------|-------|--------|--------|---------|------|
| Happy Path | — | — | — | — | — |
| Edge Case | — | — | — | — | — |
| Error Path | — | — | — | — | — |
| Regression | — | — | — | — | — |
| **TOTAL** | — | — | — | — | — |

**Open bugs by severity:**
- P0 (blockers): —
- P1 (critical): —
- P2 (major): —
- P3 (minor): —

---

## Release Recommendation

**Status:** PENDING EXECUTION

*(After execution, QA Lead updates this to:)*
- ✅ **APPROVED FOR RELEASE** — All P0/P1 tests pass. [N] P2/P3 bugs open (tracked).
- 🚫 **BLOCKED** — [N] P0 bugs open. Cannot release until resolved: BUG-001, BUG-002.

---

## Approval Status

| Reviewer | Role | Decision | Date | Notes |
|----------|------|----------|------|-------|
| User | Stakeholder | Pending | — | — |

**Current status:** DRAFT — Pending governance gate approval (pre-development)
