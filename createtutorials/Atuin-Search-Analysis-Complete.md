**Title:** Atuin Search Analysis Complete
**Date:** 2026-02-03 (00:05:50 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Atuin-Search-Analysis-Complete.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Based on my research, I can now explain your Atuin error and provide the
correct commands with examples.

Problem Analysis

---
The error unrecognized subcommand 'dedup' occurs because Atuin doesn't
have a dedup subcommand.
You're likely thinking of a different tool or confusing it with other
commands like Splunk's dedup.

[ERROR] Running this command: $ atuin dedup
error: unrecognized subcommand 'dedup' and no executable named
'atuin-dedup' found in your PATH
Usage: atuin <COMMAND>
For more information, try '--help'.

---

Correct Atuin Commands for History Management

Here are the actual commands Atuin provides for managing and cleaning up
history:

1. atuin history prune - The main cleanup command
# Show what would be deleted (dry run)

atuin history prune --dry-run

# Actually delete matching entries

atuin history prune

# Using the short flag

atuin history prune -n  # dry run

2. Manual deduplication approach

Since there's no built-in dedup command, users typically use:

# View duplicates manually first

atuin search --cmd "your-command"

# Use the TUI to delete individual entries

atuin search

# Then use Ctrl+a+d to delete selected entries

3. Common workflow for removing duplicates

# 1. First, backup your history

cp ~/.local/share/atuin/history.db
~/.local/share/atuin/history.db.backup

# 2. Check what matches your filter

atuin history prune --dry-run

# 3. If it looks good, prune

atuin history prune

# 4. Sync changes if using sync

atuin sync

4. Filter-based cleanup (recommended approach)

Configure your history_filter in ~/.config/atuin/config.toml:

[history_filter]

# Exclude common commands you don't want in history

filter = "^ls$|^cd$|^pwd$"

Then run:

atuin history prune  # Removes entries matching the filter

Key Takeaways

1. No atuin dedup command exists - this is why you're getting the error
2. Use atuin history prune for bulk cleanup based on filters
3. Use TUI with Ctrl+a+d for manual deletion of specific entries
4. Always use --dry-run first to see what would be deleted

The confusion likely comes from:
- Splunk's dedup command
- Other tools that have dedup functionality
- GitHub issues discussing the need for a dedup command (which doesn't
exist yet)
