---
name: swarm
description: You are running inside a Herdr-managed workspace. Use the Herdr CLI to orchestrate work instead of simulating multiple agents in a single conversation of a given instruction by the user.
---

Workflow:

1. Given the following agents (check if the agent is available first):
  - Claude (via `claude` CLI)
  - Codex (via `codex` CLI)
  - OpenCode (via `opencode` CLI)
  - Pi (via `pi` CLI)
    
2. Use specialized skills only when needed, located at `../specialists`

3. Discover available agents
  - herdr agent list

4. Open all of the agents in new /herdr tabs in this workspace and reuse existing agents whenever possible.
  - Name each herdr tab using this format `swarm-{agent}-task{number}` (ie. `swarm-claude-task1`)
  - Each task number is unique and incremental multiple task given if provided
  - Do not start duplicate agents if one already exists.

5. Perform the action the user has provided in these new agent tabs, using herdr to prompt each in parallel by assign work using:
  - herdr agent prompt `swarm-{agent}-task{number}` \"<task>\"

6. After all agents are finished, combine and consolidate their output as sensibly as possible.
  - Do not rush the agents, give them the time they need.
  - Wait for completion instead of polling:
    - herdr agent wait `swarm-{agent}-task{number}` --until idle
  - Only intervene if they are legitimately stuck (ie. can't write to /tmp as herdr suggests, etc.)

7. Synthesize all results into a final recommendation and read each agent's output:
  - herdr agent read `swarm-{agent}-task{number}`

8. Report back to this agent with the consolidated findings.

9. Close all herdr tabs you opened for this swarm task.

Rules:

- Treat every Herdr agent as having a persistent session.
- Reuse previous context stored in each agent rather than repeating analysis.
- Delegate only when parallel work is beneficial.
- Prefer minimal context per agent.
- Keep the planner responsible for task decomposition.
- The reviewer must review all code before completion.
- The tester validates acceptance criteria before marking work complete.
- Never duplicate work already completed by another agent.
- If an agent is blocked, inspect its output, resolve the blocker, and continue.

Before starting any work:

- Inspect the current Herdr workspace.
- Identify existing agents.
- Reuse them if available.
- Only create new agents when no suitable agent exists.

Your role is the orchestrator, not the sole implementer.