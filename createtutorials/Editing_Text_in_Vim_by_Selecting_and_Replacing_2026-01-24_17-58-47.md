**Title:** Editing Text in Vim by Selecting and Replacing
**Date:** 2026-01-24 (17:58:47 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Editing_Text_in_Vim_by_Selecting_and_Replacing_2026-01-24_17-58-47.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

## Editing Text in Vim by Selecting and Replacing

In Vim, you can efficiently edit text by selecting and replacing it
using visual mode and commands for substitution. Here’s how to do it:

<hr>

### 1. Enter Visual Mode

- **Character Selection**: Press `v` to enter character-wise visual
mode.
- **Line Selection**: Press `V` to select entire lines.
- **Block Selection**: Press `Ctrl + v` to select a block of text.

### 2. Select the Text

Use the arrow keys or `h`, `j`, `k`, `l` to navigate and highlight the
text you want to replace.

### 3. Replace the Selected Text

Once you have highlighted the desired text:

- Press `c` to change the selected text. This will allow you to type the
new text directly.
- Alternatively, you can use `r` to replace a single character at a
time.

### 4. Confirm the Changes

After typing the new text, press `Esc` to exit visual mode and return to
normal mode.

### Example

1. **Highlight**: Use `v` and navigate to highlight "apple".
2. **Change**: Press `c`, type "orange", and then press `Esc`.

<hr>

### Additional Commands for Replacement

- **Substitution Command**: If you prefer to replace text through
command mode, use the following format:
  `:%s/old/new/g`
  This replaces all instances of "old" with "new" in the entire file.

- **Confirmation for Each Replacement**: You can add `c` at the end:
  `:%s/old/new/gc`
  This will prompt you for confirmation for each replacement.

These methods give you versatile options for editing text in Vim. Would
you like to know more about any specific feature?
