**Title:** How to Copy in Vim
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** How_to_Copy_in_Vim.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# How to Copy in Vim

[Markdown](https://r.jina.ai/https://www.learnvim.com/guides/how-to-copy-in-vim)

Title: How to Copy in Vim

URL Source: https://www.learnvim.com/guides/how-to-copy-in-vim

Markdown Content:
Copying (called "yanking" in vim) is fundamental to efficient text
editing. This comprehensive guide covers all the ways to copy text in
vim, from basic commands to advanced register usage and system clipboard
integration.

💡 Tip: After copying text, you'll want to paste it! Check out our
companion guide:[How to Paste in
Vim](https://www.learnvim.com/guides/how-to-paste-in-vim)

Basic Copying Commands
----------------------

In vim, copying is called "yanking" and uses the y command. Here are the
fundamental copying commands:

*   yy - Copy (yank) the entire current line
*   Y - Copy from cursor to end of line (same as y$)
*   y - Copy selected text (used with visual mode or motions)

Quick Example:

1.   1. Position cursor on a line you want to copy
2.   2. Press yy to copy the entire line
3.   3. Move to where you want to paste
4.   4. Press p to paste (see our [pasting
guide](https://www.learnvim.com/guides/how-to-paste-in-vim))

Visual Mode Copying
-------------------

Visual mode lets you select exactly what you want to copy before yanking
it:

### Character-wise Selection

1.   1. Press v to enter visual mode
2.   2. Use arrow keys or h j k l to select text
3.   3. Press y to copy the selection

### Line-wise Selection

1.   1. Press V (capital V) to enter line visual mode
2.   2. Use j/k to select multiple lines
3.   3. Press y to copy all selected lines

### Block Selection

1.   1. Press Ctrl+v to enter visual block mode
2.   2. Select a rectangular block of text
3.   3. Press y to copy the block

Motion-Based Copying
--------------------

Combine y with vim motions to copy specific text patterns efficiently:

### Word and Line Motions:

*   yw - Copy current word
*   yW - Copy current WORD (including punctuation)
*   y$ - Copy to end of line
*   y0 - Copy to beginning of line
*   y^ - Copy to beginning of line (excluding leading whitespace)

### Advanced Motions:

*   yG - Copy to end of file
*   ygg - Copy to beginning of file
*   y3j - Copy 3 lines down
*   y2w - Copy 2 words
*   y) - Copy to end of sentence

### Text Object Copying

Copy entire text objects with these powerful commands:

*   yiw - Copy inner word (word under cursor)
*   yaw - Copy a word (including surrounding whitespace)
*   yi" - Copy text inside quotes
*   ya" - Copy text including quotes
*   yi( - Copy text inside parentheses
*   ya( - Copy text including parentheses

Understanding Vim Registers
---------------------------

Vim uses registers to store copied text. Understanding registers unlocks
powerful copying workflows:

### Key Registers for Copying:

*   " - Default (unnamed) register - where text goes when you don't
specify a register
*   0 - Yank register - always contains the last yanked (copied) text
*   + - System clipboard register (works on all systems)
*   * - Primary selection register (Linux/Unix)
*   a-z - Named registers for storing specific text

Copying to System Clipboard
---------------------------

To copy text from vim to other applications (like web browsers, other
editors):

### Basic System Clipboard Copying:

*   "+yy - Copy current line to system clipboard
*   "+y - Copy selected text to system clipboard
*   "*y - Copy to primary selection (Linux)

### Visual Mode + System Clipboard:

1.   1. Select text with v, V, or Ctrl+v
2.   2. Press "+y to copy to system clipboard
3.   3. Now you can paste in any other application with Ctrl+V

Advanced Copying Techniques
---------------------------

### Using Named Registers

Store different pieces of text in named registers for complex editing
workflows:

*   "ayy - Copy current line to register 'a'
*   "by3w - Copy 3 words to register 'b'
*   "cyi" - Copy text inside quotes to register 'c'

### Appending to Registers

Use uppercase register names to append instead of overwrite:

*   "Ayy - Append current line to register 'a'
*   "By$ - Append from cursor to end of line to register 'b'

Common Copying Workflows
------------------------

### Workflow 1: Copy Multiple Items

1.   1. Copy first item: "ayy (to register 'a')
2.   2. Copy second item: "byy (to register 'b')
3.   3. Copy third item: "cyy (to register 'c')
4.   4. Paste any item: "ap, "bp, or "cp

### Workflow 2: Copy to External App

1.   1. Select text in visual mode (v or V)
2.   2. Copy to system clipboard: "+y
3.   3. Switch to other application
4.   4. Paste with Ctrl+V (or Cmd+V on Mac)

### Workflow 3: Safe Copying

1.   1. Copy important text: "0yy (yank register)
2.   2. Do other operations (delete, change, etc.)
3.   3. Paste original text: "0p (always has your yanked text)

Troubleshooting Common Issues
-----------------------------

### System Clipboard Not Working?

*   • Check if vim has clipboard support: :echo has('clipboard')
*   • Try "+y instead of "*y
*   • Install vim with clipboard support (vim-gtk, vim-x11, or gvim)
*   • On some systems, use :set clipboard=unnamedplus

### Copied Text Gets Overwritten?

*   • Use the yank register: "0p always has your last yanked text
*   • Use named registers: "ay then "ap
*   • Avoid deleting text if you need to preserve copied content

### No Visual Feedback When Copying?

*   • Add to your .vimrc: :set showcmd
*   • For visual feedback on yank: :set hlsearch
*   • Some vim distributions show yank highlighting automatically

Quick Reference
---------------

#### Basic Copying:

*   yy - Copy current line
*   yw - Copy word
*   y$ - Copy to end of line
*   yG - Copy to end of file

#### System Clipboard:

*   "+yy - Copy line to clipboard
*   "+y - Copy selection to clipboard
*   "ay - Copy to register 'a'

🔗 Next Step: Now that you know how to copy text, learn how to paste it
effectively! Read our comprehensive guide:[How to Paste in
Vim](https://www.learnvim.com/guides/how-to-paste-in-vim)

Mastering vim's copying system gives you incredible text manipulation
power. Start with basic yy and y commands, then gradually incorporate
visual mode selections, motion-based copying, and register usage as your
skills develop.

Ready to master vim's copy-paste workflow with hands-on practice? Our
interactive course covers copying, pasting, registers, and all essential
vim skills!

[Start Learning Vim](https://www.learnvim.com/#pricing)
