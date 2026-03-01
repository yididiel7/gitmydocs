**Title:** Beginner Tutorial Arch0 Intro CLI
**Date:** 2025-11-15 (20:57:02 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Beginner_Tutorial_Arch0_Intro_CLI.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Welcome to this comprehensive DIY tutorial on installing and configuring
Command-Line Interfaces (CLIs) on Arch Linux.

In this guide, we will walk you through the process of setting up a CLI
environment on your Arch Linux system.

## Required Dependencies

* `curl` package
* `ssh-agent` package
* `sshd` service package
* `pwgen` command-line utility

## Estimated Time

This tutorial should take approximately 1-2 hours to complete, depending
on your familiarity with CLI basics and the complexity of your Arch
Linux installation.

## Skill Level

* Beginner: This tutorial assumes a basic understanding of Linux
commands and file systems. If you are new to Linux or CLIs, we recommend
starting with a more comprehensive guide before attempting this
tutorial.
* Intermediate: If you have some experience with Linux and CLIs, you
will likely find this tutorial easier to follow.
* Advanced: If you are already familiar with CLI basics and advanced
system administration tasks, you may be able to complete this tutorial
quickly.

## Step-by-Step Instructions

### Step 1: Install Required Dependencies

* Open a terminal on your Arch Linux system.
* Run the following command to install `curl`, `ssh-agent`, `sshd`, and
`pwgen` packages:
```
sudo pacman -S curl ssh-agent sshd pwgen
```

### Step 2: Generate SSH Keys

* Create a new SSH key pair using the following command:
```
ssh-keygen -t rsa -b 4096
```

### Step 3: Add SSH Key to System

* Add the generated SSH key to your system by running the following
command:
```
ssh-agent -s
ssh-add ~/.ssh/id_rsa
```

### Step 4: Create SSH User

* Create a new user with SSH capabilities using the following command:
```
useradd -m sshuser
```

### Step 5: Generate Password for SSH User

* Generate a password for the new SSH user using the following command:
```
pwgen -s -1
```

### Step 6: Configure SSH Service

* Create a new file called `sudoers` in the `/etc/ssh/` directory with
the following contents:
```
# /etc/sudoers

Content of /etc/sudoers:

all ALL=(ALL) NOPASSWD:/home/sshuser/bin
all ALL=(ALL) NOPASSWD: /home/sshuser/sbin
```

### Step 7: Set SSHD to Start at Boot Time

* Create a new file called `rc.d_sshd` in the `/etc/init.d/` directory
with the following contents:
```
# /etc/init.d/rc.d_sshd

Content of /etc/init.d/rc.d_sshd:

chown sshuser:root /etc/init.d/rc.d_sshd
chmod 644 /etc/init.d/rc.d_sshd
```

### Step 8: Start SSHD at Boot Time

* Create a new file called `systemd/system/ssh.service` in the
`/etc/systemd/system/` directory with the following contents:
```
# /etc/systemd/system/ssh.service

Content of /etc/systemd/system/ssh.service:

[Unit]

Description=SSH Service

After=network.target

[Service]

User=sshuser
Group=sshuser
ExecStart=/usr/bin/sshd -F
Restart=always

[Install]

WantedBy=multi-user.target
```

### Step 9: Enable SSHD and Start at Boot Time

* Reload the systemd daemon to pick up the new configuration:
```
sudo systemctl daemon-reload
```

* Start the SSH service using the following command:
```
sudo systemctl start ssh
```

* Enable the SSH service to start at boot time:
```
sudo systemctl enable ssh
```

### Additional Tips and Troubleshooting Advice

* Make sure to replace `sshuser` with your desired username.
* You can customize the SSH key format by adding additional options to
the `ssh-keygen` command. Refer to the official [SSH
documentation](https://www.openssh.com/docs.html) for more information.
* If you encounter any issues during the installation process, refer to
the Arch Linux forums or the official [Arch Linux
documentation](https://wiki.archlinux.org/title/Installation_guide) for
troubleshooting advice.

By following these steps, you should now have a fully functional
Command-Line Interface on your Arch Linux system.
