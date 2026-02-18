# Geany Setup Guide for Pgp_Encrypt Project

This guide configures Geany specifically for the Pgp_Encrypt Python project with automatic virtual environment detection and project-specific settings.

## Quick Start (3 Steps)

### Step 1: Install Required Tools in Virtual Environment

```bash
cd ~/Pgp_Encrypt
source .venv/bin/activate
pip install pycodestyle pyflakes pylint mypy black isort
```

### Step 2: Open Project in Geany

```bash
# Method A: Open project file directly
geany ~/Pgp_Encrypt/pgp_encrypt.geany

# Method B: Open directory and then load project
cd ~/Pgp_Encrypt
geany .
# Then: Project → Open → pgp_encrypt.geany
```

### Step 3: Configure Error Parsing (First Time Only)

1. Open any Python file (e.g., `main.py`)
2. Go to **Build → Set Build Commands**
3. Configure the error regex (see table below)
4. Click **OK**

That's it! Press **F9** to check your code.

---

## Project-Specific Build Commands

The project file (`pgp_encrypt.geany`) comes pre-configured with these commands:

### Menu Items (Build Menu)

| Menu Item | Command | Key | Description |
|-----------|---------|-----|-------------|
| **Check Code** | `/home/srhills/Pgp_Encrypt/check_project "%f"` | F9 | Run all quality checks |
| **Execute with venv** | `/home/srhills/Pgp_Encrypt/.venv/bin/python "%f"` | F5 | Run file using project venv |
| **Check Style Only** | `/home/srhills/Pgp_Encrypt/check_project "%f" style` | - | PEP 8 + pyflakes only |
| **Lint Only** | `/home/srhills/Pgp_Encrypt/check_project "%f" lint` | - | Pylint only |
| **Type Check** | `/home/srhills/Pgp_Encrypt/check_project "%f" types` | - | mypy type checking |

### Manual Configuration (If Not Using Project File)

Go to **Build → Set Build Commands** and set:

#### Python Commands Section

**Command 1: Check Code**
- Label: `_Check Code`
- Command: `/home/srhills/Pgp_Encrypt/check_project "%f"`
- Working dir: `%d`
- Error regex: `([^:]+):([0-9]+):([0-9:]+)? .*`

**Command 2: Execute**
- Label: `_Execute with venv`
- Command: `/home/srhills/Pgp_Encrypt/.venv/bin/python "%f"`
- Working dir: `%d`
- Error regex: `File "([^"]+)", line ([0-9]+)`

**Command 3: Style Check**
- Label: `Check _Style`
- Command: `/home/srhills/Pgp_Encrypt/check_project "%f" style`
- Working dir: `%d`
- Error regex: `([^:]+):([0-9]+):([0-9:]+)? .*`

**Command 4: Lint**
- Label: `_Lint Only`
- Command: `/home/srhills/Pgp_Encrypt/check_project "%f" lint`
- Working dir: `%d`
- Error regex: `([^:]+):([0-9]+):.*`

**Command 5: Type Check**
- Label: `_Type Check`
- Command: `/home/srhills/Pgp_Encrypt/check_project "%f" types`
- Working dir: `%d`
- Error regex: `([^:]+):([0-9]+):.*`

---

## Error Regular Expression Explained

The regex `([^:]+):([0-9]+):([0-9:]+)? .*` captures:

| Group | Captures | Example |
|-------|----------|---------|
| Group 1 | Filename | `main.py` |
| Group 2 | Line number | `10` |
| Group 3 | Column (optional) | `5:` or `5` |

This pattern works with:
- **pycodestyle**: `main.py:10:5: E302 expected 2 blank lines`
- **pyflakes**: `main.py:10: 'x' imported but unused`
- **pylint**: `main.py:10: [C0303(trailing-whitespace), ] Trailing whitespace`
- **mypy**: `main.py:10: error: Incompatible return value type`

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **F9** | Run "Check Code" (all tools) |
| **F5** | Execute file with virtual environment |
| **F4** | Jump to next error |
| **Shift+F4** | Jump to previous error |
| **Shift+F9** | Compile (if configured) |
| **Ctrl+Shift+C** | Open Set Build Commands |
| **Ctrl+Shift+D** | Build menu |

---

## Using the Compiler Tab

When you press F9:

1. **View Results**: All output appears in the Compiler tab (bottom panel)
2. **Error Highlighting**: Lines with errors show red squiggly underlines
3. **Click to Jump**: Click any error message to jump to that line
4. **Status Bar**: Shows total error count

### Example Output

```
======  pycodestyle (PEP 8 style)  ======
main.py:2:1: E302 expected 2 blank lines, found 1
main.py:4:1: W391 blank line at end of file

======  pyflakes (error detection)  ======
pgp_genkey.py:3:9: 'gnupg' imported but unused

======  pylint (code analysis)  ======
pgp_genkey.py:3:0: [C0103(invalid-name), ] Constant name "gpg" doesn't conform to UPPER_CASE naming style
```

Click any line like `main.py:2:1:` to jump directly to line 2, column 1.

---

## Project Files Overview

The project includes these files:

| File | Purpose |
|------|---------|
| `main.py` | Entry point (template) |
| `pgp_genkey.py` | PGP key generation script |
| `check_project` | Project-specific code checker |
| `pgp_encrypt.geany` | Geany project configuration |
| `pyproject.toml` | Project metadata |
| `.venv/` | Virtual environment |

---

## Virtual Environment Integration

The `check_project` script automatically:
1. Detects the project's `.venv` directory
2. Uses Python from the virtual environment
3. Falls back to system Python if venv not found
4. Runs all tools with the correct Python interpreter

### Installing Additional Tools

```bash
cd ~/Pgp_Encrypt
source .venv/bin/activate
pip install <tool-name>
```

---

## Customizing Checks

### Per-Project Configuration

Create these files in `~/Pgp_Encrypt/`:

#### `.pylintrc` - Pylint configuration
```bash
pylint --generate-rcfile > .pylintrc
# Edit to customize rules
```

#### `setup.cfg` or `pyproject.toml` - pycodestyle configuration
```ini
[pycodestyle]
max-line-length = 120
ignore = E203, W503
```

#### `mypy.ini` - Type checking configuration
```ini
[mypy]
python_version = 3.13
warn_return_any = True
warn_unused_configs = True
```

---

## Troubleshooting

### Issue: "Module not found" errors

**Solution**: Ensure tools are installed in the virtual environment:
```bash
source ~/Pgp_Encrypt/.venv/bin/activate
pip install pycodestyle pyflakes pylint mypy
```

### Issue: Virtual environment not detected

**Solution**: The script looks for `.venv` in the project root. Check:
```bash
ls -la ~/Pgp_Encrypt/.venv/bin/python
```

### Issue: Errors not highlighting in editor

**Solution**: Verify the Error regular expression in Build → Set Build Commands matches your tool output format.

### Issue: "check_project: command not found"

**Solution**: Use the full path or add to PATH:
```bash
# In Geany command field, use full path:
/home/srhills/Pgp_Encrypt/check_project "%f"
```

### Issue: Permission denied

**Solution**: Make the script executable:
```bash
chmod +x ~/Pgp_Encrypt/check_project
```

---

## Advanced: Multiple Projects

To use this setup with multiple projects:

1. Copy `check_project` to each project root
2. Copy `pgp_encrypt.geany` and rename it (e.g., `myproject.geany`)
3. Edit the `.geany` file and update:
   - `base_path=/path/to/your/project`
   - All file paths in `[files]` section
   - All command paths in `[build-menu]` section

---

## Integration with Git

Add a pre-commit hook to run checks before commits:

```bash
# Create pre-commit hook
cat > ~/Pgp_Encrypt/.git/hooks/pre-commit << 'EOF'
#!/bin/sh
# Run code checks on staged Python files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.py$')

if [ -n "$STAGED_FILES" ]; then
    echo "Running code checks..."
    for file in $STAGED_FILES; do
        /home/srhills/Pgp_Encrypt/check_project "$file" || exit 1
    done
fi
EOF

chmod +x ~/Pgp_Encrypt/.git/hooks/pre-commit
```

---

## Summary

✅ **Installed**: pycodestyle, pyflakes, pylint, mypy, black, isort  
✅ **Configured**: Build commands with error parsing  
✅ **Project file**: `pgp_encrypt.geany` ready to open  
✅ **Script**: `check_project` for virtual environment detection  
✅ **Shortcuts**: F9 to check, F4 for next error  

**Ready to code! Open `pgp_encrypt.geany` and press F9 to check your code.**
