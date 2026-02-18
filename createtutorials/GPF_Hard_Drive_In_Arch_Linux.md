**Title:** GPF Hard Drive In Arch Linux
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** GPF_Hard_Drive_In_Arch_Linux.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

# Guide to Partitioning, Formatting, and Mounting Your Hard Drive on Arch Linux
=============================================

## Introduction
---------------

Congratulations on choosing Arch Linux as your operating system! As an
experienced IT specialist, I'm here to guide you through the process of
partitioning, formatting, and mounting your hard drive using
cfdisk Disk Utility.

### Step-by-Step Guide

1. **Identify Your Hard Drive**
---------------------------

* Open a terminal and run the command `lsblk` and look for the device
name that starts with `/dev/sdX`, where X is a letter (e.g., /dev/sda,
/dev/sdb, etc.). For example, if you have an SSD labeled as
`/dev/sda`, you would type `lsblk -o NAME,FSTYPE at the terminal.`

2. **Launch cfdisk**

* Open a terminal and run the command `sudo cfdisk /dev/sdX` in the
terminal. Replace `/dev/sdb1` with the actual path to your hard drive
(e.g., `sudo cfdisk /dev/sda1`).

3. **Select Your Partition Size and Format Type**

* Select the desired partition size and format type for each partition.
You can choose from a variety of options, including:
	+ Filesystem types: ext4, xfs, etc.
	+ Partition sizes: 30GB, 50GB, 75GB, etc.

### Formatting and Mounting Your Hard Drive

After successfully partitioning and formatting your hard drive, it's
time to mount it using the `mkfs` command. Verify Your Mount:

* After mounting your partition, verify that everything is working
correctly by typing `df -h` in the terminal.

## Additional Tips and Considerations

Make sure to backup all important data before starting the process.
Avoid overwriting any existing data on your hard drive.
Be cautious when creating large partitions; make sure to leave enough
space for future expansion.
If you're unsure about anything, feel free to ask and I'll be happy to
help.

---

**Excel Format:**
--------------
================================================================================================================================================================================
| **Section Title**               | **Content**          | **Additional Notes** |                                                                                              |
| -----------------               | -----------          | -------------------- | -------------------------------------------------------------------------------------------- |
| Hard Drive Information          |                      |                      |                                                                                              |
| Device Name                     | /dev/sda             |                      |                                                                                              |
| Mount Point                     | /mnt/ArchLinux       |                      |                                                                                              |
| Partition Size                  |                      |                      |                                                                                              |
================================================================================================================================================================================
| **Step-by-Step Guide**                                                                                                                                                       |
| ------------------------------------------------------ | -------------------- | -------------------------------------------------------------------------------------------- |
| Identify Your Hard Drive       | Open terminal, run `lsblk` and look for `/dev/sdX` device --------------------------------------------------------------------------------- |
| Launch cfdisk                  | Run `sudo cfdisk /dev/sdx1`                  | Replace with actual path to your hard drive (e.g., `sudo cfdisk /dev/sda1`)                  |
| Select Partition Size & Format Type                    | Choose desired partition size and format type, e.g. ext4 or xfs                                                     |
| Formatting & Mounting                                  | After successful partitioning & formatting, mount using `mkfs` command | Verify mount by typing `df -h` in terminal |
================================================================================================================================================================================
Note: The Excel output is organized with clear section titles and data
aligned correctly.
