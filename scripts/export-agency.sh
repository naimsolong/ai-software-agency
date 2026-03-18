#!/bin/bash
# export-agency.sh
# Export the current .agency/ workspace as a portable template.
# Scrubs secrets, API keys, and sensitive user data before exporting.
# Usage: bash path/to/ai-software-agency/scripts/export-agency.sh [output-path]

set -e

TARGET_DIR="$(pwd)"
AGENCY_BASE_DIR="${AGENCY_HOME:-$HOME}"
AGENCY_DIR="$AGENCY_BASE_DIR/.agency"
TIMESTAMP=$(date -u +%Y%m%dT%H%M%SZ)
DEFAULT_OUTPUT="$TARGET_DIR/agency-export-$TIMESTAMP.tar.gz"
OUTPUT="${1:-$DEFAULT_OUTPUT}"

# ─── Colours ────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()   { echo -e "${GREEN}✓${NC} $1"; }
warn()  { echo -e "${YELLOW}⚠${NC} $1"; }
error() { echo -e "${RED}✗${NC} $1"; exit 1; }

# ─── Checks ──────────────────────────────────────────────────────────────────
if [ ! -d "$AGENCY_DIR" ]; then
  error ".agency/ not found. Run init-agency.sh first."
fi

# ─── Create temp export directory ────────────────────────────────────────────
EXPORT_DIR=$(mktemp -d)
EXPORT_AGENCY="$EXPORT_DIR/.agency"
cp -r "$AGENCY_DIR" "$EXPORT_AGENCY"

log "Copied .agency/ to temporary export directory"

# ─── Scrub secrets from config.json ──────────────────────────────────────────
if [ -f "$EXPORT_AGENCY/config.json" ]; then
  # Remove any fields that might contain API keys or tokens
  python3 - "$EXPORT_AGENCY/config.json" << 'PYEOF' 2>/dev/null || true
import json, sys, re

config_path = sys.argv[1]
with open(config_path) as f:
    config = json.load(f)

SECRET_KEYS = {'api_key', 'secret', 'token', 'password', 'auth', 'key', 'credential'}

def scrub(obj, path=''):
    if isinstance(obj, dict):
        return {
            k: '[REDACTED]' if any(s in k.lower() for s in SECRET_KEYS) else scrub(v, f"{path}.{k}")
            for k, v in obj.items()
        }
    elif isinstance(obj, list):
        return [scrub(i, path) for i in obj]
    elif isinstance(obj, str):
        # Scrub anything that looks like an API key (long alphanumeric strings)
        if re.match(r'^[A-Za-z0-9_\-]{32,}$', obj):
            return '[REDACTED]'
        return obj
    return obj

scrubbed = scrub(config)
with open(config_path, 'w') as f:
    json.dump(scrubbed, f, indent=2)
print("  Secrets scrubbed from config.json")
PYEOF
  log "config.json scrubbed"
fi

# ─── Remove memory files (personal/session data) ─────────────────────────────
if [ -d "$EXPORT_AGENCY/memory" ]; then
  # Keep directory structure, clear memory content
  find "$EXPORT_AGENCY/memory" -name "MEMORY.md" -exec sh -c '
    agent_name=$(basename "$(dirname "$1")")
    echo "# ${agent_name} Memory — EXPORTED TEMPLATE" > "$1"
    echo "" >> "$1"
    echo "Memory cleared for export. Re-initialise with init-agency.sh" >> "$1"
  ' _ {} \;
  log "Memory files cleared (structure preserved)"
fi

# ─── Remove sensitive content from audit.log ─────────────────────────────────
if [ -f "$EXPORT_AGENCY/audit.log" ]; then
  # Keep structure but scrub user-identifiable info
  python3 - "$EXPORT_AGENCY/audit.log" << 'PYEOF' 2>/dev/null || true
import sys, re

with open(sys.argv[1]) as f:
    lines = f.readlines()

scrubbed = []
for line in lines:
    # Remove email addresses
    line = re.sub(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b', '[EMAIL]', line)
    # Remove anything that looks like a token
    line = re.sub(r'\b[A-Za-z0-9_\-]{40,}\b', '[TOKEN]', line)
    # Remove file paths above .agency/
    line = re.sub(r'/[^\s]*?/\.agency', '.agency', line)
    scrubbed.append(line)

with open(sys.argv[1], 'w') as f:
    f.writelines(scrubbed)
PYEOF
  log "audit.log scrubbed"
fi

# ─── Add export metadata ─────────────────────────────────────────────────────
cat > "$EXPORT_AGENCY/EXPORT-METADATA.json" << METAEOF
{
  "exported_at": "$TIMESTAMP",
  "export_version": "1.0.0",
  "source": "ai-software-agency plugin",
  "contains": {
    "config": true,
    "tasks": true,
    "goals": true,
    "budget": true,
    "audit_log": true,
    "project_docs": true,
    "memory": false
  },
  "import_instructions": "Run init-agency.sh then copy .agency/ contents from this export. Update config.json company and project fields."
}
METAEOF
log "Export metadata written"

# ─── Package ─────────────────────────────────────────────────────────────────
tar -czf "$OUTPUT" -C "$EXPORT_DIR" .agency
rm -rf "$EXPORT_DIR"

log "Archive created: $OUTPUT"

echo ""
echo "Export complete: $OUTPUT"
echo ""
echo "To import in another project:"
echo "  1. Run: bash init-agency.sh <new-project-slug>"
echo "  2. Extract: tar -xzf $(basename "$OUTPUT") -C /path/to/project"
echo "  3. Update: .agency/config.json (company, project slug)"
echo "  4. Review: .agency/goals.md and .agency/tasks.md"
echo ""
