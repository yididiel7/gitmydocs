**Title:** Fabric AI Tab Autocompletion Error
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Fabric-AI-tab-autocompletion-error.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Perfect! The fabric completion is now working properly. Let me create a
summary of what was fixed:
Summary
I've successfully resolved the fabric-ai tab autocompletion issue.
Here's what was wrong and how I fixed it:
Problems Identified:
1. Missing completion function - The existing completion file had syntax
errors and wasn't being loaded properly
2. Incorrect loading order - compinit was called before the custom fpath
was set
3. Command path conflicts - There was a system fabric-ai command
conflicting with the fabric binary
4. Completion file format issues - The original completion file had
improper structure
Solutions Implemented:
1. Fixed completion loading order in ~/.zshrc - Moved compinit to run
after fpath is set
2. Created a custom completion function (_fabric_completion) that:
- Uses the absolute path to your fabric binary
(/home/srhills/go/bin/fabric)
   - Completes patterns after --pattern or -p
   - Completes contexts, sessions, models, and strategies
   - Shows available options as second argument
3. Registered the completion using compdef _fabric_completion fabric
How to Use:
1. Restart your terminal or run source ~/.zshrc
2. Test tab completion:
- Type fabric --pattern impro and press TAB → see
improve_academic_writing, improve_prompt, etc.
- Type fabric --pattern  and press TAB → see all 255 available patterns
   - Type fabric  and press TAB → see all available options
The completion now works exactly like you expected! When you type fabric
--pattern improve_ and press TAB, it will autocomplete to show the
available improve patterns.


  █▀▀█  Fabric AI: tab autocompletion for patterns in imp…
  █  █  opencode -s ses_3b77bdfccffeUPCj2mTIT6qzSw

Excellent! The stale zsh completion cache was the culprit.
To prevent this in the future, you can add this to your ~/.zshrc before
compinit:
# Rebuild completion cache if .zshrc is newer
if [[ ~/.zshrc -nt ~/.zcompdump ]]; then
    compinit
else
    compinit -C  # Fast load from cache
fi
This automatically rebuilds the cache whenever you modify your .zshrc.

  █▀▀█  Fabric-AI completion issue in terminals vs Geany …
  █  █  opencode -s ses_3b7526299ffelHAKutSIgP5GrI
  ▀▀▀▀
