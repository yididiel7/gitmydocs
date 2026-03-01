**Title:** UV How to Install uv
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** UV_how_to_Install_uv.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# How to Install Astral's uv

The best I can do here is refer you to the ever-updating Installation
page from Astral's uv

Step 1: Creating projects

uv supports creating a project with uv init.

```bash

uv init

OR with project name

uv init ai
```

Use the uv init command to create a new project. Specify the project
name and the desired Python version.

When creating projects, uv supports two basic templates: applications
and libraries. By default, uv will create a project for an application.
The --lib flag can be used to create a project for a library instead.

Target directory

uv will create a project in the working directory, or, in a target
directory by providing a name, e.g., uv init foo.
The working directory can be modified with the --directory option, which
will cause the target directory path to be
interpreted relative to the specified working directory. If there's
already a project in the target directory, i.e.,
if there's a pyproject.toml, uv will exit with an error.

Step 2: Initialize the Project

Use the uv init command to create a new project. Specify the project
name and the desired Python version.

```bash
uv init ai --python-version 3.12 --default

When installing Python executables, uv will only overwrite an existing executable if it is managed by uv — e.g.,
if ~/.local/bin/python3.12 exists already uv will not overwrite it without the --force flag.

uv init ai --python-version 3.12 --force

[Note Installing Python executables]:(https://docs.astral.sh/uv/concepts/python-versions/#installing-a-python-version).

```

This command will create a directory named "ai" and set up the necessary
files.

Step 3: Project Structure

After running the command, the following files will be created in the
"ai" directory:

```Code
ai/
├── .gitignore
├── .python-version
├── README.md
├── main.py
└── pyproject.toml
```

Step 4: Configure pyproject.toml

The pyproject.toml file will contain metadata about your project. You
can edit it to specify dependencies and other project details. Here’s a
minimal example:

```toml
[project]
name = "ai"
version = "0.1.0"
description = "Your project description here"
readme = "README.md"
requires-python = ">=3.10"
dependencies = []
```

Step 5: Create the Virtual Environment

The first time you run a project command, uv will automatically create a
virtual environment in the .venv directory within your project folder.
You can run your project with:

```bash
uv run main.py
```

This setup will ensure that your project is isolated and uses the
specified Python version.

**Create a new Python project**

uv comes prepared with an init command. For ML projects, I recommend the
--package flag, since it creates a src folder, which is useful for
testing and shipping the package to a cloud environment like Databricks
for scheduling or deployment.

uv init --package your-project-name

This generates the following tree:

~/Documents/Coding » tree your-project-name
your-project-name
├── pyproject.toml
├── README.md
└── src
    └── your_project_name
        └── __init__.py

You can find other options for uv init in the documentation at
https://docs.astral.sh/uv/concepts/projects/init/.
