**Title:** UV - Commands CheatSheets
**Author:** Sr. Yididiel Hills Arch Linux ADM
**Date:** November, 01-11-2025 (16:49:32 IST)
**lfnc:** 
**Copyright:** © 2025–2026 Tyrone Hills 

# UV Help Commands and Usage

| Replaces: pyenv         | Purpose                                                | Command                                                |
|===========================================================================================================================================|
|                         | Install a specific Python version                      | uv python install <version>                            |
|                         | List available Python versions                         | uv python list                                         |
|                         | Use a specific Python version in a project             | uv python use <version>                                |
|                         | Automatically install the required Python version      | uv run --python <version> script.py                    |
|                         | Pin the Python version for a project                   | uv python pin                                          |
|===========================================================================================================================================|
| Replaces: venv          | Purpose                                                | Command                                                |
|===========================================================================================================================================|
|                         | Create a virtual environment                           | uv venv                                                |
|                         | Create a virtual environment with specific Python ver. | uv venv --python <version>                             |
|                         | Activate virtual environment (Linux/macOS)             | source .venv/bin/activate                              | 
|                         | Activate virtual environment (Windows)                 | .venv\Scripts\activate                                 |
|                         | Remove a virtual environment                           | uv remove                                              |
|                         | Reinstall all dependencies in the virtual environment  | uv sync --reinstall                                    |
|===========================================================================================================================================|
| Replaces: poetry        | Purpose                                                | Command                                                |
|===========================================================================================================================================|
|                         | Initialize a new project                               | uv init <project-name>                                 | 
|                         | Add a package as a dependency                          | uv add <package-name>                                  |
|                         | Add a dev dependency                                   | uv add --dev <package-name>                            |
|                         | Add a package from Git                                 | uv add git+https://github.com/user/repo.git            |
|                         | Remove a package                                       | uv remove <package-name>                               |
|                         | Lock dependencies to exact versions                    | uv lock                                                |
|                         | Upgrade a specific package                             | uv lock --upgrade-package <package-name>               |
|                         | Upgrade all dependencies                               | uv lock --upgrade                                      |
|                         | Build a Python package                                 | uv build                                               |
|                         | Publish a package to PyPI                              | uv publish                                             |
|===========================================================================================================================================|
| Replaces: pip, pipx     | Purpose                                               | Command                                                 |
|===========================================================================================================================================|
|                         | Install a package                                     | uv add <package-name>                                   |
|                         | Remove a package                                      | uv remove <package-name>                                |
|                         | Install dependencies from pyproject.toml              | uv sync                                                 |
|                         | Install dependencies while excluding some groups      | uv sync --no-group dev --no-group lint                  |
|                         | Install dependencies from requirements.txt            | uv pip install -r requirements.txt                      |
|                         | Freeze dependencies into requirements.txt             | uv pip freeze > requirements.txt                        |
|                         | Generate requirements.txt from uv.lock                | uv export --format requirements-txt > requirements.txt  |
|                         | Upgrade all installed packages                        | uv lock --upgrade                                       |
|                         | Install CLI tools globally                            | uv tool install <tool-name>                             |
|                         | List all installed tools                              | uv tool list                                            |
|                         | Remove a globally installed CLI tool                  | uv tool remove <tool-name>                              |
|                         | Upgrade all installed CLI tools                       | uv tool upgrade --all                                   |
|===========================================================================================================================================|
| Replaces: Python Tools  | Purpose                                               | Command                                                 |
|===========================================================================================================================================|
|                         | Run a Python script inside the virtual environment    | uv run <script.py>                                      |
|                         | Run a script while automatically installing deps      | uv run --with <package> python script.py                |
|                         | Run a command inside the virtual environment          | uv run -- <command>                                     |
|                         | Run a one-time CLI tool without installing globally   | uvx <tool-name> --version                               | 
|                         | Install a tool globally                               | uv tool install <tool-name>                             |
|                         | Upgrade a specific tool                               | uv tool upgrade <tool-name>                             |
|                         | Upgrade all installed tools                           | uv tool upgrade --all                                   | 
|                         | Enable shell auto-completion for uv                   | eval "$(uv generate-shell-completion bash)"             |
|===========================================================================================================================================|

UV - run Commands: 

Use `uv help run` for more details.

  run                        Run a command or script
  init                       Create a new project
  add                        Add dependencies to the project
  remove                     Remove dependencies from the project
  sync                       Update the project's environment
  lock                       Update the project's lockfile
  export                     Export the project's lockfile to an alternate format
  tree                       Display the project's dependency tree
  tool                       Run and install commands provided by Python packages
  python                     Manage Python versions and installations
  pip                        Manage Python packages with a pip-compatible interface
  venv                       Create a virtual environment
  build                      Build Python packages into source distributions and wheels
  publish                    Upload distributions to an index
  cache                      Manage uv's cache
  self                       Manage the uv executable
  version                    Read or update the project's version
  generate-shell-completion  Generate shell completion
  help                       Display documentation for a command

UV - uv Commands: 

Use `uv help run` for more details.

uv
uv run
uv init
uv add
uv remove
uv version
uv sync
uv lock
uv export
uv tree
uv tool
uv tool run
uv tool install
uv tool upgrade
uv tool list
uv tool uninstall
uv tool update-shell
uv tool dir

UV - uv python Commands: 

Use `uv help run` for more details.

uv python
 uv python list
 uv python install
 uv python upgrade
 uv python find
 uv python pin
 uv python dir
 uv python uninstall

UV - uv pip Commands: 

Use `uv help run` for more details.

uv pip
 uv pip compile
 uv pip sync
 uv pip install
 uv pip uninstall
 uv pip freeze
 uv pip list
 uv pip show
 uv pip tree
 uv pip check

UV - uv venv Commands: 

Use `uv help run` for more details.

uv venv
uv build
uv publish
uv cache
uv cache clean
uv cache prune
uv cache dir
uv self
uv self update
uv self version
uv generate-shell-completion
uv help
