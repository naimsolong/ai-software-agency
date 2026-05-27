# Setup Wizard - AI Software Agency
*30-second setup for your software development team*

## Overview

This wizard initializes your AI Software Agency runtime at `~/.ai-software-agency/`:
- Agency configuration
- Default workflow settings

## Step 1: Team Name
**AI asks**: *"What should your development team be called?"*

**You answer**: "Backend Team" (or any name)

**Result**: Team configuration created at `~/.ai-software-agency/config.json`

## Step 2: Workflow Style
**AI asks**: *"How do you prefer to work?"*

**Options**:
- Parallel — Multiple agents work simultaneously
- Sequential — One completes before next starts

**Result**: Default orchestration mode set

## Setup Complete

Your AI Software Agency is now configured at `~/.ai-software-agency/`:
- Team: [TEAM_NAME]
- Workflow: [STYLE]

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