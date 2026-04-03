#!/usr/bin/env bash
# =============================================================================
# install-coo.sh — The COO Skill Installer
# 
# Copies all COO system files into your OpenClaw workspace.
# Run once to install. Re-run with --reset to restore defaults.
#
# Usage:
#   ./install-coo.sh                          # Install to default workspace
#   ./install-coo.sh --target /path/to/dir   # Install to custom path
#   ./install-coo.sh --reset                 # Reset to defaults (backs up first)
#   ./install-coo.sh --dry-run               # Preview what would happen
# =============================================================================

set -e

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ── Defaults ──────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS_DIR="$(dirname "$SCRIPT_DIR")/assets"
TARGET_DIR="${HOME}/.openclaw/workspace"
RESET=false
DRY_RUN=false
TODAY=$(date +%Y-%m-%d)

# ── Argument parsing ──────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
  case $1 in
    --target)
      TARGET_DIR="$2"
      shift 2
      ;;
    --reset)
      RESET=true
      shift
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    -h|--help)
      echo "Usage: $0 [--target DIR] [--reset] [--dry-run]"
      exit 0
      ;;
    *)
      echo -e "${RED}Unknown argument: $1${NC}"
      exit 1
      ;;
  esac
done

# ── Header ────────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${CYAN}╔═══════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║       The COO — AI Chief of Staff     ║${NC}"
echo -e "${BOLD}${CYAN}║           Installer v1.0.0            ║${NC}"
echo -e "${BOLD}${CYAN}╚═══════════════════════════════════════╝${NC}"
echo ""

if [[ "$DRY_RUN" == true ]]; then
  echo -e "${YELLOW}[DRY RUN] No files will be written.${NC}"
  echo ""
fi

echo -e "  ${BLUE}Target workspace:${NC} $TARGET_DIR"
echo -e "  ${BLUE}Assets source:${NC}    $ASSETS_DIR"
echo ""

# ── Validation ────────────────────────────────────────────────────────────────
if [[ ! -d "$ASSETS_DIR" ]]; then
  echo -e "${RED}ERROR: Assets directory not found at: $ASSETS_DIR${NC}"
  echo "Make sure you're running this from inside the the-coo skill directory."
  exit 1
fi

# ── Create target directory ───────────────────────────────────────────────────
if [[ "$DRY_RUN" == false ]]; then
  mkdir -p "$TARGET_DIR"
fi

# ── Backup existing files if --reset ─────────────────────────────────────────
if [[ "$RESET" == true ]]; then
  BACKUP_DIR="$TARGET_DIR/memory/pre-reset-backup-$(date +%Y%m%d-%H%M%S)"
  echo -e "${YELLOW}⚠️  Reset mode: backing up existing files...${NC}"
  
  FILES_TO_BACKUP=("AGENTS.md" "SOUL.md" "IDENTITY.md" "USER.md" "HEARTBEAT.md" "TOOLS.md")
  BACKED_UP=0
  
  for f in "${FILES_TO_BACKUP[@]}"; do
    if [[ -f "$TARGET_DIR/$f" ]]; then
      if [[ "$DRY_RUN" == false ]]; then
        mkdir -p "$BACKUP_DIR"
        cp "$TARGET_DIR/$f" "$BACKUP_DIR/$f"
      fi
      echo -e "  ${YELLOW}→ Backed up: $f${NC}"
      BACKED_UP=$((BACKED_UP + 1))
    fi
  done
  
  if [[ $BACKED_UP -gt 0 ]]; then
    echo -e "  ${GREEN}Backup saved to: $BACKUP_DIR${NC}"
  else
    echo -e "  ${BLUE}No existing files to back up.${NC}"
  fi
  echo ""
fi

# ── Copy asset files ──────────────────────────────────────────────────────────
echo -e "${BOLD}Installing COO system files...${NC}"
echo ""

ASSETS=(
  "AGENTS.md"
  "SOUL.md"
  "IDENTITY.md"
  "USER.md"
  "HEARTBEAT.md"
  "TOOLS.md"
  "TASKS_TEMPLATE.json"
)

for asset in "${ASSETS[@]}"; do
  src="$ASSETS_DIR/$asset"
  
  # TASKS_TEMPLATE.json → TASKS.json in the workspace
  if [[ "$asset" == "TASKS_TEMPLATE.json" ]]; then
    dst="$TARGET_DIR/TASKS.json"
    label="TASKS_TEMPLATE.json → TASKS.json"
  else
    dst="$TARGET_DIR/$asset"
    label="$asset"
  fi
  
  if [[ ! -f "$src" ]]; then
    echo -e "  ${YELLOW}⚠  Skipping (not found): $asset${NC}"
    continue
  fi
  
  # Don't overwrite USER.md, SOUL.md, IDENTITY.md unless --reset
  if [[ "$RESET" == false ]] && [[ -f "$dst" ]]; then
    if [[ "$asset" == "USER.md" || "$asset" == "SOUL.md" || "$asset" == "IDENTITY.md" ]]; then
      echo -e "  ${BLUE}↷  Skipped (already exists): $label${NC}"
      continue
    fi
  fi
  
  if [[ "$DRY_RUN" == false ]]; then
    cp "$src" "$dst"
  fi
  echo -e "  ${GREEN}✓  Installed: $label${NC}"
done

echo ""

# ── Create memory directory ───────────────────────────────────────────────────
MEMORY_DIR="$TARGET_DIR/memory"
echo -e "${BOLD}Setting up memory system...${NC}"
echo ""

if [[ "$DRY_RUN" == false ]]; then
  mkdir -p "$MEMORY_DIR"
fi
echo -e "  ${GREEN}✓  Created: memory/${NC}"

# ── Create today's daily memory note ─────────────────────────────────────────
DAILY_NOTE="$MEMORY_DIR/$TODAY.md"

if [[ ! -f "$DAILY_NOTE" ]] || [[ "$RESET" == true ]]; then
  if [[ "$DRY_RUN" == false ]]; then
    cat > "$DAILY_NOTE" << EOF
# $TODAY

## Session Notes

_Your COO will write here automatically during sessions._
_You can also add notes manually at any time._

---

## Setup

- ✅ Installed the-coo skill
- ⏳ Customizing IDENTITY.md, USER.md, SOUL.md
- ⏳ Setting up heartbeat cron

## First Tasks

1. Open IDENTITY.md — give your COO a name
2. Open USER.md — fill in your profile and goals  
3. Open SOUL.md — set the tone and hard rules
4. Start your first session and say hello

EOF
  fi
  echo -e "  ${GREEN}✓  Created: memory/$TODAY.md${NC}"
else
  echo -e "  ${BLUE}↷  Skipped (already exists): memory/$TODAY.md${NC}"
fi

# ── Create heartbeat state file ───────────────────────────────────────────────
HB_STATE="$MEMORY_DIR/heartbeat-state.json"

if [[ ! -f "$HB_STATE" ]]; then
  if [[ "$DRY_RUN" == false ]]; then
    cat > "$HB_STATE" << 'EOF'
{
  "lastChecks": {
    "email": null,
    "calendar": null,
    "weather": null,
    "tasks": null,
    "mentions": null
  },
  "lastBrief": null,
  "lastGitSync": null
}
EOF
  fi
  echo -e "  ${GREEN}✓  Created: memory/heartbeat-state.json${NC}"
fi

# ── Create CRITICAL.md stub ───────────────────────────────────────────────────
CRITICAL_FILE="$TARGET_DIR/CRITICAL.md"

if [[ ! -f "$CRITICAL_FILE" ]]; then
  if [[ "$DRY_RUN" == false ]]; then
    cat > "$CRITICAL_FILE" << 'EOF'
# CRITICAL.md — Hard Rules

<!-- 
  This file is read FIRST every session, before anything else.
  Put non-negotiable rules here. Be specific.
  This file overrides SOUL.md preferences when there's a conflict.
-->

## Hard Stops (ALWAYS ask before doing these)

- Never send external messages (email, SMS, social posts) without explicit approval
- Never delete files — use trash or backup first
- Never initiate payments or create subscriptions
- Never share MEMORY.md contents outside a direct 1:1 session

## Model Rules

- Default: [FILL IN YOUR DEFAULT MODEL, e.g., claude-haiku / gemini-flash]
- Deep reasoning: [FILL IN YOUR PREFERRED HEAVY MODEL]
- Sub-agents: always use default model unless specified

## Autonomy Threshold

- Act without asking: tasks under $[AMOUNT] and under [TIME, e.g., 1 hour] of compute
- Always ask first: irreversible actions, external communication, spending money

## Active Notes

<!-- Add time-sensitive constraints here. Remove when no longer relevant. -->
- [DATE]: [COO installed — in setup mode]

EOF
  fi
  echo -e "  ${GREEN}✓  Created: CRITICAL.md (stub — fill in your rules)${NC}"
else
  echo -e "  ${BLUE}↷  Skipped (already exists): CRITICAL.md${NC}"
fi

echo ""

# ── Summary ───────────────────────────────────────────────────────────────────
echo -e "${BOLD}${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${BOLD}${GREEN}║         Setup Complete! 🫡             ║${NC}"
echo -e "${BOLD}${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${BOLD}Files installed to:${NC} $TARGET_DIR"
echo ""
echo -e "${BOLD}Your next 3 steps:${NC}"
echo ""
echo -e "  ${CYAN}1.${NC} ${BOLD}IDENTITY.md${NC} — Give your COO a name and set its emoji"
echo -e "  ${CYAN}2.${NC} ${BOLD}USER.md${NC}     — Fill in your profile, goals, and current projects"
echo -e "  ${CYAN}3.${NC} ${BOLD}SOUL.md${NC}     — Customize the tone and add your hard rules"
echo ""
echo -e "${BOLD}Then start your first session and say:${NC}"
echo -e "  ${YELLOW}\"Hey. Run a system check — confirm you've read all files and give me a status.\"${NC}"
echo ""
echo -e "${BOLD}Full setup guide:${NC}"
echo -e "  $(dirname "$SCRIPT_DIR")/references/setup-guide.md"
echo ""
echo -e "${BOLD}Customization guide:${NC}"
echo -e "  $(dirname "$SCRIPT_DIR")/references/customization.md"
echo ""

if [[ "$DRY_RUN" == true ]]; then
  echo -e "${YELLOW}[DRY RUN] No files were actually written. Remove --dry-run to install.${NC}"
  echo ""
fi
