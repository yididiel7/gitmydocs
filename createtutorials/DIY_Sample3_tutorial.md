**Title:** DIY Sample3 Tutorial
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** DIY_Sample3_tutorial.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

**IDENTITY AND PURPOSE**

As an AI assistant, my role in completing this DIY tutorial is to guide
users through the process of partitioning a hard drive using cfdisk Disk
Utility on Arch-Linux. I will provide step-by-step instructions, format
the output clearly, and include examples from the prompt to ensure
accessibility.

**STEP-SIZE-INSTRUCTIONS**

1. **Install required dependencies**: Install the cfdisk package manager
(pacman) and Disk Utility (cfdisk) on your Arch-Linux system.
```
sudo pacman -S cfdisk
```

2. **Configure system settings**: Update your system's time and date,
and set your locale to 'en_US.UTF-8'.
```bash
sudo timedatectl update-timezone
sudo locale-gen en_US.UTF-8
```

3. **Create a new partition**: Create a new primary partition using
cfdisk.
```
sudo cfdisk /dev/sda1
```

4. **Format the partition**: Format the newly created partition with a
suitable file system (e.g., ext4).
```
sudo mkfs.ext4 /dev/sda1
```

5. **Create a new partition on another device**: Create a new primary
partition on another disk, for example, `/dev/sdb1`.
```bash
sudo cfdisk /dev/sda2
```

6. **Format the second partition**: Format the newly created partition
with a suitable file system (e.g., ext4).
```
sudo mkfs.ext4 /dev/sda2
```

7. **Verify partitions**: Verify that both partitions are now mounted
and can be accessed by opening a terminal and running `lsblk`.
```
lsblk -f
```

**OUTPUT INSTRUCTIONS**

### OUTPUT

#### PARTITIONING A HARD DRIVE USING CFDISK DISK UTILITY ON ARCH-LINUX

This tutorial guides you through the process of partitioning a hard
drive using cfdisk Disk Utility on Arch-Linux.

#### REQUIRED DEPENDENCIES

* cfdisk package manager (pacman)
* Disk Utility (cfdisk)

#### INSTALLATION COMMANDS

```bash
sudo pacman -S cfdisk
```

#### ESTIMATED TIME

The estimated time required to complete this tutorial is approximately
30 minutes.

#### SKILL LEVEL

This tutorial requires an intermediate level of technical skills and
familiarity with Arch-Linux system administration.

### EXAMPLE

Here's an example of what the terminal output might look like:
```
# Partitioning a hard drive using cfdisk Disk Utility on Arch-Linux
Target device: /dev/sda1
Partition table:
/dev/sda1 (primary): 1004 MB free, 600 MB in use (34.6%)
/dev/sdb1 (primary): 200 GB available, 180 GB used (90%)

Create new partition on /dev/sdb1:
/dev/sdb1 (primary): 20 GB available, 10 GB used (50%)

Verify partitions:
lsblk -f
```

Note: The specific steps and output may vary depending on the system
configuration.
