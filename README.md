# GitMyDocs Connecting Git to Github


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

```
$ git add .
```

```
$ git commit -m "commit add message"
```

```
$ git push origin
```

```
$ git push --set-upstream origin master
```

```
$ git push origin
```

[Connecting Git to Github in 8 minutes](https://www.youtube.com/watch?v=qYoc07Da6kg).

Copyright (C) 2025 by Yididiel Hills All rights reserved <mobw4u@gmail.com>.
