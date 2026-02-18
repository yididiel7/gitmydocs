**Title:** Create a New VENV Installing UV on Archlinux
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Create-a-New-VENV-Installing-UV-on-Archlinux.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

3 CREATE A NEW VIRTUAL ENVIRONMENT INSTALLING UV ON ARCH LINUX
    Install uv: You can install uv using the following command:

    bash
    curl -LsSf https://astral.sh/uv/install.sh | sh

    Alternatively, you can use pip:

    bash
    pip install uv

    Verify Installation: Check if uv is installed correctly by running:

    bash
    uv --version

Creating a New Project

Initialize a Project: Use the following command to create a new project:

    bash
    uv init my_project

    Replace my_project with your desired project name.

Project Structure: This command will create a directory with the
following structure:

    Code
    my_project/
    ├── .gitignore
    ├── .python-version
    ├── README.md
    ├── main.py
    └── pyproject.toml

Edit pyproject.toml: Open the pyproject.toml file to specify your
project dependencies and metadata.

Running Your Project

    Navigate to Project Directory:

    bash
    cd my_project

    Run the Main Script: Execute your main script with:

    bash
    uv run main.py

This will run the default main.py file, which you can modify to include
your code. You can add dependencies using the uv add command as needed.

[PROMT #2]

>>> """Creating a Virtual Environment with uv on Arch Linux

Step-by-Step Instructions"""

Here are the step-by-step instructions to create a virtual environment
with `uv` (Universal Virtual Environments) on Arch Linux:

**Prerequisites**

1. **Install `uv`**: Run the command `sudo pacman -S uv` to install
`uv`.

2. **Verify installation**: Open a terminal and type `uv --version` to
ensure `uv` is installed correctly.

**Create a new virtual environment**

1. **Create a new directory for your virtual environment**: Run the
command `mkdir myenv` (replace "myenv" with your desired name) to create
a new directory
for your virtual environment.
2. **Initialize the virtual environment**: Navigate into the newly
created directory and run the command `uv init` to initialize the
virtual environment.

**Configure the virtual environment**

1. **Choose the Python version**: Run the command `uv use python3.9`
(replace "python3.9" with your desired Python version) to specify the
Python version for
your virtual environment.

2. **Set the Python executable path**: Set the `PYTHONPATH` environment
variable by running the command `uv set
PYTHONPATH=/path/to/your/project`.

**Activate and deactivate the virtual environment**

1. **Activate the virtual environment**: Run the command `uv on` to
activate the virtual environment.
2. **Deactivate the virtual environment**: Run the command `uv off` to
deactivate the virtual environment.

**Verify the virtual environment is activated**

1. **Check the Python version**: Run the command `python --version` to
verify that you are using the specified Python version from your virtual
environment.

That's it! You now have a virtual environment set up with `uv` on Arch
Linux.
