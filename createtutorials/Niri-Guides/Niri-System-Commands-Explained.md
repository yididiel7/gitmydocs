**Title:** Niri System Commands Explained
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Niri-System-Commands-Explained.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Based on the commands I've checked, here are the niri restart, reload,
and kill commands:
Niri Commands
Reload Configuration
niri msg action load-config-file
- Reloads the niri configuration file without restarting the compositor
- Use this after editing ~/.config/niri/config.kdl
Quit/Exit Niri
niri msg action quit
- Gracefully exits the niri compositor
- This will end your Wayland session
Process Kill Commands
# Kill niri process (forceful)
pkill niri
# Kill niri with specific signal
pkill -TERM niri    # Graceful termination
pkill -KILL niri    # Forceful kill
Additional Useful Commands
# Validate config before reloading
niri validate
# Check if niri is running
pgrep niri
# Get version of running niri
niri msg version
Important Notes
- pkill niri will forcefully terminate your Wayland session and
potentially crash your desktop
- Use niri msg action quit for graceful shutdown
- Use niri msg action load-config-file to reload config without
restarting
- Always validate your config with niri validate before reloading
Based on my research, here's a comprehensive list of Niri system
commands and Noctalia-shell commands for configuration and error
handling:
---
Niri System Commands
Configuration Management
# Validate configuration
niri validate
# Reload configuration without restart
niri msg action load-config-file
# Check configuration file location
niri --help | grep config
Process Control
# Gracefully exit niri
niri msg action quit
# Kill niri process (forceful)
pkill niri
pkill -TERM niri    # Graceful termination
pkill -KILL niri    # Forceful kill
# Check if niri is running
pgrep niri
# Get running version
niri msg version
System Information
# List connected outputs (monitors)
niri msg outputs
# List workspaces
niri msg workspaces
# List open windows
niri msg windows
# List keyboard layouts
niri msg keyboard-layouts
# Get focused output/window info
niri msg focused-output
niri msg focused-window
Debugging & Error Handling
# Validate config syntax
niri validate -c ~/.config/niri/config.kdl
# Generate shell completions
niri completions bash
niri completions fish
niri completions zsh
# Check running instance info
niri msg version
# Test panic handling (debug)
niri panic
---
Noctalia-Shell Commands
Basic Shell Control
# Start Noctalia (standard method)
qs -c noctalia-shell
# Start Noctalia with specific config
qs -c noctalia-shell
# For NixOS users (direct command)
noctalia-shell
# For PikaOS users
qs
IPC Communication Commands
# Show available IPC targets
qs ipc show
# Core navigation commands
qs ipc call launcher toggle
qs ipc call controlCenter toggle
qs ipc call settings toggle
# System controls
qs ipc call volume increase
qs ipc call volume decrease
qs ipc call brightness increase
qs ipc call brightness decrease
# Media controls
qs ipc call media play
qs ipc call media pause
qs ipc call media next
qs ipc call media previous
# Power management
qs ipc call power lock
qs ipc call power logout
qs ipc call power reboot
qs ipc call power shutdown
qs ipc call power suspend
Configuration Files & Locations
# Main config directory
~/.config/noctalia/
# Plugin directory
~/.config/noctalia/plugins/
# Noctalia configuration (if manually installed)
~/.config/quickshell/
# Default config example
/usr/share/doc/niri/default-config.kdl
Error Handling & Debugging
# Check QuickShell version
qs --version
# List running QuickShell instances
qs list
# Kill QuickShell instance
qs kill
# View logs
qs log
# Enable verbose logging
qs -v -c noctalia-shell
qs -vv -c noctalia-shell  # Even more verbose
# Debug mode with QML debugger
qs --debug 12345 -c noctalia-shell
Service Management
# Enable systemd service
systemctl --user enable --now noctalia.service
# Check service status
systemctl --user status noctalia.service
# View service logs
journalctl --user -u noctalia.service
# Restart service
systemctl --user restart noctalia.service
---
Integration Commands (Niri + Noctalia)
Niri Configuration Integration
# Add to ~/.config/niri/config.kdl for autostart:
spawn-at-startup "qs" "-c" "noctalia-shell"
# Example keybinds for Niri config:
binds {
Mod+Space { spawn "qs" "-c" "noctalia-shell" "ipc" "call" "launcher"
"toggle"; }
Mod+S { spawn "qs" "-c" "noctalia-shell" "ipc" "call" "controlCenter"
"toggle"; }
XF86AudioRaiseVolume { spawn "qs" "-c" "noctalia-shell" "ipc" "call"
"volume" "increase"; }
XF86AudioLowerVolume { spawn "qs" "-c" "noctalia-shell" "ipc" "call"
"volume" "decrease"; }
}
Troubleshooting Commands
# Check if Noctalia is running
qs list | grep noctalia
# Test IPC connectivity
qs ipc call launcher toggle
# Validate Niri config after changes
niri validate
# Restart both services
systemctl --user restart noctalia.service
niri msg action load-config-file
---
Common Error Scenarios
Configuration Errors
# Niri config validation
niri validate
niri validate -c ~/.config/niri/config.kdl
# Check for syntax errors
niri msg action load-config-file
Process Issues
# Check if processes are running
pgrep -l niri
pgrep -l qs
qs list
# Kill and restart processes
pkill qs
pkill niri
qs -c noctalia-shell
Debug Commands
# Enable debug logging
qs -vv -c noctalia-shell
# Check system logs
journalctl --user -xe | grep -i noctalia
journalctl --user -xe | grep -i niri
# Monitor IPC calls
qs ipc listen
This comprehensive list covers most common administrative tasks,
configuration management, and troubleshooting scenarios for both Niri
and Noctalia-shell.
