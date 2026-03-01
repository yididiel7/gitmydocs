# 🤖 Copilot CLI Session

> **Session ID:** `e1ebe014-169b-4ade-9855-454c2df7019f`
> **Started:** 2/5/2026, 9:25:26 AM
> **Duration:** 51m 54s
> **Exported:** 2/5/2026, 10:17:21 AM

<sub>⏱️ 1s</sub>

### 👤 User

suggest How do i clear the GITHUB_TOKEN environment variable value from the environment?

---

<sub>⏱️ 7s</sub>

### 💬 Copilot

To clear the `GITHUB_TOKEN` environment variable, use one of these approaches:

**Option 1: Unset the variable (temporary - just this session)**
```bash
unset GITHUB_TOKEN
```

**Option 2: Set it to empty (temporary - just this session)**
```bash
export GITHUB_TOKEN=""
```

**Option 3: Remove from shell config (permanent)**
If it's defined in your shell config file (~/.bashrc, ~/.zshrc, ~/.bash_profile, etc.), remove or comment out the line that sets it:
```bash
# Remove or comment this line:
# export GITHUB_TOKEN="your_token_here"
```

Then reload the shell:
```bash
source ~/.bashrc  # or ~/.zshrc depending on your shell
```

**Option 4: Verify it's cleared**
```bash
echo $GITHUB_TOKEN  # Should output nothing
```

Which approach depends on whether you want to clear it just for the current session (Options 1-2) or permanently (Option 3).

---

<sub>⏱️ 1m 27s</sub>

### 👤 User

echo $GITHUB_TOKEN=""

---

<sub>⏱️ 1m 31s</sub>

### 💬 Copilot

That command won't actually clear the variable. It will:
1. Echo the current value of `GITHUB_TOKEN`
2. Try to set a variable with that value name to an empty string (which won't work as intended)

**To actually clear it, use:**

```bash
unset GITHUB_TOKEN
```

Or:

```bash
export GITHUB_TOKEN=""
```

**Then verify it's cleared:**

```bash
echo $GITHUB_TOKEN
# (should output nothing)
```

The `unset` command is the cleanest way to remove an environment variable entirely.

---

<sub>⏱️ 2m 48s</sub>

### 👤 User

How do i restart Copilot Cli

---

<sub>⏱️ 2m 53s</sub>

### ✅ `fetch_copilot_cli_documentation`

<details>
<summary>Arguments</summary>

```json
{}
```

</details>

<details>
<summary>151 lines</summary>

````
# GitHub Copilot CLI Documentation

## README
# GitHub Copilot CLI (Public Preview)

The power of GitHub Copilot, now in your terminal.

GitHub Copilot CLI brings AI-powered coding assistance directly to your command line, enabling you to build, debug, and understand code through natural language conversations. Powered by the same agentic harness as GitHub's Copilot coding agent, it provides intelligent assistance while staying deeply integrated with your GitHub workflow.

See [our official documentation](https://docs.github.com/copilot/concepts/agents/about-copilot-cli) for more information.

![Image of the splash screen for the Copilot CLI](https://github.com/user-attachments/assets/f40aa23d-09dd-499e-9457-1d57d3368887)


## 🚀 Introduction and Overview

We're bringing the power of GitHub Copilot coding agent directly to your terminal. With GitHub Copilot CLI, you can work locally and synchronously with an AI agent that understands your code and GitHub context.

- **Terminal-native development:** Work with Copilot coding agent directly in your command line — no context switching required.
- **GitHub integration out of the box:** Access your repositories, issues, and pull requests using natural language, all authenticated with your existing GitHub account.
- **Agentic capabilities:** Build, edit, debug, and refactor code with an AI collaborator that can plan and execute complex tasks.
- **MCP-powered extensibility:** Take advantage of the fact that the coding agent ships with GitHub's MCP server by default and supports custom MCP servers to extend capabilities.
- **Full control:** Preview every action before execution — nothing happens without your explicit approval.

We're still early in our journey, but with your feedback, we're rapidly iterating to make the GitHub Copilot CLI the best possible companion in your terminal.

## 📦 Getting Started

### Supported Platforms

- **Linux**
- **macOS**
- **Windows**

### Prerequisites

- (On Windows) **PowerShell** v6 or higher
- An **active Copilot subscription**. See [Copilot plans](https://github.com/features/copilot/plans?ref_cta=Copilot+plans+signup&ref_loc=install-copilot-cli&ref_page=docs).

If you have access to GitHub Copilot via your organization or enterprise, you cannot use GitHub Copilot CLI if your organization owner or enterprise administrator has disabled it in the organization or enterprise settings. See [Managing policies and features for GitHub Copilot in your organization](http://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-github-copilot-features-in-your-organization/managing-policies-for-copilot-in-your-organization) for more information.

### Installation

Install with [WinGet](https://github.com/microsoft/winget-cli) (Windows):

```bash
winget install GitHub.Copilot
```

```bash
winget install GitHub.Copilot.Prerelease
```

Install with [Homebrew](https://formulae.brew.sh/cask/copilot-cli) (macOS and Linux):

```bash
brew install copilot-cli
```

```bash
brew install copilot-cli@prerelease
```

Install with [npm](https://www.npmjs.com/package/@github/copilot) (macOS, Linux, and Windows):

```bash
npm install -g @github/copilot
```

```bash
npm install -g @github/copilot@prerelease
```

Install with the install script (macOS and Linux):

```bash
curl -fsSL https://gh.io/copilot-install | bash
```

Or

```bash
wget -qO- https://gh.io/copilot-install | bash
```

Use `| sudo bash` to run as root and install to `/usr/local/bin`.

Set `PREFIX` to install to `$PREFIX/bin/` directory. Defaults to `/usr/local`
when run as root or `$HOME/.local` when run as a non-root user.

Set `VERSION` to install a specific version. Defaults to the latest version.

For example, to install version `v0.0.369` to a custom directory:

```bash
curl -fsSL https://gh.io/copilot-install | VERSION="v0.0.369" PREFIX="$HOME/custom" bash
```

### Launching the CLI

```bash
copilot
```

On first launch, you'll be greeted with our adorable animated banner! If you'd like to see this banner again, launch `copilot` with the `--banner` flag.

If you're not currently logged in to GitHub, you'll be prompted to use the `/login` slash command. Enter this command and follow the on-screen instructions to authenticate.

#### Authenticate with a Personal Access Token (PAT)

You can also authenticate using a fine-grained PAT with the "Copilot Requests" permission enabled.

1. Visit https://github.com/settings/personal-access-tokens/new
2. Under "Permissions," click "add permissions" and select "Copilot Requests"
3. Generate your token
4. Add the token to your environment via the environment variable `GH_TOKEN` or `GITHUB_TOKEN` (in order of precedence)

### Using the CLI

Launch `copilot` in a folder that contains code you want to work with.

By default, `copilot` utilizes Claude Sonnet 4.5. Run the `/model` slash command to choose from other available models, including Claude Sonnet 4 and GPT-5.

Each time you submit a prompt to GitHub Copilot CLI, your monthly quota of premium requests is reduced by one. For information about premium requests, see [About premium requests](https://docs.github.com/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests).

For more information about how to use the GitHub Copilot CLI, see [our official documentation](https://docs.github.com/copilot/concepts/agents/about-copilot-cli).

## 📢 Feedback and Participation

We're excited to have you join us early in the Copilot CLI journey.

This is an early-stage preview, and we're building quickly. Expect frequent updates--please keep your client up to date for the latest features and fixes!

Your insights are invaluable! Open issue in this repo, join Discussions, and run `/feedback` from the CLI to submit a confidential feedback survey!


## Help Command Output
Global shortcuts
  @ - mention files, include contents in context
  ctrl+x → / - run command (press ctrl+x, then /)
  Esc - cancel the current operation
  ! - execute command in your local shell (bypass Copilot)
  ctrl+c - cancel operation / clear input / exit
  ctrl+d - shutdown
  ctrl+l - clear the screen

Timeline shortcuts
  ctrl+o - expand recent timeline (when no input)
  ctrl+e - expand all timeline (when no input)

Motion shortcuts
  ctrl+a - move to beginning of line (when typing)
  ctrl+e - move to end of line (when typing)
  ctrl+h - delete previous character
  ctrl+w - delete previous word
  ctrl+u - delete from cursor to beginning of line
  ctrl+k - delete from cursor to end of line
  meta+←/→ - move cursor by word
  ↑ / ↓ - navigate command history

Available commands
  /add-dir <directory> - Add a directory to the allowed list for file access
  /agent - Browse and select from available agents (if any)
  /allow-all, /yolo - Enable all permissions (tools, paths, and URLs)
  /clear, /new - Clear the conversation history
  /compact - Summarize conversation history to reduce context window usage
  /context - Show context window token usage and visualization
  /cwd, /cd [directory] - Change working directory or show current directory
  /diff - Review the changes made in the current directory
  /exit, /quit - Exit the CLI
  /experimental [on|off] - Toggle or set experimental features
  /share [file|gist] [path] - Share session to markdown file or GitHub gist
  /feedback - Provide feedback about the CLI
  /help - Show help for interactive commands
  /init - Initialize Copilot instructions and agentic features for this repository
  /list-dirs - Display all allowed directories for file access
  /login - Log in to Copilot
  /logout - Log out of Copilot
  /mcp [show|add|edit|delete|disable|enable] [server-name] - Manage MCP server configuration
  /model, /models [model] - Select AI model to use
  /plan [prompt] - Create an implementation plan before coding
  /plugin [marketplace|install|uninstall|update|list] [args...] - Manage plugins and plugin marketplaces
  /rename <name> - Rename the current session (alias for /session rename)
  /reset-allowed-tools - Reset the list of allowed tools
  /resume [sessionId] - Switch to a different session (optionally specify session ID)
  /review [prompt] - Run code review agent to analyze changes
  /session [checkpoints [n]|files|plan|rename <name>] - Show session info and workspace summary. Use subcommands for details.
  /skills [list|info|add|remove|reload] [args...] - Manage skills for enhanced capabilities
  /terminal-setup - Configure terminal for multiline input support (shift+enter and ctrl+enter)
  /theme [show|set|list] [auto|<theme-id>] - View or configure terminal theme
  /usage - Display session usage metrics and statistics
  /user [show|list|switch] - Manage GitHub user list

Copilot respects instructions from these locations:
  CLAUDE.md
  GEMINI.md
  AGENTS.md (in git root & cwd)
  .github/instructions/**/*.instructions.md (in git root & cwd)
  .github/copilot-instructions.md
  $HOME/.copilot/copilot-instructions.md
  COPILOT_CUSTOM_INSTRUCTIONS_DIRS (additional directories via env var)

To learn about what I can do
  Ask me: "What can you do?"
  Or visit: https://docs.github.com/en/copilot/how-tos/use-copilot-agents/use-copilot-cli

---

**Note**: If the above documentation doesn't answer the user's request, you can fetch additional documentation from the official GitHub Docs for more information.

Use the web_fetch tool to fetch https://docs.github.com/api/article/body?pathname=/en/copilot/how-tos/use-copilot-agents/use-copilot-cli

You can also follow hyperlinks to related docs pages using the same API pattern.
````

</details>


---

<sub>⏱️ 2m 58s</sub>

### 💬 Copilot

Based on the documentation, here are the ways to restart or exit/restart the Copilot CLI:

**Exit and restart the CLI:**
```bash
copilot
```
Then inside the CLI, use one of these commands:
- `/exit` or `/quit` - Exit the CLI
- `ctrl+d` - Shutdown (keyboard shortcut)

**To restart in a fresh state:**
1. Exit with `/exit` or `ctrl+d`
2. Run `copilot` again to launch a new session

**To clear conversation history and start fresh (without exiting):**
```
/clear
```
or
```
/new
```

**For additional context:**
- `ctrl+l` clears the screen without exiting
- `/session` shows session info and workspace summary

The simplest approach is just `ctrl+d` to exit, then run `copilot` again to restart fresh.

---

<sub>⏱️ 3m 49s</sub>

### 👤 User

How do i restart after exiting Copilot CLI?

---

<sub>⏱️ 3m 53s</sub>

### 💬 Copilot

Simply run:

```bash
copilot
```

This will launch a new Copilot CLI session. You'll be back in the interactive CLI environment where you can start entering prompts and commands.

---

<sub>⏱️ 11m 50s</sub>

### ℹ️ Info

MCP configuration saved successfully! Changes will take effect immediately.

---

<sub>⏱️ 14m 50s</sub>

### 👤 User

claude-haiku-4.5

---

<sub>⏱️ 14m 56s</sub>

### 💬 Copilot

Are you trying to switch to the **Claude Haiku 4.5** model in Copilot CLI?

If so, inside the CLI, run:

```
/model claude-haiku-4.5
```

Or simply:

```
/model
```

This will show all available models and let you select one.

**Note:** By default, Copilot CLI uses Claude Sonnet 4.5. Claude Haiku 4.5 is a lighter, faster model option that may be useful for simpler tasks.

---

<sub>⏱️ 17m 21s</sub>

### 👤 User

What's the default model and can I use a local Ollama model?/

---

<sub>⏱️ 17m 28s</sub>

### 💬 Copilot

**Default Model:**
By default, Copilot CLI uses **Claude Sonnet 4.5**.

**Regarding Ollama:**
The documentation doesn't explicitly mention native Ollama support. However, Copilot CLI has **MCP (Model Context Protocol) server support** that could potentially allow integration with local models through custom MCP servers.

You can manage MCP servers with:
```
/mcp [show|add|edit|delete|disable|enable] [server-name]
```

For Ollama specifically, you'd need to:
1. Check if there's an existing MCP server wrapper for Ollama
2. Configure it via the `/mcp` command

Available models you can switch to:
```
/model
```

This shows the officially supported models (Claude Sonnet 4.5, Claude Sonnet 4, GPT-5, etc.).

For the latest on Ollama/local model support, check the [official Copilot CLI documentation](https://docs.github.com/copilot/concepts/agents/about-copilot-cli) or see if there are community MCP servers for Ollama integration.

---

<sub>⏱️ 18m 3s</sub>

### 👤 User

Can you Check if there's an existing MCP server wrapper for Ollama and Configure it via the /mcp command

---

<sub>⏱️ 18m 9s</sub>

### 💬 Copilot

I can help you find and configure an Ollama MCP server. Let me search for existing wrappers:

---

<sub>⏱️ 18m 27s</sub>

### ✅ `bash`

**Search for MCP server wrappers for Ollama**

$ curl -s https://api.github.com/search/repositories?q=mcp+ollama+server&sort=stars | jq '.items[] | {name, url: .html_url, description}' | head -30

```
[1] 531084
<exited with exit code 0>
```


---

<sub>⏱️ 18m 20s</sub>

### ✅ `web_fetch`

<details>
<summary>Arguments</summary>

```json
{
  "url": "https://github.com/modelcontextprotocol/servers",
  "max_length": 5000
}
```

</details>

<details>
<summary>45 lines</summary>

```
Contents of https://github.com/modelcontextprotocol/servers:
## Model Context Protocol servers

[](#model-context-protocol-servers)

This repository is a collection of _reference implementations_ for the [Model Context Protocol](https://modelcontextprotocol.io/) (MCP), as well as references to community-built servers and additional resources.

Important

If you are looking for a list of MCP servers, you can browse published servers on [the MCP Registry](https://registry.modelcontextprotocol.io/). The repository served by this README is dedicated to housing just the small number of reference servers maintained by the MCP steering group.

Warning

The servers in this repository are intended as **reference implementations** to demonstrate MCP features and SDK usage. They are meant to serve as educational examples for developers building their own MCP servers, not as production-ready solutions. Developers should evaluate their own security requirements and implement appropriate safeguards based on their specific threat model and use case.

The servers in this repository showcase the versatility and extensibility of MCP, demonstrating how it can be used to give Large Language Models (LLMs) secure, controlled access to tools and data sources. Typically, each MCP server is implemented with an MCP SDK:

*   [C# MCP SDK](https://github.com/modelcontextprotocol/csharp-sdk)
*   [Go MCP SDK](https://github.com/modelcontextprotocol/go-sdk)
*   [Java MCP SDK](https://github.com/modelcontextprotocol/java-sdk)
*   [Kotlin MCP SDK](https://github.com/modelcontextprotocol/kotlin-sdk)
*   [PHP MCP SDK](https://github.com/modelcontextprotocol/php-sdk)
*   [Python MCP SDK](https://github.com/modelcontextprotocol/python-sdk)
*   [Ruby MCP SDK](https://github.com/modelcontextprotocol/ruby-sdk)
*   [Rust MCP SDK](https://github.com/modelcontextprotocol/rust-sdk)
*   [Swift MCP SDK](https://github.com/modelcontextprotocol/swift-sdk)
*   [TypeScript MCP SDK](https://github.com/modelcontextprotocol/typescript-sdk)

## 🌟 Reference Servers

[](#-reference-servers)

These servers aim to demonstrate MCP features and the official SDKs.

*   **[Everything](/modelcontextprotocol/servers/blob/main/src/everything)** - Reference / test server with prompts, resources, and tools.
*   **[Fetch](/modelcontextprotocol/servers/blob/main/src/fetch)** - Web content fetching and conversion for efficient LLM usage.
*   **[Filesystem](/modelcontextprotocol/servers/blob/main/src/filesystem)** - Secure file operations with configurable access controls.
*   **[Git](/modelcontextprotocol/servers/blob/main/src/git)** - Tools to read, search, and manipulate Git repositories.
*   **[Memory](/modelcontextprotocol/servers/blob/main/src/memory)** - Knowledge graph-based persistent memory system.
*   **[Sequential Thinking](/modelcontextprotocol/servers/blob/main/src/sequentialthinking)** - Dynamic and reflective problem-solving through thought sequences.
*   **[Time](/modelcontextprotocol/servers/blob/main/src/time)** - Time and timezone conversion capabilities.

### Archived

[](#archived)

The following reference servers are now archived and can be found at [servers-archived](https://github.com/modelcontextprotocol/servers-archived).

*   **[AWS KB Retrieval](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/aws-kb-retrieval-server)** - Retrieval from AWS Knowledge Base using Bedrock Agent Runtime.
*   **[Brave Search](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/brave-search)** - Web and local search using Brave's Search API. Has been replaced by the [official server](https://github.com/brave/brave-search-mcp-server).
*   **[EverArt](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/everart)** - AI image generation using various models.
*   **[GitHub](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/github)** - Repository management, file operations, and GitHub API integration.
*   **[GitLab](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/gitlab)** - GitLab API, enabling project management.
*   **[Google Drive](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/gdrive)** - File access and search capabilities for Google Drive.
*   **[Google Maps](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/google-maps)** - Location services, directions, and place details.
*   **[PostgreSQL](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/postgres)** - Read-only database access with schema inspection.
*   **[Puppeteer](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/puppeteer)** - Browser automation and web scraping.
*   **[Redis](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/redis)** - Interact with Redis key-value stores.
*   **[Sentry](https://github.com/modelcontextprotocol/servers-archived/tree/main/src/sentry)** - Retrieving and analyzing issues from Sentry.io.
*   **[Slack](https://github.com/modelcontex

<note>Content truncated. Call the fetch tool with a start_index of 5000 to get more content.</note>
```

</details>


---

<sub>⏱️ 18m 30s</sub>

### 💬 Copilot

Let me search the MCP Registry specifically for Ollama:

---

<sub>⏱️ 18m 38s</sub>

### ✅ `web_fetch`

<details>
<summary>Arguments</summary>

```json
{
  "max_length": 10000,
  "url": "https://registry.modelcontextprotocol.io/"
}
```

</details>

```
Contents of https://registry.modelcontextprotocol.io/:
### API Base URL

Production (registry.modelcontextprotocol.io) Staging (staging.registry.modelcontextprotocol.io) Local (localhost:8080) Custom
```


---

<sub>⏱️ 18m 42s</sub>

### 💬 Copilot

Let me search GitHub for Ollama MCP servers:

---

<sub>⏱️ 18m 49s</sub>

### ✅ `bash`

**Search for Ollama MCP servers on GitHub**

$ curl -s "https://api.github.com/search/repositories?q=ollama+mcp+server&per_page=10" | jq '.items[] | {name, url: .html_url, stars: .stargazers_count, description}' 2>/dev/null

<details>
<summary>61 lines</summary>

```
{
  "name": "pal-mcp-server",
  "url": "https://github.com/BeehiveInnovations/pal-mcp-server",
  "stars": 11005,
  "description": "The power of Claude Code / GeminiCLI / CodexCLI + [Gemini / OpenAI / OpenRouter / Azure / Grok / Ollama / Custom Model / All Of The Above] working as one."
}
{
  "name": "ollama-mcp-bridge",
  "url": "https://github.com/patruff/ollama-mcp-bridge",
  "stars": 962,
  "description": "Bridge between Ollama and MCP servers, enabling local LLMs to use Model Context Protocol tools"
}
{
  "name": "mcp-client-for-ollama",
  "url": "https://github.com/jonigl/mcp-client-for-ollama",
  "stars": 524,
  "description": "A text-based user interface (TUI) client for interacting with MCP servers using Ollama. Features include agent mode, multi-server, model switching, streaming responses, tool management, human-in-the-loop, thinking mode, model params config, MCP prompts, custom system prompt and saved preferences. Built for developers working with local LLMs."
}
{
  "name": "deep-research",
  "url": "https://github.com/u14app/deep-research",
  "stars": 4373,
  "description": "Use any LLMs (Large Language Models) for Deep Research. Support SSE API and MCP server."
}
{
  "name": "ollama-mcp",
  "url": "https://github.com/rawveg/ollama-mcp",
  "stars": 133,
  "description": "An MCP Server for Ollama"
}
{
  "name": "mcp-server",
  "url": "https://github.com/strands-agents/mcp-server",
  "stars": 256,
  "description": "This MCP server provides documentation about Strands Agents to your GenAI tools, so you can use your favorite AI coding assistant to vibe-code Strands Agents."
}
{
  "name": "burp-mcp-agents",
  "url": "https://github.com/six2dez/burp-mcp-agents",
  "stars": 177,
  "description": "Practical setup guides and helpers to connect Burp Suite MCP Server to multiple AI backends (Codex, Gemini, Ollama, ...)."
}
{
  "name": "ollama-mcp-bridge",
  "url": "https://github.com/jonigl/ollama-mcp-bridge",
  "stars": 56,
  "description": "Extend the Ollama API with dynamic AI tool integration from multiple MCP (Model Context Protocol) servers. Fully compatible, transparent, and developer-friendly, ideal for building powerful local LLM applications, AI agents, and custom chatbots"
}
{
  "name": "just-prompt",
  "url": "https://github.com/disler/just-prompt",
  "stars": 705,
  "description": "just-prompt is an MCP server that provides a unified interface to top LLM providers (OpenAI, Anthropic, Google Gemini, Groq, DeepSeek, and Ollama)"
}
{
  "name": "mcp-ollama-agent",
  "url": "https://github.com/ausboss/mcp-ollama-agent",
  "stars": 27,
  "description": "A TypeScript example showcasing the integration of Ollama with the Model Context Protocol (MCP) servers. This project provides an interactive command-line interface for an AI agent that can utilize the tools from multiple MCP Servers.."
}
<exited with exit code 0>
```

</details>


---

<sub>⏱️ 18m 55s</sub>

### 💬 Copilot

Great! I found several options. Here are the best Ollama MCP servers:

**Top Options:**

1. **ollama-mcp** (133 stars)
   - Direct MCP Server for Ollama
   - GitHub: https://github.com/rawveg/ollama-mcp

2. **ollama-mcp-bridge** (962 stars)
   - Bridge between Ollama and MCP servers
   - GitHub: https://github.com/patruff/ollama-mcp-bridge

3. **pal-mcp-server** (11K stars)
   - Supports Ollama + many other providers
   - GitHub: https://github.com/BeehiveInnovations/pal-mcp-server

**To Configure in Copilot CLI:**

Once you install one, inside the Copilot CLI session, run:

```
/mcp add ollama-mcp
```

Then configure it with:

```
/mcp edit ollama-mcp
```

Or view existing MCP servers:

```
/mcp show
```

**Quick Setup:**
You'd need to:
1. Clone or install one of these MCP servers
2. Run it locally (usually on localhost:3000 or similar)
3. Add it to Copilot CLI via `/mcp add` with the server URL

Check the repository README for specific installation and configuration instructions. The **ollama-mcp** or **ollama-mcp-bridge** are probably the simplest for direct Ollama integration.

---

<sub>⏱️ 23m 54s</sub>

### 👤 User

Show me how to use Copilot Cli on my Arch-Linux PC Explain the Basics and Advanced Options available to me?

---

<sub>⏱️ 23m 58s</sub>

### ✅ `fetch_copilot_cli_documentation`

<details>
<summary>Arguments</summary>

```json
{}
```

</details>

<details>
<summary>191 lines</summary>

````
# GitHub Copilot CLI Documentation

## README
# GitHub Copilot CLI (Public Preview)

The power of GitHub Copilot, now in your terminal.

GitHub Copilot CLI brings AI-powered coding assistance directly to your command line, enabling you to build, debug, and understand code through natural language conversations. Powered by the same agentic harness as GitHub's Copilot coding agent, it provides intelligent assistance while staying deeply integrated with your GitHub workflow.

See [our official documentation](https://docs.github.com/copilot/concepts/agents/about-copilot-cli) for more information.

![Image of the splash screen for the Copilot CLI](https://github.com/user-attachments/assets/f40aa23d-09dd-499e-9457-1d57d3368887)


## 🚀 Introduction and Overview

We're bringing the power of GitHub Copilot coding agent directly to your terminal. With GitHub Copilot CLI, you can work locally and synchronously with an AI agent that understands your code and GitHub context.

- **Terminal-native development:** Work with Copilot coding agent directly in your command line — no context switching required.
- **GitHub integration out of the box:** Access your repositories, issues, and pull requests using natural language, all authenticated with your existing GitHub account.
- **Agentic capabilities:** Build, edit, debug, and refactor code with an AI collaborator that can plan and execute complex tasks.
- **MCP-powered extensibility:** Take advantage of the fact that the coding agent ships with GitHub's MCP server by default and supports custom MCP servers to extend capabilities.
- **Full control:** Preview every action before execution — nothing happens without your explicit approval.

We're still early in our journey, but with your feedback, we're rapidly iterating to make the GitHub Copilot CLI the best possible companion in your terminal.

## 📦 Getting Started

### Supported Platforms

- **Linux**
- **macOS**
- **Windows**

### Prerequisites

- (On Windows) **PowerShell** v6 or higher
- An **active Copilot subscription**. See [Copilot plans](https://github.com/features/copilot/plans?ref_cta=Copilot+plans+signup&ref_loc=install-copilot-cli&ref_page=docs).

If you have access to GitHub Copilot via your organization or enterprise, you cannot use GitHub Copilot CLI if your organization owner or enterprise administrator has disabled it in the organization or enterprise settings. See [Managing policies and features for GitHub Copilot in your organization](http://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-github-copilot-features-in-your-organization/managing-policies-for-copilot-in-your-organization) for more information.

### Installation

Install with [WinGet](https://github.com/microsoft/winget-cli) (Windows):

```bash
winget install GitHub.Copilot
```

```bash
winget install GitHub.Copilot.Prerelease
```

Install with [Homebrew](https://formulae.brew.sh/cask/copilot-cli) (macOS and Linux):

```bash
brew install copilot-cli
```

```bash
brew install copilot-cli@prerelease
```

Install with [npm](https://www.npmjs.com/package/@github/copilot) (macOS, Linux, and Windows):

```bash
npm install -g @github/copilot
```

```bash
npm install -g @github/copilot@prerelease
```

Install with the install script (macOS and Linux):

```bash
curl -fsSL https://gh.io/copilot-install | bash
```

Or

```bash
wget -qO- https://gh.io/copilot-install | bash
```

Use `| sudo bash` to run as root and install to `/usr/local/bin`.

Set `PREFIX` to install to `$PREFIX/bin/` directory. Defaults to `/usr/local`
when run as root or `$HOME/.local` when run as a non-root user.

Set `VERSION` to install a specific version. Defaults to the latest version.

For example, to install version `v0.0.369` to a custom directory:

```bash
curl -fsSL https://gh.io/copilot-install | VERSION="v0.0.369" PREFIX="$HOME/custom" bash
```

### Launching the CLI

```bash
copilot
```

On first launch, you'll be greeted with our adorable animated banner! If you'd like to see this banner again, launch `copilot` with the `--banner` flag.

If you're not currently logged in to GitHub, you'll be prompted to use the `/login` slash command. Enter this command and follow the on-screen instructions to authenticate.

#### Authenticate with a Personal Access Token (PAT)

You can also authenticate using a fine-grained PAT with the "Copilot Requests" permission enabled.

1. Visit https://github.com/settings/personal-access-tokens/new
2. Under "Permissions," click "add permissions" and select "Copilot Requests"
3. Generate your token
4. Add the token to your environment via the environment variable `GH_TOKEN` or `GITHUB_TOKEN` (in order of precedence)

### Using the CLI

Launch `copilot` in a folder that contains code you want to work with.

By default, `copilot` utilizes Claude Sonnet 4.5. Run the `/model` slash command to choose from other available models, including Claude Sonnet 4 and GPT-5.

### Experimental Mode

Experimental mode enables access to new features that are still in development. You can activate experimental mode by:

- Launching with the `--experimental` flag: `copilot --experimental`
- Using the `/experimental` slash command from within the CLI

Once activated, the setting is persisted in your config, so the `--experimental` flag is no longer needed on subsequent launches.

#### Experimental Features

- **Autopilot mode:** Autopilot is a new mode (press `Shift+Tab` to cycle through modes), which encourages the agent to continue working until a task is completed.

Each time you submit a prompt to GitHub Copilot CLI, your monthly quota of premium requests is reduced by one. For information about premium requests, see [About premium requests](https://docs.github.com/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests).

For more information about how to use the GitHub Copilot CLI, see [our official documentation](https://docs.github.com/copilot/concepts/agents/about-copilot-cli).

## 🔧 Configuring LSP Servers

GitHub Copilot CLI supports Language Server Protocol (LSP) for enhanced code intelligence. This feature provides intelligent code features like go-to-definition, hover information, and diagnostics.

### Installing Language Servers

Copilot CLI does not bundle LSP servers. You need to install them separately. For example, to set up TypeScript support:

```bash
npm install -g typescript-language-server
```

For other languages, install the corresponding LSP server and configure it following the same pattern shown below.

### Configuring LSP Servers

LSP servers are configured through a dedicated LSP configuration file. You can configure LSP servers at the user level or repository level:

**User-level configuration** (applies to all projects):
Edit `~/.copilot/lsp-config.json`

**Repository-level configuration** (applies to specific project):
Create `.github/lsp.json` in your repository root

Example configuration:

```json
{
  "lspServers": {
    "typescript": {
      "command": "typescript-language-server",
      "args": ["--stdio"],
      "fileExtensions": {
        ".ts": "typescript",
        ".tsx": "typescript"
      }
    }
  }
}
```

### Viewing LSP Server Status

Check configured LSP servers using the `/lsp` command in an interactive session, or view your configuration files directly.

For more information, see the [changelog](./changelog.md).

## 📢 Feedback and Participation

We're excited to have you join us early in the Copilot CLI journey.

This is an early-stage preview, and we're building quickly. Expect frequent updates--please keep your client up to date for the latest features and fixes!

Your insights are invaluable! Open issue in this repo, join Discussions, and run `/feedback` from the CLI to submit a confidential feedback survey!


## Help Command Output
Global shortcuts
  @ - mention files, include contents in context
  ctrl+x → / - run command (press ctrl+x, then /)
  Esc - cancel the current operation
  ! - execute command in your local shell (bypass Copilot)
  ctrl+c - cancel operation / clear input / exit
  ctrl+d - shutdown
  ctrl+l - clear the screen

Timeline shortcuts
  ctrl+o - expand recent timeline (when no input)
  ctrl+e - expand all timeline (when no input)
  ctrl+t - toggle model reasoning display

Motion shortcuts
  ctrl+a - move to beginning of line (when typing)
  ctrl+e - move to end of line (when typing)
  ctrl+h - delete previous character
  ctrl+w - delete previous word
  ctrl+u - delete from cursor to beginning of line
  ctrl+k - delete from cursor to end of line
  meta+←/→ - move cursor by word
  ↑ / ↓ - navigate command history

Available commands
  /add-dir <directory> - Add a directory to the allowed list for file access
  /agent - Browse and select from available agents (if any)
  /allow-all, /yolo - Enable all permissions (tools, paths, and URLs)
  /clear, /new - Clear the conversation history
  /compact - Summarize conversation history to reduce context window usage
  /context - Show context window token usage and visualization
  /cwd, /cd [directory] - Change working directory or show current directory
  /diff - Review the changes made in the current directory
  /exit, /quit - Exit the CLI
  /experimental [on|off] - Toggle or set experimental features
  /share [file|gist] [path] - Share session to markdown file or GitHub gist
  /feedback - Provide feedback about the CLI
  /help - Show help for interactive commands
  /init - Initialize Copilot instructions and agentic features for this repository
  /list-dirs - Display all allowed directories for file access
  /login - Log in to Copilot
  /logout - Log out of Copilot
  /mcp [show|add|edit|delete|disable|enable] [server-name] - Manage MCP server configuration
  /model, /models [model] - Select AI model to use
  /plan [prompt] - Create an implementation plan before coding
  /plugin [marketplace|install|uninstall|update|list] [args...] - Manage plugins and plugin marketplaces
  /rename <name> - Rename the current session (alias for /session rename)
  /reset-allowed-tools - Reset the list of allowed tools
  /resume [sessionId] - Switch to a different session (optionally specify session ID)
  /review [prompt] - Run code review agent to analyze changes
  /session [checkpoints [n]|files|plan|rename <name>] - Show session info and workspace summary. Use subcommands for details.
  /skills [list|info|add|remove|reload] [args...] - Manage skills for enhanced capabilities
  /terminal-setup - Configure terminal for multiline input support (shift+enter and ctrl+enter)
  /theme [show|set|list] [auto|<theme-id>] - View or configure terminal theme
  /usage - Display session usage metrics and statistics
  /user [show|list|switch] - Manage GitHub user list

Copilot respects instructions from these locations:
  CLAUDE.md
  GEMINI.md
  AGENTS.md (in git root & cwd)
  .github/instructions/**/*.instructions.md (in git root & cwd)
  .github/copilot-instructions.md
  $HOME/.copilot/copilot-instructions.md
  COPILOT_CUSTOM_INSTRUCTIONS_DIRS (additional directories via env var)

To learn about what I can do
  Ask me: "What can you do?"
  Or visit: https://docs.github.com/en/copilot/how-tos/use-copilot-agents/use-copilot-cli

---

**Note**: If the above documentation doesn't answer the user's request, you can fetch additional documentation from the official GitHub Docs for more information.

Use the web_fetch tool to fetch https://docs.github.com/api/article/body?pathname=/en/copilot/how-tos/use-copilot-agents/use-copilot-cli

You can also follow hyperlinks to related docs pages using the same API pattern.
````

</details>


---

<sub>⏱️ 24m 15s</sub>

### 💬 Copilot

# Copilot CLI Guide for Arch Linux

## **BASICS**

### 1. **Installation on Arch Linux**

**Option A: Using Homebrew**
```bash
brew install copilot-cli
```

**Option B: Using npm**
```bash
npm install -g @github/copilot
```

**Option C: Using install script (recommended)**
```bash
curl -fsSL https://gh.io/copilot-install | bash
```

Install to a custom location:
```bash
curl -fsSL https://gh.io/copilot-install | PREFIX="$HOME/.local" bash
```

### 2. **Launch Copilot CLI**
```bash
copilot
```

### 3. **Authentication**

**Option A: Interactive login**
```
/login
```
(Copilot will guide you through GitHub OAuth)

**Option B: Using Personal Access Token (PAT)**
1. Visit: https://github.com/settings/personal-access-tokens/new
2. Enable "Copilot Requests" permission
3. Set environment variable:
```bash
export GITHUB_TOKEN="your_token_here"
# or
export GH_TOKEN="your_token_here"
```

### 4. **Basic Workflow**

```bash
cd /path/to/your/project
copilot
# Type your prompt
# Example: "help me fix this bug in main.rs"
```

---

## **KEYBOARD SHORTCUTS (Essential)**

| Shortcut | Action |
|----------|--------|
| `Esc` | Cancel operation |
| `ctrl+c` | Clear input / exit |
| `ctrl+d` | Shutdown CLI |
| `ctrl+l` | Clear screen |
| `ctrl+a` / `ctrl+e` | Move to start/end of line |
| `ctrl+w` | Delete previous word |
| `ctrl+u` | Delete from cursor to beginning |
| `ctrl+k` | Delete from cursor to end |
| `↑` / `↓` | Navigate command history |
| `meta+←` / `meta+→` | Move cursor by word |
| `ctrl+o` | Expand recent timeline |
| `ctrl+e` | Expand all timeline |
| `Shift+Tab` | Cycle through modes (autopilot) |

---

## **ADVANCED OPTIONS & COMMANDS**

### **Model Selection**
```
/model
```
- **Default:** Claude Sonnet 4.5
- **Options:** Claude Sonnet 4, GPT-5, Claude Haiku 4.5
- Set specific model: `/model claude-haiku-4.5`

### **Planning & Agentic Tasks**
```
/plan "your task description"
```
Creates an implementation plan before coding.

```
/review "optional prompt"
```
Runs code review agent to analyze changes.

### **File & Directory Management**
```
/add-dir /path/to/directory
```
Add directory to allowed file access list.

```
/list-dirs
```
Show all allowed directories.

```
@ filename
```
Mention files and include their contents in context.

### **GitHub Integration**
```
/diff
```
Review changes made in current directory.

### **Session Management**
```
/session
```
Show session info and workspace summary.

```
/session checkpoints [n]
```
Show last n checkpoints.

```
/session rename "new name"
```
Or use: `/rename "new name"`

```
/resume [sessionId]
```
Switch to a different session.

### **Working Directory**
```
/cwd
```
Show current working directory.

```
/cd /path/to/directory
```
Change working directory.

### **Experimental Features**
```
/experimental on
```
Enable experimental features (autopilot mode).

```
copilot --experimental
```
Launch with experimental mode enabled.

### **MCP (Model Context Protocol) Servers**
```
/mcp show
```
View all MCP servers.

```
/mcp add ollama-mcp
```
Add custom MCP server (e.g., Ollama).

```
/mcp edit server-name
```
Edit MCP server configuration.

```
/mcp disable server-name
```
Temporarily disable server.

### **Custom Instructions & Skills**
```
/init
```
Initialize Copilot instructions for repository.

```
/skills list
```
List available skills.

```
/skills add skill-name
```
Add new skill.

### **Context & Usage**
```
/context
```
Show token usage and context window visualization.

```
/usage
```
Display session usage metrics.

```
/compact
```
Summarize conversation history to reduce context usage.

### **Sharing & Feedback**
```
/share file
```
Share session to markdown file.

```
/share gist path
```
Share to GitHub gist.

```
/feedback
```
Submit confidential feedback.

### **Terminal & Theme**
```
/terminal-setup
```
Configure multiline input support (Shift+Enter, Ctrl+Enter).

```
/theme set auto
```
Set automatic theme.

```
/theme list
```
View available themes.

### **Other Utilities**
```
/clear
```
Clear conversation history.

```
/help
```
Show help for interactive commands.

```
/logout
```
Log out from GitHub.

---

## **EXPERT TIPS FOR ARCH LINUX**

1. **Keep it updated:**
   ```bash
   brew upgrade copilot-cli  # if using Homebrew
   npm update -g @github/copilot  # if using npm
   ```

2. **Add shell alias for quick access:**
   ```bash
   echo 'alias ai="copilot"' \>\> ~/.bashrc
   # Then: ai
   ```

3. **Use with `! ` to bypass Copilot:**
   ```
   ! ls -la
   ```
   Runs shell command directly without Copilot's AI processing.

4. **Configure custom instructions:**
   Create `~/.copilot/copilot-instructions.md` for persistent instructions across all projects.

5. **Set up LSP for enhanced code intelligence:**
   ```bash
   npm install -g typescript-language-server
   ```
   Edit `~/.copilot/lsp-config.json` to configure.

6. **Enable all permissions for testing:**
   ```
   /allow-all
   ```
   or `/yolo`

---

## **COMMON WORKFLOWS**

### **Debugging Code**
```
I'm getting this error: [paste error]
Help me fix it in my Rust/Python/JavaScript code
```

### **Code Review**
```
/review
Please check my recent changes for bugs
```

### **Building Features**
```
/plan Create a user authentication system with JWT tokens
```
Then follow the plan it generates.

### **Learning**
```
Explain how this code works [use @ to include files]
What are best practices for [topic]?
```

That's Copilot CLI in action! Start with simple prompts and gradually explore advanced features. 🚀

---

<sub>⏱️ 25m 51s</sub>

### 👤 User

how do I copy this session?

---

<sub>⏱️ 25m 58s</sub>

### 💬 Copilot

To **copy/share your Copilot CLI session**, use:

**Option 1: Export to Markdown file**
```
/share file
```
Creates a markdown file with your session conversation.

**Option 2: Share to GitHub Gist**
```
/share gist
```
Uploads your session to a GitHub gist (requires GitHub authentication).

**Option 3: View session info**
```
/session
```
Shows session ID and workspace summary.

**Option 4: Get session ID for later**
```
/session files
```
Shows all files in current session.

**Then resume the session later:**
```
/resume [sessionId]
```

Or simply type the session ID to switch back to it.

**To rename current session:**
```
/rename "My Project Session"
```

Most useful: use `/share file` to save the entire conversation and context to a file you can review or share with others.

---

<sub>⏱️ 27m 6s</sub>

### 👤 User

Okay, but for instance. What is the name of this current sessionn?

---

<sub>⏱️ 27m 12s</sub>

### 💬 Copilot

To see your current Copilot CLI session name/ID, run this **inside the CLI**:

```
/session
```

This will display:
- Session ID
- Session name (if you've renamed it)
- Workspace summary
- Checkpoint info

You can also use:
```
/rename "Your Custom Name"
```

To give it a memorable name (instead of the auto-generated UUID).

If you want to check from the command line without entering Copilot, the session folder is at:
```bash
ls -la ~/.copilot/session-state/
```

Each folder there is a session ID.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
