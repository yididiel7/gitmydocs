# GitMydocs Connecting Git to Github

This directory contains the dotfiles for my system.

## requirements

Ensure you have the following installed on your system.

### Git

First, you need to create a working directory for your GitHub projects.

### Create TWO directories DIRECTORY1 && DIRECTORY2
```
$ mkdir -p directory1
```
### Cd-Into directory
```
$ cd mygihub
```

Inside mygithub create another directory similar to your GitHub cloud repo.

```
$ mkdir -p directory2
```

### To start your project’s version control, navigate to your project directory and run:

```
$ git init
```

### Making Git yours

Configure your Git identity:

$ git config --global user.name "USER_NAME"

$ git config --global user.email "YOUR-EMAIL.com"

Now connect to the repository on GitHub using this command.


$ git remote add origin https://github.com/USER-NAME/repository.git 

Verify your access permissions with the repository by checking your repository

```
$ remote -v
```

### Authenticate connection with your TOKEN-KEY

```
$ git remote set-url origin https://USER-NAME:TOKEN-KEY@github.com/USER-NAME/repository.git
```

Fetch, Branches, and all changes in their history.

```
$ git fetch origin
```

### Show commit logs

```
$ git log
```

If you need to switch branches use this command.

```
$ git switch main
```

### To see which branch type

```
$ git branch
```

[Git Pull Origin]: will show you any changes accrued in the Repo.

```
$ git pull origin
```

### Staging changes

Once you’ve made changes to your files, git add stages them, which means it marks the files for the next commit. 
I personally prefer using git add . to stage all changes at once, but you can also add individual files.

```
$ git add .
```

### Committing your changes

This command takes your staged changes and commits them to the repository history. 
Always include a meaningful message with -m to remember the purpose of the change.

```
$ git commit -m "commit add message"
```

### After committing your changes locally, use git push to upload your commit to a remote repository.

```
$ git push origin master
```

### This command fetches the changes from the remote repository and merges them into your local branch.

```
$ git pull origin master
```

[Note]: you can use this new config entry to automatically setup remote tracking:

git config --global push.autoSetupRemote true

After that, when you do git push tracking is setup automatically. No need for git push -u origin my_branch

```
$ git push --set-upstream origin master
```

### Finding your way:

Sometimes, you need to check the status or review the history of your repository.
```
$ git log
```
### This command displays the state of the working directory and the staging area.

```
$ git status
```


[Connecting Git to Github in 8 minutes](https://www.youtube.com/watch?v=qYoc07Da6kg).

Copyright (C) 2025 by Yididiel Hills All rights reserved <mobw4u@gmail.com>.
