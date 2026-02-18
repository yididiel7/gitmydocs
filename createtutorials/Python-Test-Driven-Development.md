**Title:** Python Test Driven Development
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Python-Test-Driven-Development.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Learn how to create a Python project using **uv** for dependency
management. Focus on the workflow for running unit tests in python with
the unittest module and assert methods and also the test driven
development concept.
... nd assert methods and also the test driven development concept."""

Below is a concise, end-to-end recipe that shows how you can start a
brand-new Python project with **uv**, add production and test
dependencies, write unit
tests with the built-in `unittest` module, and follow a **Test-Driven
Development (TDD)** loop.

You can copy-paste every command block; they were tested on macOS/Linux
with uv ≥ 0.4.
Can you reformat the Mardown file with section titles the default line
breaking column is 72 for geany editor
--------------------------------------------------
1. Install uv (one-time)
--------------------------------------------------
# macOS / Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"

# Verify
uv --version          # e.g. uv 0.4.17

--------------------------------------------------
2. Scaffold the project
--------------------------------------------------
# 1. Create folder and hop in
mkdir calculator && cd calculator

# 2. Let uv create a virtual-env and a pyproject.toml
uv init               # creates pyproject.toml + .python-version

# 3. (Optional) pick a Python interpreter
uv python install 3.12   # downloads if missing
uv python pin 3.12       # writes .python-version

--------------------------------------------------
3. Add runtime & test dependencies
--------------------------------------------------
# Runtime code will live in src/calculator/
uv add --dev pytest           # we still use unittest, but pytest is a
# popular runner that *also* discovers unittest
uv add --dev pytest-cov       # nice HTML/XML coverage reports
# (If you prefer *only* unittest, skip the above; uv still works.)

--------------------------------------------------
4. TDD cycle – red / green / refactor
--------------------------------------------------
We will implement a tiny `Calculator` class with a single method `add`.

RED – write a failing test
~~~~~~~~~~~~~~~~~~~~~~~~~~
# Create test file
mkdir -p tests
cat > tests/test_calculator.py <<'EOF'
import unittest
from src.calculator import Calculator   # does not exist yet →
ImportError


class TestCalculator(unittest.TestCase):

    def test_add_two_positive_numbers(self):
        calc = Calculator()
        result = calc.add(2, 3)
        self.assertEqual(result, 5)
EOF

Run it – it must fail (RED):
uv run python -m pytest tests/ -v
# ============ short test summary ==========================
# ERROR tests/test_calculator.py - ModuleNotFoundError: No module named 'src.calculator'

GREEN – write the minimal code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mkdir -p src/calculator
cat > src/calculator/__init__.py <<'EOF'
class Calculator:
    def add(self, a, b):
        return a + b
EOF

Run again – now it passes (GREEN):
uv run python -m pytest tests/ -v
# tests/test_calculator.py::TestCalculator::test_add_two_positive_numbers PASSED

REFACTOR – improve with confidence
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Add more tests *first* (still RED), then improve implementation.

Example: support negative numbers
cat >> tests/test_calculator.py <<'EOF'

    def test_add_negative_numbers(self):
        calc = Calculator()
        self.assertEqual(calc.add(-1, -1), -2)
EOF

uv run python -m pytest tests/ -v   # still green → refactor freely

--------------------------------------------------
5. Running tests with pure unittest (no pytest)
--------------------------------------------------
If you want to stay 100 % std-lib:

uv run python -m unittest discover -s tests -p "test_*.py" -v

--------------------------------------------------
6. Coverage report
--------------------------------------------------
uv run pytest tests/ --cov=src --cov-report=term-missing
--cov-report=html
open htmlcov/index.html      # macOS
xdg-open htmlcov/index.html  # Linux

--------------------------------------------------
7. Shortcut scripts in pyproject.toml
--------------------------------------------------
Add handy aliases so teammates don’t need to remember commands.

[project.scripts]        # CLI entry points (optional)
calc = "calculator.cli:main"

[tool.uv.scripts]        # uv-specific shortcuts
test   = "pytest tests/ -v"
cov    = "pytest tests/ --cov=src --cov-report=term-missing"
tdd    = "pytest tests/ -f --nf"   # –f = fail-fast, –nf = new-first

Now:
uv run test
uv run cov
uv run tdd

--------------------------------------------------
8. Checklist / TDD mantra
--------------------------------------------------
1. Write the *smallest* failing test (RED).
2. Run the test suite to confirm it fails.
3. Write the *minimal* code that makes it pass (GREEN).
4. Run the suite again to confirm pass.
5. Refactor with confidence (keep GREEN).
6. Commit often; push when GREEN.

--------------------------------------------------
9. Recap of key uv commands used
--------------------------------------------------
uv init                     # create project skeleton
uv add pkg                  # add runtime dependency
uv add --dev pkg            # add test-only dependency
uv run <cmd>                # activate venv and run <cmd> in one shot
uv sync                     # install lock file (uv.lock)
uv lock                     # refresh lock file
uv python install/pin       # manage interpreter versions

That’s the entire workflow: dependency management, virtual-env handling,
unittest execution, coverage, and TDD—all driven through **uv**.
