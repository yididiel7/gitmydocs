**Title:** GitButler CLI Install
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** GitButler-Cli-Install.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# GitButler Intro to the GitButler CLI

    1. [Getting Started](https://docs.gitbutler.com/guide).

    2.[Youtube video](https://youtu.be/Jg8L3SbgZ3o).

INSTALL GITBUTLER INSTRUCTIONS

Curl install

You can install the CLI by running the following command in your
terminal:

```$ curl -fsSL https://gitbutler.com/install.sh | sh```

Setup

If you go into any existing Git repository and run but setup,
it will make some neccesary changes to your setup in order for GitButler to manage your data.

If you run almost any but command in an existing Git repository in an interactive terminal,
it will ask you if you want to set it up and then run the command you were trying to run.

So basically just run but anywhere to get started. At any time after this, you can run but teardown to undo
the GitButler changes and go back to being a boring old Git project. It will not remove GitButler metadata,
so feel free to go back and forth if you need to.
