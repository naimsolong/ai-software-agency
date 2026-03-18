# Skill: install-tooling

Install a named MCP connector or desktop software tool on-demand. Looks up the tool in the agency catalog, fetches the latest official installation instructions, presents a user confirmation gate, and only installs on explicit approval. Never installs anything silently.

---

## When to Use

Invoke when:
- A user or agent requests installation of a specific MCP connector (ClickUp, Linear, GitHub, Figma, Pencil.dev, Refero.design, Maestro, Playwright)
- A user or agent requests installation of a desktop software tool (Laravel Herd, Fork, Orbstack, Beekeeper Studio)
- Setting up the agency workspace for a new project that requires specific integrations

**Do NOT invoke if:**
- No tool name has been specified — ask the user which tool first
- The tool is already installed and configured — verify first, then skip
- The user said "install everything" — list all tools and ask which ones specifically

---

## Tool Catalog

### MCP Connectors

MCP connectors integrate into Claude Code via `~/.claude/settings.json` under the `mcpServers` key. Each entry requires the command, arguments, and any required environment variables.

---

#### ClickUp
**Purpose:** Project management — read/write tasks, lists, spaces, and docs from ClickUp workspaces directly in Claude.
**Install method:** npx (no global install needed)
**Config:**
```json
"clickup": {
  "command": "npx",
  "args": ["-y", "@anthropic-ai/mcp-server-clickup"],
  "env": {
    "CLICKUP_API_TOKEN": "<your-api-token>"
  }
}
```
**API token source:** ClickUp → Settings → Apps → API Token
**Official docs:** https://clickup.com/integrations/claude

---

#### Linear
**Purpose:** Issue tracking — read and create Linear issues, projects, and cycles from Claude.
**Install method:** npx
**Config:**
```json
"linear": {
  "command": "npx",
  "args": ["-y", "@linear/mcp-server"],
  "env": {
    "LINEAR_API_KEY": "<your-api-key>"
  }
}
```
**API key source:** Linear → Settings → API → Personal API Keys
**Official docs:** https://linear.app/docs/mcp

---

#### GitHub
**Purpose:** Repository access — read issues, PRs, code, commits, and manage GitHub resources from Claude.
**Install method:** npx
**Config:**
```json
"github": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"],
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "<your-pat>"
  }
}
```
**PAT source:** GitHub → Settings → Developer Settings → Personal Access Tokens → Fine-grained tokens
**Required scopes:** `repo`, `read:org` (add `issues:write`, `pull_requests:write` for write access)
**Official docs:** https://github.com/modelcontextprotocol/servers/tree/main/src/github

---

#### Figma
**Purpose:** Design access — read Figma files, components, frames, and styles to feed designs into Claude for review or code generation.
**Install method:** npx
**Config:**
```json
"figma": {
  "command": "npx",
  "args": ["-y", "figma-developer-mcp", "--figma-api-key", "<your-api-key>", "--stdio"],
  "env": {}
}
```
**API key source:** Figma → Account Settings → Security → Personal Access Tokens
**Official docs:** https://www.figma.com/developers/mcp

---

#### Pencil.dev
**Purpose:** AI design generation — generate and iterate UI wireframes and mockups within Claude sessions.
**Install method:** npx
**Config:**
```json
"pencil": {
  "command": "npx",
  "args": ["-y", "@pencilapp/mcp-server"],
  "env": {
    "PENCIL_API_KEY": "<your-api-key>"
  }
}
```
**API key source:** Pencil.dev → Settings → API Keys
**Official docs:** https://www.pencil.dev/mcp

---

#### Refero.design
**Purpose:** Design reference — access Refero's library of real-world UI design screenshots and patterns from Claude.
**Install method:** HTTP/SSE endpoint (no local process needed)
**Config:**
```json
"refero": {
  "type": "sse",
  "url": "https://refero.design/mcp",
  "headers": {
    "Authorization": "Bearer <your-api-key>"
  }
}
```
**API key source:** https://refero.design → Account → API Access
**Official docs:** https://refero.design/mcp

---

#### Maestro
**Purpose:** Mobile testing — run Maestro mobile UI tests and flows from Claude sessions, useful for QA automation.
**Install method:** npx
**Config:**
```json
"maestro": {
  "command": "npx",
  "args": ["-y", "@mobile-dev-inc/maestro-mcp"],
  "env": {
    "MAESTRO_CLOUD_API_KEY": "<your-api-key>"
  }
}
```
**API key source:** Maestro Cloud → Account Settings → API Keys
**Official docs:** https://docs.maestro.mobile.dev/cloud/mcp

---

#### Playwright
**Purpose:** Browser automation — control real browsers from Claude for testing, scraping, and UI verification.
**Install method:** npx
**Config:**
```json
"playwright": {
  "command": "npx",
  "args": ["@playwright/mcp@latest"],
  "env": {}
}
```
**No API key required.**
**Official docs:** https://playwright.dev/docs/mcp

---

### Desktop Software

Desktop software is installed via Homebrew (macOS), package manager, or direct download. These are not MCP servers — they are standalone applications.

---

#### Laravel Herd
**Purpose:** Local PHP/Laravel development environment. Manages PHP versions, sites, databases, and SSL locally with zero config.
**Platform:** macOS only
**Install method:**
```bash
# Option A — Homebrew
brew install --cask herd

# Option B — Direct download
# https://herd.laravel.com → Download for macOS
```
**Post-install:** Launch Herd from Applications. Sites auto-served at `*.test`.
**Official site:** https://herd.laravel.com

---

#### Fork
**Purpose:** Visual Git client for macOS and Windows. Simplifies branch management, diffs, stash, and rebase workflows.
**Platform:** macOS, Windows
**Install method:**
```bash
# macOS — Homebrew
brew install --cask fork

# Windows — winget
winget install Fork.Fork

# Direct download
# https://git-fork.com → Download
```
**Official site:** https://git-fork.com

---

#### OrbStack
**Purpose:** Fast, lightweight Docker Desktop replacement for macOS. Runs containers and Linux VMs with minimal resource usage.
**Platform:** macOS only
**Install method:**
```bash
# Option A — Homebrew
brew install --cask orbstack

# Option B — Direct download
# https://orbstack.dev → Download for macOS
```
**Post-install:** Launch OrbStack; it replaces Docker Desktop as the container runtime.
**Official site:** https://orbstack.dev

---

#### Beekeeper Studio
**Purpose:** Cross-platform SQL database GUI. Connects to PostgreSQL, MySQL, SQLite, MariaDB, SQL Server, and more.
**Platform:** macOS, Windows, Linux
**Install method:**
```bash
# macOS — Homebrew
brew install --cask beekeeper-studio

# Linux — Snap
sudo snap install beekeeper-studio

# Direct download
# https://www.beekeeperstudio.io → Download
```
**Official site:** https://www.beekeeperstudio.io

---

## Steps

### Step 1 — Identify the Requested Tool

Parse the request and extract:
- Tool name(s) to install
- Type: MCP connector or desktop software
- Any API keys or credentials the user has already provided

If multiple tools were requested, handle each one sequentially — one confirmation per tool.

If the tool name does not match any catalog entry above, output:
```
⚠️ Tool not in catalog: <name>

Known MCP connectors:  ClickUp, Linear, GitHub, Figma, Pencil.dev, Refero.design, Maestro, Playwright
Known desktop software: Laravel Herd, Fork, OrbStack, Beekeeper Studio

Please specify one of the above, or provide an official install URL for an unlisted tool.
```

---

### Step 2 — Check If Already Installed

**For MCP connectors:**
Read `~/.claude/settings.json`. If a matching entry already exists under `mcpServers`, output:
```
ℹ️ <tool> MCP is already configured in ~/.claude/settings.json.
   Key: mcpServers.<key>
   Command: <command>

No action taken. To reconfigure, remove the existing entry first.
```
Stop and report to the user.

**For desktop software:**
```bash
# macOS
which <tool-binary> 2>/dev/null || brew list --cask <cask-name> 2>/dev/null

# Linux
which <tool-binary> 2>/dev/null || snap list <package> 2>/dev/null
```
If already installed, report and stop.

---

### Step 3 — Detect Operating System

```bash
uname -s
```

| Output | OS |
|--------|----|
| `Darwin` | macOS |
| `Linux` | Linux |
| `MINGW*` / `CYGWIN*` | Windows |

If a tool is macOS-only and the OS is Linux or Windows, report:
```
⚠️ <tool> is only available on macOS.
   Current OS: <detected OS>
   Cannot install on this platform.
```

---

### Step 4 — Fetch Latest Install Instructions (MCP connectors only)

For MCP connectors, use WebFetch to verify the current install instructions from the official documentation URL listed in the catalog. Compare against the catalog entry. If the fetch reveals a different package name or configuration format, use the fetched version and note the discrepancy.

If the fetch fails (network error or page unavailable), proceed with the catalog entry and note:
```
⚠️ Could not fetch latest install docs for <tool>. Using catalog entry (may not be current).
```

---

### Step 5 — Collect Required Credentials

**For MCP connectors that require API keys:**

Ask the user for the required credential:

```
To configure <tool> MCP, I need your API key/token.

Where to get it: <source from catalog>
Docs: <official docs URL>

Please provide your <TOOL_API_KEY>:
```

**Wait for user input before proceeding.**

If the user cannot provide credentials now:
```
⚠️ Installation paused — API key required.

You can resume this installation once you have the key from:
<source URL>
```
Stop. Do not proceed without the credential.

**For tools with no required credentials (Playwright, OrbStack, Fork):** skip this step.

---

### Step 6 — Confirmation Gate

Present a clear summary of exactly what will happen, then **wait for explicit approval**:

```
---
## Install Confirmation Required: <Tool Name>

**Type:** <MCP Connector | Desktop Software>
**Platform:** <macOS | Linux | Windows>

### What will be installed
<Description of the tool and what it does>

### Exact actions to be taken
<For MCP connectors:>
  1. Read ~/.claude/settings.json
  2. Add the following entry under "mcpServers":
     <show the exact JSON block>
  3. Write the updated settings.json
  4. Restart Claude Code required to activate the MCP

<For desktop software:>
  1. Run: <exact command>
  2. <Any post-install steps>

### Files that will be modified
  - ~/.claude/settings.json   (MCP connectors only)

### Files that will NOT be modified
  - No project files will be changed
  - No other settings will be altered

### Your credentials
  - <KEY_NAME>: <first 4 chars>...*** (stored only in settings.json, not logged anywhere else)

---
Please respond:
  INSTALL    — proceed with installation
  SKIP       — skip this tool, move to next
  ABORT      — cancel all remaining installations
```

**WAIT for explicit response. Do not execute any install commands until the user responds with INSTALL.**

---

### Step 7 — Execute Installation

On **INSTALL**:

**For MCP connectors:**

1. Read `~/.claude/settings.json` (or create with `{}` if absent).
2. Add the tool entry under `mcpServers` — preserve all existing entries.
3. Write the updated file.
4. Log:
   ```
   [<ISO-date>] [tooling-installer] MCP_INSTALLED: <tool> → ~/.claude/settings.json
   ```

**For desktop software (macOS + Homebrew):**
```bash
brew install --cask <cask-name>
```

**For desktop software (Linux):**
```bash
sudo snap install <package>   # or platform-appropriate method
```

Log:
```
[<ISO-date>] [tooling-installer] SOFTWARE_INSTALLED: <tool> via <method> on <OS>
```

On **SKIP:** move to the next tool in the queue without logging.

On **ABORT:** log `INSTALL_ABORTED` and stop all remaining installations.

---

### Step 8 — Verify Installation

**For MCP connectors:**
Read `~/.claude/settings.json`. Confirm the key exists under `mcpServers` and the JSON is valid.

**For desktop software:**
```bash
which <binary> || <tool> --version
```

On success:
```
✓ <Tool> installed successfully.
  <MCP: Key added to ~/.claude/settings.json under mcpServers.<key>>
  <Software: Binary available at <path>>
  <If restart needed:> ⚠️  Restart Claude Code to activate the MCP server.
```

On failure:
```
✗ Installation verification failed for <tool>.
  Expected: <what we checked>
  Found: <actual result>
  Suggested fix: <action>
```

---

### Step 9 — Summary Report

After all requested tools are processed, output a final summary:

```
## Installation Summary

| Tool | Type | Status | Note |
|------|------|--------|------|
| <name> | MCP | ✓ Installed | Restart Claude Code to activate |
| <name> | Software | ✓ Installed | |
| <name> | MCP | ⚠️ Skipped | Already installed |
| <name> | Software | ✗ Failed | See error above |

<If any MCPs were installed:>
⚠️  Restart Claude Code to activate newly added MCP servers.
```

Log the summary to `~/.agency/audit.log` if the file exists:
```
[<ISO-date>] [tooling-installer] INSTALL_SUMMARY: <n> installed, <n> skipped, <n> failed
```

---

## Security Rules

- **Never log API keys or tokens** to `audit.log` or anywhere else — only log that an install occurred
- **Never store credentials in project files** — only in `~/.claude/settings.json` (global, outside the repo)
- **Never auto-install** — every tool requires explicit INSTALL confirmation
- **Never modify any files** other than `~/.claude/settings.json` for MCP connectors
- **Never run `sudo`** commands without explicit user awareness; note when `sudo` is required
