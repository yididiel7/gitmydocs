**Title:** Git How to Make a Folder in GitHub
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Git-How-to-Make-a-Folder-in-GitHub.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

How to Create a Folder in GitHub (Step by Step)

1. Create a Folder on GitHub Website

The simplest way to make a folder is from the GitHub interface itself.

    Open your GitHub repository
    Click Add file and select Create new file
In the file name field, type the folder name followed by a slash, for
example
    docs/README.md
    Add some content to the file and click Commit new file

This creates a folder instantly and places the file inside it.
For other essential tasks, you might also want to learn how to delete a
branch in GitHub.

2. Create a Folder Locally with Git

If you prefer more control, you can create folders on your local machine
and then push them to GitHub.

    Open your terminal or command prompt
    Navigate to your repository with:
    cd repo-name
    Create a new folder with:
    mkdir folder-name
    Place a file inside the folder with:
    touch folder-name/README.md
    Create a new folder with:
    mkdir folder-name
    Place a file inside the folder with:
    touch folder-name/README.md

    Save and push the changes:
    git add .
    git commit -m "Added folder"
    git push

GitHub does not recognize empty folders, so adding at least one file is
necessary.
While working locally, it can also help to know how to merge branches in
GitHub.

When working with local repositories and pushing changes, you may
sometimes run into merge issues.
For detailed steps on fixing them, see how to resolve conflicts in
GitHub.

After you push the new folder to the remote, the next step is often a
code review in a pull request,
so learn how to approve a pull request on GitHub to complete the
workflow.

You may also want to change the default branch in GitHub to ensure new
pull requests and commits target
the right line of development; see this step by step guide on how to
change the default branch in GitHub.

Why GitHub Requires a File

Git is designed to track files rather than empty directories.
This is why a folder only shows up in your repository if it contains
something inside.
Developers often add placeholder files such as .gitkeep or README.md to
make sure their
folders remain visible. If you ever need the reverse process, check this
guide on how to
download a folder from GitHub.

Introduction

When working on GitHub repositories, creating well-structured
directories (folders) is essential for maintaining organized and
scalable projects. Although GitHub doesn’t allow empty directories, you
can easily create directories with files using the GitHub web interface
or Git tools. This guide explains how to create a directory in GitHub
using multiple approaches.
Why Directory Structure Matters

Organizing your repository into directories helps:

    Enhance readability and usability.
    Separate concerns in codebases (e.g., src, tests, docs).
    Ensure easier navigation for collaborators.

Let’s dive into creating directories in GitHub!
1. Creating a Directory in GitHub via the Web Interface

Follow these simple steps to create a directory directly in your GitHub
repository:

    Open Your Repository
    Navigate to the repository where you want to add a directory.

    Click on “Add file”
At the top-right of the repository page, click Add file > Create new
file.

    Specify the Directory Name
In the “Name your file…” input field, type the name of the directory,
followed by a forward slash (/).
        Example: docs/README.md.
The forward slash creates a directory, and the file name (e.g.,
README.md) ensures the directory isn’t empty.

    Add File Content
Enter some content in the file editor (e.g., “This is the documentation
folder.”).

    Commit the Changes
Add a commit message (e.g., “Added docs directory”) and click Commit new
file.

Notes:

GitHub does not allow empty directories. Adding a placeholder file like
README.md or .gitkeep is a common practice to create and retain
directories in repositories.

2. Using Git Commands to Create Directories

If you prefer using Git locally, follow these steps:
Prerequisites

    Git must be installed and configured on your system.
    Clone the repository using git clone <repository-url>.

Steps:

    Navigate to Your Repository

    cd your-repository-name

    Create a Directory Use the mkdir command to create a directory:

    mkdir docs

Add a Placeholder File Since Git doesn’t track empty directories, add a
file:

    touch docs/README.md
    echo "Documentation files" > docs/README.md

    Stage and Commit the Changes

    git add docs/
    git commit -m "Added docs directory with README.md"

    Push to GitHub

    git push origin main

3. Best Practices for Directory Naming

    Use lowercase names: Avoid using spaces; instead, use - or _.
    Example: project-files or project_files.

Use meaningful names: Reflect the directory’s purpose (e.g., src for
source code, assets for images or styles).

Include placeholder files: Add README.md or .gitkeep to ensure the
directory is tracked in Git.

4. Common Use Cases for Directories

    Organizing Code
    Separate source code, tests, and assets:

    src/
    tests/
    assets/

    Adding Documentation
    A dedicated docs/ folder for documentation.

    Environment-Specific Configurations

    config/
      production/
      staging/
      development/

Conclusion

Creating directories in GitHub is simple and essential for project
organization. Whether you’re working on the web interface or using Git
locally, structuring your repository properly makes collaboration and
maintenance effortless. Start applying these practices in your
repositories today for cleaner and more manageable projects!
