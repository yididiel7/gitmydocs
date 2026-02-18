# AGENTS.md - Agentic Coding Guidelines

## Repository Overview

This is a **documentation/tutorial repository** containing Linux/Arch Linux guides,
CLI tool tutorials, and system administration references. All content is in
Markdown format.

## Build/Test/Lint Commands

This repository has no build system. It is a pure documentation project.

### Validation Commands
```bash
# Check markdown syntax (if markdownlint is available)
markdownlint *.md */*.md

# Check for broken links (if lychee is available)
lychee *.md */*.md
```

## Code Style Guidelines

### Markdown Formatting

**Line Breaking:**
- Default line breaking: **72 columns** (Geany editor standard)
- Wrap long lines at 72 characters for readability
- Use soft wraps in editor, hard breaks for newlines

**Headers:**
- Use ATX style (`# Header`) not Setext
- Title case for main headers: `# How to Configure Nginx`
- Sentence case for subheaders: `### Setting up virtual hosts`
- Single blank line before and after headers

**Lists:**
- Use `-` for unordered lists (not `*`)
- Use `1.` for ordered lists
- Indent nested lists with 2 spaces
- Blank line before and after list blocks

**Code Blocks:**
- Use fenced code blocks with language tags:
  ~~~markdown
  ```bash
  echo "Hello World"
  ```
  ~~~
- Indent code blocks to match surrounding content
- Use `plain` for non-syntax output

**Inline Code:**
- Use backticks for: commands (`ls -la`), file names (`config.txt`),
  options (`--help`)
- No spaces inside backticks

### File Naming Conventions

**Tutorial Files:**
- Format: `Descriptive-Title-With-Dashes.md`
- Use Title Case with dashes as separators
- Date suffix for time-sensitive content:
  `Topic-Description_YYYY-MM-DD_HH-MM-SS.md`

**Directory Organization:**
- Group related tutorials in subdirectories: `Niri-Guides/`, `Nm-Arch-Guide/`
- Use Title-Case for directory names

### Content Structure

**Standard Tutorial Template:**
```markdown
**Title:** Human Readable Title
**Date:** YYYY-MM-DD (HH:MM:SS TIMEZONE)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** filename.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# Main Heading

Brief introduction paragraph explaining what the tutorial covers.

## Prerequisites

- Item 1
- Item 2

## Main Content Section

### Subsection

Content here...

## Summary

Key takeaways and next steps.
```

**Required Metadata:**
- Title, Date, Author, lfnc (filename), Copyright, License

**Auto-Population Snippet (for editor templates):**
When creating new documents, use this template for auto-populated headers:

```markdown
ti=**Title:**
dt=**Date:** YYYY-MM-DD (HH:MM:SS TIMEZONE)
au=**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
lf=**lfnc:**
co=**Copyright:** © 2026-2027 Sr. Tyrone Hills
li=**License:** MIT – see LICENSE file for details
```

*Note: The `%cursor%` placeholder indicates where the cursor should be
positioned after template insertion. The `lf` field should auto-populate
with the actual filename.*

**Geany Editor Configuration:**
Snippets configuration file location: `~/.config/geany/snippets.conf`

Available shortcuts:
- Type `header` then press **Tab** → Inserts complete header
- Type `ti` then press **Tab** → **Title:** field
- Type `dt` then press **Tab** → **Date:** field (auto-populated)
- Type `au` then press **Tab** → **Author:** field
- Type `lf` then press **Tab** → **lfnc:** field (auto-populated with filename)
- Type `co` then press **Tab** → **Copyright:** field
- Type `li` then press **Tab** → **License:** field

Template file location: `~/.config/geany/templates/files/markdown.tpl`
Use **File → New (with Template)** to create new documents with auto-populated headers.

### Writing Style

**Tone:**
- Professional yet approachable
- Use second person ("you") for instructions
- Use imperative mood: "Run the following command"

**Technical Accuracy:**
- Verify all commands work on Arch Linux
- Include expected output examples
- Note version-specific behavior

**Formatting Standards:**
- Use bold (`**text**`) for emphasis and UI elements
- Use italics (`*text*`) for emphasis only
- Use blockquotes (`>`) for notes, warnings, tips
- Use horizontal rules (`---`) sparingly

### Special Elements

**Command Examples:**
- Show prompt indicator: `$` for user, `#` for root
- Include comments explaining what command does

```bash
# List all running services
$ systemctl list-units --type=service --state=running
```

**Warnings and Notes:**
```markdown
> **Warning:** This will delete all data. Backup first!

> **Note:** This feature requires kernel 5.x or later.
```

**Keyboard Shortcuts:**
- Use `Mod` for Super/Windows key
- Format: `Mod+Shift+E`, `Ctrl+C`
- Use code formatting for all key combinations

## Naming Conventions

- **Files:** `Title-Case-With-Dashes.md`
- **Variables in examples:** lowercase_with_underscores
- **Environment variables:** ALL_CAPS
- **Commands:** lowercase (follow standard Unix conventions)

## Common Patterns

**Tutorial Types:**
1. **Setup/Installation:** Prerequisites → Installation → Configuration → Verification
2. **Command Reference:** Syntax → Options → Examples → Common Use Cases
3. **Troubleshooting:** Problem → Diagnosis → Solution → Prevention

**Reference Links:**
- Use descriptive link text: `[Official Arch Wiki](url)` not `[click here](url)`
- Prefer HTTPS links
- Verify links are current

## Agent Instructions

When editing this repository:

1. **Preserve existing tutorials** - Do not delete without confirmation
2. **Maintain 72-column line breaks** throughout all content
3. **Follow existing file naming patterns** in each directory
4. **Add metadata block** to new tutorial files
5. **Test all shell commands** before including them
6. **Use consistent terminology** (e.g., "terminal" not "shell" unless specific)
7. **Update date metadata** when substantially modifying existing files
8. **Group related files** in appropriately named subdirectories

## Pre-Commit Checklist

- [ ] Lines wrapped at 72 columns
- [ ] Metadata block present (for tutorials)
- [ ] All code blocks have language tags
- [ ] No trailing whitespace
- [ ] File ends with single newline
- [ ] Links use HTTPS where available
- [ ] Commands verified on Arch Linux
