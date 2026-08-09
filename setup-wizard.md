# Setup Wizard - AI Software Agency
*30-second setup for your software development agency*

## Overview

This wizard initializes your AI Software Agency runtime at `~/.ai-software-agency/`:
- Initialise memory
- Default workflow settings
- Memory system redirect

## Step 1: Initialise memory

Run the `start-project` workflow to initialise `~/.ai-software-agency/` structure

## Step 2: Workflow Style
**AI asks**: *"How do you prefer to work?"*

**Options**:
- Parallel — Multiple agents work simultaneously
- Sequential — One completes before next starts

**Result**: Default orchestration mode set

## Step 3: Global Config Redirect
Point your agent's global instructions to use agency memory. For Claude Code, configure `~/.claude/CLAUDE.md`:

```
# AI Software Agency Configuration

## Memory System

**Primary Memory**: `~/.ai-software-agency/goals.md`
```

For other agents, add the same block to the equivalent global instructions file (e.g. `~/.config/opencode/AGENTS.md`, `~/.codex/AGENTS.md`, or `~/.agents/AGENTS.md`). The goal is the same everywhere: redirect the agent's base memory to `~/.ai-software-agency/goals.md`.

## Setup Complete

Your AI Software Agency is now configured at `~/.ai-software-agency/`:
- Workflow: [STYLE]
- Memory: `~/.ai-software-agency/goals.md`

This creates the runtime directory structure:
```
~/.ai-software-agency/
├── config.json
├── tasks.md
├── goals.md
├── audit.log
├── mcp.json
├── projects/
└── memory/
```