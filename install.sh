#!/usr/bin/env bash
# AI Software Agency — Skill Installer
# Installs agency skills to Claude Code or Deep Agents CLI
#
# Usage:
#   ./install.sh [options] [target-dir]
#
# Options:
#   --claude        Install for Claude Code (default)
#   --deepagents    Install for Deep Agents CLI
#   --global, -g    Install globally (~/.claude or ~/.deepagents)
#   --force,  -f    Overwrite existing installation
#   --yes,    -y    Skip confirmation prompt
#   --help,   -h    Show this help message

set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────────────────
TARGET="claude"
GLOBAL=false
FORCE=false
YES=false
TARGET_DIR=""

SKILLS_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"
AGENTS_SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/config/AGENTS.md" && pwd)"

# ── Colours ───────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
RESET='\033[0m'

ok()   { echo -e "${GREEN}✓${RESET} $*"; }
warn() { echo -e "${YELLOW}⚠${RESET} $*"; }
err()  { echo -e "${RED}✗${RESET} $*" >&2; exit 1; }
info() { echo -e "  $*"; }

# ── Help ──────────────────────────────────────────────────────────────────────
usage() {
  cat <<EOF
${BOLD}AI Software Agency — Skill Installer${RESET}

Usage: ./install.sh [options] [target-dir]

Options:
  --claude        Install for Claude Code (default)
  --deepagents    Install for Deep Agents CLI
  --global, -g    Install globally (~/.claude/skills or ~/.deepagents/langchain_agent)
  --force,  -f    Overwrite existing installation
  --yes,    -y    Skip confirmation prompt
  --help,   -h    Show this help

Examples:
  ./install.sh                          # Claude Code, local project
  ./install.sh --global                 # Claude Code, global
  ./install.sh --deepagents --global    # Deep Agents, global
  ./install.sh --claude ./my-project    # Claude Code, custom directory
EOF
}

# ── Argument parsing ──────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case "$1" in
    --claude)      TARGET="claude"; shift ;;
    --deepagents)  TARGET="deepagents"; shift ;;
    --global|-g)   GLOBAL=true; shift ;;
    --force|-f)    FORCE=true; shift ;;
    --yes|-y)      YES=true; shift ;;
    --help|-h)     usage; exit 0 ;;
    -*)            err "Unknown option: $1. Run ./install.sh --help for usage." ;;
    *)             TARGET_DIR="$1"; shift ;;
  esac
done

# ── Validate source ───────────────────────────────────────────────────────────
[[ -d "$SKILLS_SRC" ]] || err "Skills source directory not found: $SKILLS_SRC"

# ── Resolve install path ──────────────────────────────────────────────────────
if [[ -n "$TARGET_DIR" ]]; then
  INSTALL_PATH="$TARGET_DIR"
elif [[ "$GLOBAL" == true ]]; then
  if [[ "$TARGET" == "claude" ]]; then
    INSTALL_PATH="$HOME/.claude/skills"
  else
    INSTALL_PATH="$HOME/.deepagents/langchain_agent"
  fi
else
  # Local: current working directory
  if [[ "$TARGET" == "claude" ]]; then
    INSTALL_PATH="$(pwd)/.claude/skills"
  else
    INSTALL_PATH="$(pwd)/skills"
  fi
fi

# ── Collision check ───────────────────────────────────────────────────────────
if [[ -d "$INSTALL_PATH" && "$GLOBAL" == true && "$TARGET" == "deepagents" && "$FORCE" == false ]]; then
  warn "Deep Agents skills already installed at: $INSTALL_PATH"
  warn "Use --force to overwrite."
  exit 1
fi

# ── Summary ───────────────────────────────────────────────────────────────────
SKILL_COUNT=$(find "$SKILLS_SRC" -name "SKILL.md" | wc -l | tr -d ' ')

echo ""
echo -e "${BOLD}AI Software Agency — Skill Installer${RESET}"
echo ""
info "Platform  : ${BOLD}$TARGET${RESET}"
info "Scope     : $([ "$GLOBAL" == true ] && echo 'global' || echo 'local')"
info "Skills    : $SKILL_COUNT skills"
info "Install → : $INSTALL_PATH"
echo ""

# ── Confirmation ──────────────────────────────────────────────────────────────
if [[ "$YES" == false ]]; then
  read -rp "Proceed with installation? [y/N] " CONFIRM
  [[ "${CONFIRM,,}" =~ ^y(es)?$ ]] || { echo "Aborted."; exit 0; }
  echo ""
fi

# ── Install ───────────────────────────────────────────────────────────────────
mkdir -p "$INSTALL_PATH"

INSTALLED=0
SKIPPED=0

while IFS= read -r skill_dir; do
  slug="$(basename "$skill_dir")"
  dest="$INSTALL_PATH/$slug"

  if [[ -d "$dest" && "$FORCE" == false ]]; then
    warn "Skipping $slug (already exists — use --force to overwrite)"
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  mkdir -p "$dest"
  cp "$skill_dir/SKILL.md" "$dest/SKILL.md"
  ok "Installed: $slug"
  INSTALLED=$((INSTALLED + 1))
done < <(find "$SKILLS_SRC" -mindepth 1 -maxdepth 1 -type d | sort)

# Deep Agents: also install agent persona
if [[ "$TARGET" == "deepagents" && "$GLOBAL" == true ]]; then
  AGENTS_FILE="$(dirname "${BASH_SOURCE[0]}")/config/AGENTS.md"
  if [[ -f "$AGENTS_FILE" ]]; then
    PERSONA_DIR="$HOME/.deepagents/langchain_agent"
    mkdir -p "$PERSONA_DIR"
    cp "$AGENTS_FILE" "$PERSONA_DIR/AGENTS.md"
    ok "Installed: agency persona (AGENTS.md)"
  fi
fi

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}Installation complete${RESET}"
info "Installed : $INSTALLED skills"
[[ $SKIPPED -gt 0 ]] && info "Skipped   : $SKIPPED (already present)"
info "Location  : $INSTALL_PATH"
echo ""

if [[ "$TARGET" == "claude" ]]; then
  echo -e "${BOLD}Next steps (Claude Code):${RESET}"
  info "1. Restart Claude Code to load the new skills"
  info "2. Start a project: /start-project"
  info "3. Docs: https://github.com/naimsolong/ai-software-agency"
else
  echo -e "${BOLD}Next steps (Deep Agents):${RESET}"
  info "1. Skills are available to your Deep Agent automatically"
  info "2. Reference a skill by its name in your agent prompt"
  info "3. Docs: https://github.com/naimsolong/ai-software-agency"
fi
echo ""
