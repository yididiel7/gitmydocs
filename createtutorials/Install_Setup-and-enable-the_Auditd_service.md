**Title:** Install Setup and Enable the Auditd Service
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Install_Setup-and-enable-the_Auditd_service.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

### USER
How to install set up auditd on Arch-Linux enable and start the auditd
service

### ASSISTANT
To install, setup and enable the Auditd service on Arch Linux, you can
follow these steps:

### Step 1: Install Auditd

First, update your package list:
```bash
sudo pacman -Syyu community-misc/auditd
```
Then, install Auditd:
```bash
sudo pacman -U auditd
```

### Step 2: Enable and Start the Auditd Service

After installation, you need to enable the service to start at boot
time. To do this:

1. Edit the `rc.local` file (you can use `sed` command to edit it):
```bash
sudo sed -i '/^#.*$/d' /etc/rc.local
```
2. Add the following lines after the current line:
```bash
exec 3> /dev/null; auditd --pidfile=/var/run/auditd.pid --quiet --group=audit --user=0 --max-size=100000 -k all -p 'a' -F ap --cut-n 4 --show-context --show-policy-file /etc/auditory policy file /etc/auditory/audit.d
```
- `--pidfile=/var/run/auditd.pid`: Store the PID of the auditd process
in a file.
   - `-k all`: Use an all-kinds audit rule for logging.
- `-F ap`: Format the log as "timestamp,source,destination,auditory
policy,audible,read,write,level,severity,proc,pid,user,comm,uid,gid,tid,rss,some
other attributes" (this is a very basic format you can remove if
needed).
   - `--cut-n 4`: Cut the log to 4 lines per entry.
   - `--show-context`: Show the context of the audit line.
- `-p 'a'`: Only show auditable events (i.e., "all" event type in this
case, but you can change it).
   - `--max-size=100000`: Limit the log size to 1 MB.
- `-c`: This option is not commonly used with auditd and is only
necessary for some custom auditing configuration.

3. Update the service file:
```bash
sudo systemctl enable auditd
```
4. Start the Auditd Service if you are using `systemctl` (recommended):
```bash
sudo systemctl start auditd
```

5. Check if the auditd service was started successfully:
```bash
sudo auditctl -t stat | grep "auditd"
```
You should see something like `0: 1 Mon Feb 28 14:30:00 2023 auditd
starting`.
