# Shell startup error: /bin/sh line 1: tuigreet: not found

**Session ID:** ses_3c875b4faffeS3aQ5Bx3iW02pp
**Created:** 2/7/2026, 11:58:56 AM
**Updated:** 2/7/2026, 12:07:07 PM

---

## User

When rebooting the OS I recieved this error message:""" /bin/sh line 1: tuigreet: not found.

---

## Assistant (Sisyphus · kimi-k2.5-free · 11.4s)

_Thinking:_

The user is getting an error "tuigreet: not found" when rebooting their OS. This is a system-level issue related to a display manager or greeting program that's not found during boot.

TUIgreet is a TUI (Terminal User Interface) greeter for display managers, commonly used with greetd (a minimal display manager). The error indicates that the system is trying to run tuigreet but can't find the executable.

This is a system configuration issue, not a coding task. I should help the user troubleshoot this. Let me ask some clarifying questions to understand their setup better so I can provide helpful guidance.

Actually, let me think about what would be most helpful:
1. This is likely a Linux system (given /bin/sh path)
2. tuigreet is typically used with greetd display manager
3. The error suggests the binary is missing or not in PATH

I should ask what OS/distro they're using and what display manager setup they have, then provide troubleshooting steps.

This error means your system is configured to use `tuigreet` (a TUI greeter for `greetd` display manager) but the binary can't be found.

**Quick questions to help diagnose:**
1. What Linux distribution are you using?
2. Did you recently uninstall packages or modify display manager settings?

**Common fixes:**

**If tuigreet was accidentally uninstalled:**
```bash
# Arch Linux
sudo pacman -S greetd-tuigreet

# Or manually build if not in repos
cargo install tuigreet
```

**If you want to use a different greeter:**
Edit `/etc/greetd/config.toml` and change the `command` line:
```toml
# Change from:
command = "tuigreet --cmd sway"
# To something available, like:
command = "agreety --cmd bash"
```

**If greetd is misconfigured:**
You can temporarily disable it to get a TTY login:
```bash
sudo systemctl disable greetd
# Reboot, then fix the config
```

What distro are you on, and do you want to restore tuigreet or switch to a different greeter?

---

## User

What Linux distribution are you using? archcraft. Did you recently uninstall packages or modify display manager settings? yes I did a restore from timeshift

---

## Assistant (Sisyphus · kimi-k2.5-free · 9.3s)

_Thinking:_

The user is using Archcraft and did a Timeshift restore. The error is `tuigreet: not found`. This means the `tuigreet` package was likely not restored or was removed during the restore process.

Archcraft is an Arch-based distribution that uses `greetd` with `tuigreet` as the display manager/greeter. When they restored from Timeshift, the `tuigreet` binary might not have been included in the snapshot, or the package database got out of sync.

Let me help them fix this. The solution is to:
1. Get to a TTY (Ctrl+Alt+F2 or F3)
2. Install tuigreet
3. Or re-enable the display manager properly

Since they're in a broken state, I should give them step-by-step recovery instructions.

**The issue:** Timeshift restores files but doesn't always restore the package database state. `tuigreet` got removed or wasn't in the snapshot, but `greetd` is still configured to use it.

**Recovery steps:**

1. **Get to a TTY:** Press `Ctrl+Alt+F2` (or F3, F4) to get a text login prompt

2. **Login with your username/password**

3. **Reinstall tuigreet:**
```bash
sudo pacman -S greetd-tuigreet
```

4. **If that fails, try rebuilding the package cache:**
```bash
sudo pacman -Sy
sudo pacman -S greetd-tuigreet
```

5. **Re-enable greetd if needed:**
```bash
sudo systemctl enable greetd
```

6. **Reboot:**
```bash
sudo reboot
```

**If you can't get a TTY or login fails:**

Boot into Arch ISO USB, mount your system, and `arch-chroot`:
```bash
# From live USB
sudo mount /dev/nvme0n1p2 /mnt  # adjust partition
sudo arch-chroot /mnt
pacman -S greetd-tuigreet
exit
reboot
```

Did the TTY method work, or do you need the chroot approach?

---

## User

re-enable the display manager properly

---

## Assistant (Sisyphus · kimi-k2.5-free · 6.5s)

_Thinking:_

The user wants to properly re-enable the display manager after restoring from Timeshift. Let me provide the proper steps to ensure greetd/tuigreet is correctly configured and enabled.

I should cover:
1. Checking current status
2. Properly enabling the service
3. Checking the configuration
4. Making sure it's set to start on boot

Let me give them a comprehensive but concise guide.

**Properly re-enabling greetd:**

```bash
# 1. Check if greetd is installed
systemctl status greetd

# 2. Enable to start on boot
sudo systemctl enable greetd

# 3. Start it now (or reboot)
sudo systemctl start greetd

# 4. Verify it's enabled
systemctl is-enabled greetd
```

**If you want to switch to a different display manager instead:**

```bash
# Disable greetd first
sudo systemctl disable greetd
sudo systemctl stop greetd

# Install and enable an alternative (e.g., SDDM for KDE, LightDM, etc.)
sudo pacman -S sddm
sudo systemctl enable sddm
sudo systemctl start sddm
```

**Verify the config is correct:**
```bash
cat /etc/greetd/config.toml
```
Should show `command = "tuigreet ..."` if using tuigreet.

Run those commands and let me know the output of `systemctl status greetd`.

---

## User

sudo pacman -S greetd-tuigreet
resolving dependencies...
error: could not open file /var/lib/pacman/local/base-3-2/desc: No such file or directory
error: could not open file /var/lib/pacman/local/bat-cat-git-r3689.8664cc9d-1/desc: No such file or directory
error: could not open file /var/lib/pacman/local/breezy-3.3.20-1/desc: No such file or directory
error: could not open file /var/lib/pacman/local/greetd-dms-greeter-git-1.2.0.189.g3d80a9dd-1/desc: No such file or directory
error: could not open file /var/lib/pacman/local/noctalia-shell-4.3.3-1/desc: No such file or directory
error: could not open file /var/lib/pacman/local/opencode-bin-1.1.51-1/desc: No such file or directory
error: could not open file /var/lib/pacman/local/python-wcwidth-0.5.3-1/desc: No such file or directory
looking for conflicting packages...
error: could not open file /var/lib/pacman/local/zotero-8.0.1-1/desc: No such file or directory

Packages (1) greetd-tuigreet-0.9.1-1

Total Download Size:   1.27 MiB
Total Installed Size:  4.05 MiB

:: Proceed with installation? [Y/n] 

---

## Assistant (Sisyphus · kimi-k2.5-free · 8.6s)

_Thinking:_

The user's pacman database is corrupted from the Timeshift restore. The `/var/lib/pacman/local/` directory contains package metadata, and many packages are missing their `desc` files. This is a common issue when restoring with Timeshift - it restores files but the package database gets out of sync.

I should tell them to:
1. Proceed with the installation (it should work)
2. Then fix the pacman database with `pacman -Qk` and `pacman -Syyu` or potentially `pacman -S --overwrite '*' pkgname` if needed
3. Or rebuild the database entirely

Actually, the safest approach is:
1. Proceed with installing greetd-tuigreet (type Y)
2. Then run `sudo pacman -Syyu` to refresh and update
3. If issues persist, they may need to reinstall the packages that have broken desc files or use `pacman -Qkk` to check integrity

Let me give them the immediate fix and the database repair steps.

**Your pacman database is corrupted from the Timeshift restore.** The package metadata in `/var/lib/pacman/local/` is missing for several packages.

**Immediate fix:**

1. **Proceed with the installation** - type `Y` and hit Enter. It should still install `greetd-tuigreet`.

2. **After installation, repair the database:**
```bash
# Reinstall packages with missing desc files to fix database
sudo pacman -S --overwrite '*' base bat breezy greetd-dms-greeter noctalia-shell opencode-bin python-wcwidth zotero

# Or force refresh everything
sudo pacman -Syyu
```

3. **If the above still has errors, rebuild the database:**
```bash
# Nuclear option - rebuild package database
sudo rm -rf /var/lib/pacman/local/*
sudo pacman -Syy
sudo pacman -S $(pacman -Qnq)  # Reinstall all packages
```

**For now:** Just proceed with `Y` to install `greetd-tuigreet`, then we'll fix the database.

What happens when you press Y?

---

