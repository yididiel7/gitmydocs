**Title:** How to Paste in Vim
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** How_to_paste_in_vim.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# How to paste in vim

[Convert_to_markdown](https://r.jina.ai/https://www.learnvim.com/guides/how-to-paste-in-vim).

Title: How to Paste in Vim

URL Source: https://www.learnvim.com/guides/how-to-paste-in-vim

Markdown Content:
Vim Basics

Pasting in vim works differently than most text editors. This
comprehensive guide covers everything you need to know about pasting
text in vim, from basic commands to advanced register usage.

💡 Tip: Before pasting, you need to copy text! Check out our companion
guide:[How to Copy in
Vim](https://www.learnvim.com/guides/how-to-copy-in-vim)

Basic Pasting Commands
----------------------

These are the fundamental pasting commands you'll use most often in vim:

*   p - Paste after the cursor (or below current line for line-wise
text)
*   P - Paste before the cursor (or above current line for line-wise
text)

Quick Example:

1.   1. Position cursor on a line you want to copy
2.   2. Press yy to copy (yank) the entire line
3.   3. Move to where you want to paste
4.   4. Press p to paste below or P to paste above

Understanding Vim Registers
---------------------------

Vim uses registers to store copied text. Think of them as multiple
clipboards that can hold different pieces of text simultaneously.

### Key Registers to Know:

*   " - The default (unnamed) register. Used when you don't specify a
register.
*   * - System clipboard register (primary selection on Linux)
*   + - System clipboard register (works on all systems)
*   a-z - Named registers you can use to store specific text
*   0 - Contains the last yanked (copied) text
*   1-9 - Contains recently deleted text (deletion history)

Pasting from System Clipboard
-----------------------------

To paste text you copied from outside vim (like from a web browser or
another application):

### In Normal Mode:

*   "+p - Paste from system clipboard after cursor
*   "+P - Paste from system clipboard before cursor
*   "*p - Alternative system clipboard (Linux primary selection)

### In Insert Mode:

*   Ctrl+R + - Paste from system clipboard
*   Ctrl+Shift+V - May work in some terminals

Common Pasting Scenarios
------------------------

### Scenario 1: Copy and Paste Within Vim

1.   1. Select text in visual mode (v or V)
2.   2. Copy with y (yank)
3.   3. Move to destination
4.   4. Paste with p or P

### Scenario 2: Replace Selected Text

1.   1. Copy text you want to use as replacement
2.   2. Select text to replace in visual mode
3.   3. Press p to replace selection with copied text

### Scenario 3: Paste Multiple Times

1.   1. Copy text once
2.   2. Use "0p to paste from the yank register
3.   3. This avoids issues when deleting text overwrites the default
register

Advanced Pasting Techniques
---------------------------

### Using Named Registers

Store different pieces of text in named registers for later use:

*   "ay - Copy to register 'a'
*   "ap - Paste from register 'a'
*   "by - Copy to register 'b'
*   "bp - Paste from register 'b'

### Pasting in Command Mode

When typing commands, you can paste register contents:

*   Ctrl+R " - Paste from default register
*   Ctrl+R + - Paste from system clipboard
*   Ctrl+R a - Paste from register 'a'

Troubleshooting Common Issues
-----------------------------

### System Clipboard Not Working?

*   • Check if vim has clipboard support: :echo has('clipboard')
*   • Try "+p instead of "*p
*   • Install vim with clipboard support (vim-gtk, vim-x11, or gvim)

### Pasted Text Has Wrong Indentation?

*   • Use :set paste before pasting, then :set nopaste
*   • Or use "+p which often handles indentation better

Quick Reference
---------------

#### Basic Pasting:

*   p - Paste after cursor
*   P - Paste before cursor
*   yy then p - Copy line and paste

#### System Clipboard:

*   "+p - Paste from system clipboard
*   Ctrl+R + - Paste in insert mode
*   "+y - Copy to system clipboard

🔗 Complete the Workflow: Now that you know how to paste, master the
copying side too! Read our comprehensive guide:[How to Copy in
Vim](https://www.learnvim.com/guides/how-to-copy-in-vim)

Mastering vim's pasting system takes practice, but once you understand
registers and these commands, you'll have powerful text manipulation
capabilities at your fingertips. Start with the basic p and P commands,
then gradually incorporate system clipboard and register usage as
needed.

Want to master vim quickly with hands-on practice? Our interactive
course covers pasting, registers, and all essential vim skills with real
exercises!

[Start Learning Vim](https://www.learnvim.com/#pricing)
