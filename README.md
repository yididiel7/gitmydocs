# GitMydocs: Connecting Git to Github

This guide helps you set up and configure Git with GitHub. For video tutorial, see [Connecting Git to Github in 8 minutes](https://www.youtube.com/watch?v=qYoc07Da6kg).

## Prerequisites

Ensure you have [Git](https://git-scm.com/downloads) installed on your system.

## Initial Setup

### 1. Create Working Directories

First, create two directories for your GitHub projects:

```bash
# Create first directory
mkdir -p directory1

# Navigate into it
cd directory1

# Create second directory for GitHub repo
mkdir -p directory2
```

### 2. Initialize Git Repository

Navigate to your project directory and initialize Git:

```bash
git init
```

### 3. Configure Git Identity

Set your Git username and email:

```bash
git config --global user.name "USER_NAME"
git config --global user.email "YOUR-EMAIL.com"
```

### 4. Connect to GitHub Repository

```bash
# Add remote repository
git remote add origin https://github.com/USER-NAME/repository.git

# Verify remote connection
git remote -v

# Authenticate with personal access token
git remote set-url origin https://USER_NAME:TOKEN-KEY@github.com/USER-NAME/repository.git
```

## Basic Git Operations

### Fetching & Branching

```bash
# Fetch all branches and history
git fetch origin

# View commit history
git log

# Switch branches
git switch main

# List branches
git branch

# Pull changes from remote
git pull origin
```

### Making Changes

```bash
# Stage all changes
git add .

# Commit changes with message
git commit -m "commit message"

# Push changes to remote repository
git push origin master

# Pull latest changes from remote
git pull origin master
```

### Setting Up Remote Tracking

To automatically set up remote tracking, configure Git globally:

```bash
git config --global push.autoSetupRemote true
```

Or manually set upstream:

```bash
git push --set-upstream origin master
```

### Useful Commands

```bash
# View repository status
git status

# View commit history
git log
```

---

Copyright (C) 2025 by Yididiel Hills All rights reserved <mobw4u@gmail.com>.
