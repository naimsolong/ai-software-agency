# Setup Wizard - AI Software Agency
*30-second setup for your software development agency*

## Overview

This wizard initializes your AI Software Agency runtime at `~/.ai-software-agency/`:
- Initialise memory
- Default workflow settings
- Memory system redirect

## Step 1: Initialise memory

Run the `start-project` workflow to initialise `~/.software-agency/` structure

## Step 2: Workflow Style
**AI asks**: *"How do you prefer to work?"*

**Options**:
- Parallel — Multiple agents work simultaneously
- Sequential — One completes before next starts

**Result**: Default orchestration mode set

## Step 3: Global Config Redirect
Configure `~/.claude/CLAUDE.md` to use agency memory:

```
# AI Software Agency Configuration

## Memory System

**Primary Memory**: `~/.ai-software-agency/goals.md`
```

This redirects the global Claude memory to agency goals instead ofBruh personal memory.

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
├── projects/
└── memory/
```