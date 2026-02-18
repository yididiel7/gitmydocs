**Title:** Arch Linux Command line Commands
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Arch_Linux_command-line_commands.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# Here is a comprehensive list of Arch Linux command-line commands

[PROMPT #1]
>>> """Can you generate a comprehensive list of Arch-Linux Command-line
Commands?"""

Here is a comprehensive list of Arch Linux command-line commands:

**Basic Commands**

* `ls` - list files and directories
* `cd` - change directory
* `pwd` - print working directory
* `mkdir` - make a new directory
* `rm` - remove a file or directory
* `touch` - create a new empty file
* `cp` - copy a file
* `mv` - move or rename a file
* `echo` - print text to the console
* `cat` - read text from a file

**File Management**

* `ls -l` - list files and directories with detailed information
* `find .` - search for files and directories in the current
directory and its subdirectories
* `grep pattern` - search for patterns in files or directories
* `awk 'pattern' file` - edit a file using awk
* `sed 'pattern' file` - edit a file using sed
* `rsync -avz file1 file2` - synchronize two files and directories

**User Management**

* `useradd user_name` - create a new user account
* `userdel user_name` - delete an existing user account
* `groups user_name` - list the groups for a user account
* `gpasswd group_name` - add or remove a group from a user account
* `su` - switch to a user account
* `sudo` - run a command with superuser privileges

**System Administration**

* `systemctl start service` - start a system service
* `systemctl stop service` - stop a system service
* `systemctl enable service` - enable a system service
* `systemctl disable service` - disable a system service
* `journalctl` - view system journal logs
* `logrotate log_file` - rotate the system log file
* `ufw status` - check if firewall is enabled and active

**Networking**

* `ping host_name` - test internet connectivity to a host
* `nslookup hostname` - resolve an IP address or domain name
* `dig hostname` - perform DNS lookups
* `route add default gateway` - add the default route to the
routing table
* `ip addr show` - view IPv4 and IPv6 network addresses

**System Monitoring**

* `top` - display a list of running processes
* `htop` - display a list of running processes with detailed
information
* `vmstat` - view system statistics for virtual machines
* `sar` - view system resource usage

**Security**

* `chown user_name:group_name file_path` - change the ownership of
a file or directory
* `chmod +x script_name` - make an executable file
* `ss -lpni` - view process and socket information
* `kill pid_number` - kill a process by its PID number

**Miscellaneous**

* `date` - print the current date and time
* `hostname` - print the system hostname
* `uptime` - display the system uptime
* `memoryinfo` - display memory usage information
* `getconf MCEXTNAME` - get the maximum effective CPU frequency

Note: This is not an exhaustive list, and there are many more
command-line commands available in Arch Linux.

[PROMPT #2]
❯ ollama run ALIENTELLIGENCE/linuxcmdxpert

>>> """Can you generate a exhaustive list of Arch-Linux Command-line
Commands?"""

Arch Linux is known for its simplicity and customization options.

Here's an exhaustive list of many common command-line commands used in
Arch Linux:

**File Management**

1. `cd` - Change directory (e.g., `cd Documents`)
2. `mkdir` - Make a new directory (e.g., `mkdir MyFolder`)
3. `rmdir` - Remove an empty directory (e.g., `rmdir EmptyDir`)
4. `rm` - Remove a file or directory (e.g., `rm example.txt`)
5. `cp` - Copy a file or directory (e.g., `cp example.txt
/home/user/backup/`)
6. `mv` - Move or rename a file or directory (e.g., `mv example.txt
/home/user/new_name.txt`)
7. `ls` - List files and directories in the current directory (e.g., `ls
-l`)
8. `tree` - Display the directory structure (e.g., `tree
/home/user/Documents/`)

**System Administration**

1. `uname` - Display system information (e.g., `uname -a`)
2. `hostname` - Display the hostname of the system
3. `uptime` - Display the system's uptime and load averages
4. `df` - Display disk space usage statistics
5. `du` - Display disk usage statistics for a specific directory or file
6. `free` - Display memory and disk space information
7. `ps` - Display information about running processes (e.g., `ps aux`)
8. `kill` - Terminate a process by ID (e.g., `kill 1234`)
9. `killall` - Terminate all processes with a specific name
10. `reboot` - Reboot the system
11. `shutdown` - Shutdown the system

**Networking**

1. `ip` - Display and manage network interfaces (e.g., `ip addr show`)
2. `netstat` - Display network socket information (e.g., `netstat
-tlnp`)
3. `ping` - Test connectivity to a specific host or IP address
4. `traceroute` - Display the route taken by packets to a specific host
or IP address

**User Management**

1. `useradd` - Add a new user account (e.g., `useradd john`)
2. `usermod` - Modify an existing user account (e.g., `usermod -s
/bin/bash john`)
3. `deluser` - Remove a user account and its associated files
4. `chown` - Change the ownership of a file or directory

**Package Management**

1. `pacman` - Manage packages in Arch Linux (e.g., `pacman -S
package_name`)
2. `yaourt` - A frontend to pacman for easier package management
3. `pamac` - Another popular package manager for Arch Linux
4. `aurman` - A tool for managing packages from the Arch User Repository
(AUR)

**Terminal and Shell**

1. `clear` - Clear the terminal screen
2. `reset` - Reset the terminal to its default settings
3. `bash` - Open a new Bash shell instance
4. `exit` - Exit the current shell or login session

This is not an exhaustive list, as there are many other commands and
tools available in Arch Linux.
However, it covers most of the commonly used ones.

Remember that you can always type `man <command>` to view the manual for
a specific command,
which will provide more detailed information about its usage and
options.

Arch Linux `uname -a` Command Example:

>>> Explain this command uname -a?

The command `uname -a` is a shell command in Linux systems (including
Arch Linux) that displays detailed system information.

**Breaking down the command:**

* `uname`: This stands for "Unix Name" or "System Identification," which
is a command used to display system identification.
* `-a`: This option tells the system to display all available
information about itself. The exact output may vary depending on the
Linux
distribution and hardware, but it typically includes:
	+ Operating System name
	+ Version number (e.g., kernel version)
	+ Machine type or processor architecture
	+ Processor speed (in MHz or GHz)
	+ Number of processors or cores

**Output:**

When you run `uname -a`, the output will look something like this:
```bash
Linux arch-vm 5.15.21-arch1-1 #1 SMP PREEMPT Sat, 12 Feb 2022 13:38:47 +0000 x86_64 x86_64 x86_64 GNU/Linux
```
In this example:

* `Linux`: The operating system name.
* `arch-vm`: The machine type (in this case, an Arch Linux virtual
machine).
* `5.15.21-arch1-1`: The kernel version number.
* `#1 SMP PREEMPT Sat, 12 Feb 2022 13:38:47 +0000`: Information about
the build process and date.
* `x86_64 x86_64 x86_64 GNU/Linux`: Processor architecture information
(three identical lines indicate a 64-bit system).

**Why use uname -a?**

`uname -a` can be useful for:

* Identifying the system's operating system, kernel version, and
hardware specifications.
* Troubleshooting issues related to compatibility or performance.
* Verifying that the system meets specific requirements (e.g., for
software installation).
* Displaying information about the system for documentation purposes.

Keep in mind that `uname -a` provides a lot of detailed information. If
you're looking for more specific details, there are other commands
available that can provide additional insights into the system's
configuration and performance.

>>> Thanks!
It was my pleasure to help you with Linux command-line questions. Arch
Linux is a fantastic distribution, and I'm happy to have been able to
assist you in exploring its capabilities. If you have any more questions
or need further assistance, don't hesitate to ask! Have a great day,
and happy coding!
