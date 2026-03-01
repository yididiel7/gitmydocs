# Geany Python Code Checker Setup Guide

## Overview
This guide configures Geany to check Python code using pycodestyle, pyflakes, and pylint.
Press F9 to check your code, view errors in the Compiler tab, and click errors to jump to code lines.

## Step 1: Install Required Tools

```bash
pip install pycodestyle pyflakes pylint
```

## Step 2: Setup the Helper Script

1. Save the `check_python_code` script to a location in your PATH:
   ```bash
   # Option A: System-wide
   sudo cp check_python_code /usr/local/bin/
   sudo chmod +x /usr/local/bin/check_python_code
   
   # Option B: User-only
   mkdir -p ~/.local/bin
   cp check_python_code ~/.local/bin/
   chmod +x ~/.local/bin/check_python_code
   # Add to ~/.bashrc: export PATH="$HOME/.local/bin:$PATH"
   ```

## Step 3: Configure Geany Build Commands

1. **Open Geany**
2. **Open or create a Python file** (to activate Python mode)
3. Go to **Build → Set Build Commands** (or press Ctrl+Shift+C)
4. Find the section labeled **"Python commands"**
5. Configure the following:

### Command Configuration Table

| Field | Value |
|-------|-------|
| **Label** | Check |
| **Command** | `check_python_code %f` |
| **Working directory** | `%d` |
| **Error regular expression** | `([^:]+):([0-9]+):([0-9:]+)? .*` |

### Field Explanations:

- **Label**: The name shown in the Build menu (e.g., "Check")
- **Command**: The script to run
  - `%f` = Full path to current file
  - `%d` = Directory of current file
  - `%e` = Filename without extension
- **Working directory**: Where to execute the command (`%d` = file's directory)
- **Error regular expression**: Pattern to parse tool output for error location

## Step 4: Test the Setup

1. Create a test Python file with intentional errors:
   ```python
   # test_errors.py
   def badFunction( x,y ):
       unused_var = 42
       return x+y
   ```

2. Save the file in Geany
3. Press **F9** or go to **Build → Check**
4. View results in the **Compiler** tab (bottom panel)

## Step 5: Using Error Navigation

### Compiler Tab Features:
- **View all errors**: Listed in Compiler tab with file:line:column format
- **Click to jump**: Click any error message to jump to that line
- **Red underlines**: Editor shows red squiggly underlines on error lines
- **Status bar**: Shows current error count

### Navigation Shortcuts:
- **F9**: Run code check
- **F4**: Jump to next error
- **Shift+F4**: Jump to previous error
- **Ctrl+Shift+C**: Open Build Commands dialog

## Step 6: Advanced Configuration (Optional)

### Add Multiple Check Commands:

You can add separate commands for different tools:

#### pycodestyle only:
- Label: `Check Style`
- Command: `pycodestyle %f`
- Error regex: `([^:]+):([0-9]+):([0-9:]+)? .*`

#### pyflakes only:
- Label: `Check Syntax`
- Command: `pyflakes %f`
- Error regex: `([^:]+):([0-9]+):.*`

#### pylint only:
- Label: `Lint`
- Command: `pylint --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" --reports=n %f`
- Error regex: `([^:]+):([0-9]+):.*`

### Enhanced Script with Auto-format:

If you want auto-formatting capability, use the enhanced script with black and isort:

```bash
# Add a format command:
# Label: Format
# Command: check_python_code "%f" format
# Error regex: ([^:]+):([0-9]+):([0-9:]+)? .*
```

## Troubleshooting

### Issue: "check_python_code: command not found"
**Solution**: Ensure the script is in your PATH:
```bash
which check_python_code
# If empty, add to PATH:
export PATH="$HOME/.local/bin:$PATH"
```

### Issue: Errors not highlighting in editor
**Solution**: Verify the Error regular expression matches your tool output:
- pycodestyle: `file.py:10:5: E302 expected 2 blank lines`
- pyflakes: `file.py:10: 'x' imported but unused`
- pylint: `file.py:10: [C0303(trailing-whitespace), ] Trailing whitespace`

### Issue: Python tools not found
**Solution**: Use full path or python -m:
```bash
# Instead of: pycodestyle %f
# Use: python3 -m pycodestyle %f
# Or: /home/username/.local/bin/pycodestyle %f
```

### Issue: Permission denied
**Solution**: Make script executable:
```bash
chmod +x /path/to/check_python_code
```

## Error Regular Expression Explained

The regex `([^:]+):([0-9]+):([0-9:]+)? .*` breaks down as:

```
([^:]+)     # Group 1: Filename (any chars except colon)
:           # Literal colon separator
([0-9]+)    # Group 2: Line number (one or more digits)
:           # Literal colon separator
([0-9:]+)?  # Group 3: Column number (optional, digits + optional colon)
.*          # Rest of the message
```

Geany uses:
- Group 1 → Filename
- Group 2 → Line number  
- Group 3 → Column (optional)

## Keyboard Shortcuts Reference

| Shortcut | Action |
|----------|--------|
| F9 | Run "Check" command |
| F4 | Jump to next error |
| Shift+F4 | Jump to previous error |
| Ctrl+Shift+C | Set Build Commands |
| Ctrl+Shift+D | Build menu |
| Ctrl+PageUp/Down | Switch between Compiler/Terminal tabs |

## Example Output

When you press F9, the Compiler tab will show:

```
======  pycodestyle  ======
/home/user/test.py:2:1: E302 expected 2 blank lines, found 1
/home/user/test.py:2:15: E231 missing whitespace after ','
======  pyflakes  ======
/home/user/test.py:3:5: undefined name 'unused_var'
======  pylint  ======
/home/user/test.py:2:0: [C0103(invalid-name), badFunction] Function name "badFunction" doesn't conform to snake_case naming style
```

Click any line to jump to the error location!

## Additional Tips

1. **Customize pycodestyle**: Create `~/.config/pycodestyle` with:
   ```ini
   [pycodestyle]
   max-line-length = 120
   ignore = E203, W503
   ```

2. **Customize pylint**: Create `.pylintrc` in your project:
   ```bash
   pylint --generate-rcfile > ~/.pylintrc
   ```

3. **Use per-project configs**: Place `.pylintrc` or `setup.cfg` in project root

4. **Integrate with version control**: Add pre-commit hooks to run checks before commits
