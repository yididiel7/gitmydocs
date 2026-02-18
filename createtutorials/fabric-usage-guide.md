# Fabric Clipboard Automation - Complete Usage Guide

## Installation and Setup

### 1. Make the monitor script executable
```bash
chmod +x $HOME/fabric-clipboard-monitor.sh
```

### 2. Add aliases to your shell profile
```bash
# Add to ~/.bashrc or ~/.zshrc
source $HOME/fabric-aliases.sh
```

### 3. Reload shell configuration
```bash
source ~/.bashrc  # or source ~/.zshrc
```

## Usage Scenarios

### Scenario 1: Automatic Background Monitoring (Production)
```bash
# Start automatic clipboard monitoring at startup
fabric-clipboard
```
**What happens:**
- Monitors clipboard continuously in background
- Only processes new clipboard content (no duplicates)
- Handles errors gracefully
- Logs all activity to `~/.fabric-clipboard.log`
- Prevents infinite loops and resource exhaustion

**Use case:** Set up once and forget - runs automatically whenever you copy text

### Scenario 2: Development/Testing Mode
```bash
# Run in foreground with visible output
fabric-clipboard-dev
```
**What happens:**
- Same functionality as production version
- Runs in foreground so you can see immediate results
- Press Ctrl+C to stop
- Useful for testing and debugging

**Use case:** Testing the integration or troubleshooting issues

### Scenario 3: One-Shot Processing
```bash
# Process current clipboard content immediately
fabric-process
```
**What happens:**
- Takes current clipboard content
- Sends it to Fabric AI for processing
- Exits after processing
- No monitoring loop

**Use case:** Process specific text once without continuous monitoring

### Scenario 4: Manual Control
```bash
# Start monitoring manually
fabric-start

# Check if running
fabric-status

# Stop monitoring
fabric-stop
```

**Use case:** Precise control over when monitoring runs

## Advanced Configuration

### Customizing the Monitor Script
Edit `~/fabric-clipboard-monitor.sh` to modify:

```bash
# Change monitoring frequency (seconds)
SLEEP_INTERVAL=2

# Set maximum content length to process
MAX_CONTENT_LENGTH=5000

# Custom log file location
LOG_FILE="$HOME/custom-fabric.log"
```

### Using Different Fabric Patterns
```bash
# Process with specific fabric pattern
wl-paste -selection clipboard -o | fabric -p summarize

# Process with custom model
wl-paste -selection clipboard -o | fabric -c --model claude-3-opus

# Process with multiple patterns
wl-paste -selection clipboard -o | fabric -p summarize -p extract_key_points
```

## Real-World Examples

### Example 1: Summarize Articles
1. Copy an article to clipboard
2. Fabric automatically processes it
3. Get a summary back instantly

### Example 2: Code Explanation
1. Copy code snippet to clipboard
2. Fabric automatically explains what it does
3. Great for learning and code reviews

### Example 3: Email/Message Drafting
1. Copy bullet points or rough notes
2. Fabric automatically formats into professional email
3. Copy the processed result and send

### Example 4: Meeting Notes Processing
1. Copy raw meeting notes
2. Fabric automatically structures and organizes
3. Get clean, formatted meeting minutes

## Troubleshooting

### Check Logs
```bash
# View recent activity
tail -f ~/.fabric-clipboard.log

# Search for errors
grep "error\|failed" ~/.fabric-clipboard.log
```

### Common Issues

**1. Fabric not found**
```bash
# Check if fabric is installed
which fabric

# Install if missing
pip install fabric-pattern
```

**2. Wayland clipboard issues**
```bash
# Check if wl-copy/wl-paste work
echo "test" | wl-copy
wl-paste
```

**3. Multiple instances running**
```bash
# Stop all instances
fabric-stop

# Remove stuck PID file
rm -f ~/.fabric-clipboard.pid
```

**4. Permissions issues**
```bash
# Make script executable
chmod +x ~/fabric-clipboard-monitor.sh
```

## Security Considerations

### Content Privacy
- All clipboard content is processed by Fabric AI
- Log files contain clipboard content (first 50 chars)
- Consider encrypting log files for sensitive content

### Resource Usage
- Monitor script uses minimal CPU (sleep-based polling)
- Fabric API calls consume bandwidth/tokens
- Set `MAX_CONTENT_LENGTH` to prevent processing large files

### Access Control
- Script runs with your user permissions
- Ensure Fabric API credentials are properly secured
- Consider running as separate user for isolation

## Integration with Other Tools

### Keyboard Shortcuts
```bash
# Add to ~/.config/wayland-keybindings
# Ctrl+Alt+F: Process clipboard with fabric
bind ctrl+alt+f exec fabric-process
```

### Window Manager Integration
```bash
# Add to i3 config
bindsym $mod+Ctrl+f exec fabric-process
```

### Systemd Service (for true startup)
Create `~/.config/systemd/user/fabric-clipboard.service`:
```ini
[Unit]
Description=Fabric Clipboard Monitor
After=graphical-session.target

[Service]
Type=simple
ExecStart=%h/fabric-clipboard-monitor.sh
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
```

Enable with:
```bash
systemctl --user enable fabric-clipboard.service
systemctl --user start fabric-clipboard.service
```