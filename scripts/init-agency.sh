#!/bin/bash
# init-agency.sh
# Initialise the .agency/ workspace in the current project directory.
# Usage: bash path/to/ai-software-agency/scripts/init-agency.sh [project-slug]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="$(pwd)"
AGENCY_BASE_DIR="${AGENCY_HOME:-$HOME}"

# ─── Colours ────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Colour

log()    { echo -e "${GREEN}✓${NC} $1"; }
warn()   { echo -e "${YELLOW}⚠${NC} $1"; }
error()  { echo -e "${RED}✗${NC} $1"; exit 1; }
header() { echo -e "\n${GREEN}── $1 ──${NC}"; }

# ─── Arguments ───────────────────────────────────────────────────────────────
PROJECT_SLUG="${1:-}"
if [ -z "$PROJECT_SLUG" ]; then
  echo "Usage: bash init-agency.sh <project-slug>"
  echo "Example: bash init-agency.sh my-saas-app"
  exit 1
fi

# Validate slug (lowercase, hyphens only)
if ! echo "$PROJECT_SLUG" | grep -qE '^[a-z0-9][a-z0-9-]*[a-z0-9]$'; then
  error "Project slug must be lowercase letters, numbers, and hyphens only (e.g. my-project)"
fi

# ─── Check if already initialised ───────────────────────────────────────────
AGENCY_DIR="$AGENCY_BASE_DIR/.agency"
if [ -d "$AGENCY_DIR" ]; then
  warn ".agency/ already exists in $AGENCY_BASE_DIR"
  read -r -p "Reinitialise? This will NOT overwrite existing project files. [y/N] " confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
  fi
fi

# ─── Create directory structure ─────────────────────────────────────────────
header "Creating .agency/ structure"

mkdir -p "$AGENCY_DIR/projects/$PROJECT_SLUG"
mkdir -p "$AGENCY_DIR/memory/ceo"
mkdir -p "$AGENCY_DIR/memory/product-manager"
mkdir -p "$AGENCY_DIR/memory/uiux-designer"
mkdir -p "$AGENCY_DIR/memory/fullstack-developer"
mkdir -p "$AGENCY_DIR/memory/qa-lead"

log "Directories created"

# ─── Write config.json ────────────────────────────────────────────────────
ISO_DATE=$(date -u +%Y-%m-%dT%H:%M:%SZ)

cat > "$AGENCY_DIR/config.json" << CONFIGEOF
{
  "agency": {
    "name": "AI Software Agency",
    "version": "1.0.0"
  },
  "company": {
    "name": "My Company"
  },
  "project": {
    "slug": "$PROJECT_SLUG",
    "name": "$PROJECT_SLUG",
    "created": "$ISO_DATE",
    "status": "active"
  },
  "budget": {
    "currency": "USD",
    "total": 50,
    "per_agent_percentage": {
      "ceo": 0.20,
      "product-manager": 0.15,
      "uiux-designer": 0.15,
      "fullstack-developer": 0.35,
      "qa-lead": 0.15
    },
    "alert_threshold_pct": 20,
    "hard_stop_at_zero": true
  },
  "settings": {
    "enable_memory": true,
    "enable_budget_tracking": true,
    "enable_audit_log": true,
    "require_governance_gates": true,
    "require_task_checkout": true
  }
}
CONFIGEOF
log "config.json written"

# ─── Write tasks.md ───────────────────────────────────────────────────────
TODAY=$(date -u +%Y-%m-%d)

cat > "$AGENCY_DIR/tasks.md" << TASKSEOF
# Task Registry — $PROJECT_SLUG

<!-- Format: | ID | Title | Owner | Status | Created | Updated | Notes -->

| ID    | Title                       | Owner                | Status   | Created    | Updated    | Notes |
|-------|-----------------------------|----------------------|----------|------------|------------|-------|
| T-001 | Create PRD                  | product-manager      | pending  | $TODAY     | $TODAY     |       |
| T-002 | Write test plan from PRD    | qa-lead              | pending  | $TODAY     | $TODAY     | After T-001 approved |
| T-003 | Create design spec          | uiux-designer        | pending  | $TODAY     | $TODAY     | After T-001 approved |
| T-004 | Implement features          | fullstack-developer  | pending  | $TODAY     | $TODAY     | After T-002 + T-003 approved |
| T-005 | Execute test validation     | qa-lead              | pending  | $TODAY     | $TODAY     | After T-004 complete |
TASKSEOF
log "tasks.md written (5 tasks)"

# ─── Write goals.md ───────────────────────────────────────────────────────
cat > "$AGENCY_DIR/goals.md" << GOALSEOF
# Agency Goals — $PROJECT_SLUG

## B-001: [Business Goal — Update this]

**Created:** $ISO_DATE
**Status:** active
**Description:** [Replace with the business goal for this project]
**Success Metric:** [How will we know this goal is achieved?]
**Target Users:** [Who benefits?]

### Child Goals
- P-001: [Project goal derived from B-001]
  - F-001: [Feature]
    - T-001: Create PRD [pending]
    - T-002: Write test plan [pending]
    - T-003: Create design spec [pending]
    - T-004: Implement features [pending]
    - T-005: Execute test validation [pending]
GOALSEOF
log "goals.md written"

# ─── Write budget.md ──────────────────────────────────────────────────────
cat > "$AGENCY_DIR/budget.md" << BUDGETEOF
# Budget Tracker — $PROJECT_SLUG

**Total Budget:** \$50.00
**Allocated:** \$50.00
**Spent:** \$0.00
**Remaining:** \$50.00

## Per-Agent Allocation

| Agent                | Allocated | Spent    | Remaining | % Used |
|----------------------|-----------|----------|-----------|--------|
| ceo                  | \$10.00   | \$0.00   | \$10.00   | 0%     |
| product-manager      | \$7.50    | \$0.00   | \$7.50    | 0%     |
| uiux-designer        | \$7.50    | \$0.00   | \$7.50    | 0%     |
| fullstack-developer  | \$17.50   | \$0.00   | \$17.50   | 0%     |
| qa-lead              | \$7.50    | \$0.00   | \$7.50    | 0%     |

## Spend Log

| Date | Agent | Task | Estimated | Actual | Notes |
|------|-------|------|-----------|--------|-------|
BUDGETEOF
log "budget.md written"

# ─── Write audit.log ──────────────────────────────────────────────────────
cat > "$AGENCY_DIR/audit.log" << AUDITEOF
[$ISO_DATE] [SYSTEM] PROJECT_INIT: Project '$PROJECT_SLUG' initialised via init-agency.sh
[$ISO_DATE] [SYSTEM] TASKS_CREATED: T-001 through T-005 registered in tasks.md
[$ISO_DATE] [SYSTEM] GOAL_TEMPLATE: B-001 placeholder created in goals.md
AUDITEOF
log "audit.log created"

# ─── Create project placeholder files ─────────────────────────────────────
touch "$AGENCY_DIR/projects/$PROJECT_SLUG/prd.md"
touch "$AGENCY_DIR/projects/$PROJECT_SLUG/design.md"
touch "$AGENCY_DIR/projects/$PROJECT_SLUG/tests.md"
touch "$AGENCY_DIR/projects/$PROJECT_SLUG/changelog.md"
log "Project placeholder files created"

# ─── Initialise agent memory files ────────────────────────────────────────
AGENTS=("ceo" "product-manager" "uiux-designer" "fullstack-developer" "qa-lead")
AGENT_NAMES=("CEO" "Product Manager" "UI/UX Designer" "Fullstack Developer" "QA Lead")

for i in "${!AGENTS[@]}"; do
  AGENT="${AGENTS[$i]}"
  AGENT_NAME="${AGENT_NAMES[$i]}"
  cat > "$AGENCY_DIR/memory/$AGENT/MEMORY.md" << MEMEOF
# $AGENT_NAME Memory — Project: $PROJECT_SLUG

**Initialised:** $ISO_DATE
**Sessions:** 0
**Project:** $PROJECT_SLUG

---

## 1. Identity Core

Role: $AGENT_NAME of the AI Software Agency.
Read CLAUDE.md for full role definition.

## 2. Project Context

**Project:** $PROJECT_SLUG
**Business Goal:** B-001 — [Update after project is defined]
**Current Stage:** not started
**Tech Stack:** TBD
**Key Files:**
- PRD: .agency/projects/$PROJECT_SLUG/prd.md
- Design: .agency/projects/$PROJECT_SLUG/design.md
- Tests: .agency/projects/$PROJECT_SLUG/tests.md

## 3. User Preferences

(Populated through interactions)

## 4. Key Decisions

(Populated as work progresses)

## 5. Learned Patterns

(Populated through the project lifecycle)

## 6. Open Items

(Populated as questions arise)
MEMEOF
done
log "Agent memory files initialised (5 agents)"

# ─── No .gitignore update needed ──────────────────────────────────────────
# .agency/ now lives in the user's home directory (~/.agency/), outside any
# project repository, so no .gitignore entry is required.
log ".gitignore unchanged (agency dir is home-scoped, not project-scoped)"

# ─── Done ─────────────────────────────────────────────────────────────────
header "Agency workspace ready"
echo ""
echo "  Project: $PROJECT_SLUG"
echo "  Location: $AGENCY_DIR  (home-scoped, shared across projects)"
echo ""
echo "  Files created:"
echo "    ~/.agency/config.json"
echo "    ~/.agency/tasks.md         (5 tasks)"
echo "    ~/.agency/goals.md         (B-001 placeholder)"
echo "    ~/.agency/budget.md        (\$50 allocated)"
echo "    ~/.agency/audit.log"
echo "    ~/.agency/projects/$PROJECT_SLUG/  (prd, design, tests, changelog)"
echo "    ~/.agency/memory/<agent>/MEMORY.md  (5 agents)"
echo ""
echo "  Next steps:"
echo "    1. Update ~/.agency/goals.md with your business goal"
echo "    2. Invoke the CEO agent to begin orchestration"
echo "    3. Or use the 'start-project' skill from Claude"
echo ""
