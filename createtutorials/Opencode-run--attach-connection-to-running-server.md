# Opencode run --attach connection to running server


  █▀▀█  Opencode run --attach connection to running server
  █  █  opencode -s ses_3a49440afffewgy0G4FTspRZ71
  ▀▀▀▀

Based on the documentation, here's how to use the opencode run --attach command:

Using opencode run --attach
T
he opencode run --attach command connects to a running OpenCode backend server, 
allowing you to execute prompts programmatically without starting 
a new server instance each time.

Basic Usage

# Connect to a local running server
opencode run --attach http://localhost:4096 "Your prompt here"

# Connect to a remote server
opencode run --attach http://remote-host:4096 "Your prompt here"

Complete Workflow
1. First, start the backend server (in one terminal):

# Start a headless server
opencode serve

# Or start a server with web interface
opencode web --port 4096 --hostname 0.0.0.0

2. Then attach and run commands (in another terminal):

# Run a single prompt
opencode run --attach http://localhost:4096 "Explain async/await in JavaScript"

# Run with specific model
opencode run --attach http://localhost:4096 --model anthropic/claude-3.5-sonnet "Your prompt"

# Run with a specific agent
opencode run --attach http://localhost:4096 --agent your-agent "Your prompt"

# Continue from a previous session
opencode run --attach http://localhost:4096 --continue "Your prompt"

Benefits of Using --attach
- Faster execution: Avoids MCP server cold boot times on every run
- Consistent backend: Uses the same running server instance
- Remote access: Can connect to servers running on remote machines
- Scripting friendly: Perfect for automation and batch processing

Additional Options

The opencode run --attach command supports all the standard opencode run flags:
- --model: Specify the model to use
- --agent: Specify which agent to use  
- --continue: Continue from the last session
- --session: Continue from a specific session ID
- --file: Attach files to the prompt
- --format: Output format (default or json)

This is particularly useful for automation scenarios where you want 
to avoid the overhead of starting a new server for each command execution.
