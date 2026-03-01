**Title:** Partition FHD Util Cfdisk Arch
**Date:** 2025-11-16 (23:26:26 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Partition_FHD_Util_Cfdisk_Arch.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Partitioning and Formatting a Hard Drive with cfdisk Utility in Arch
Linux

## Introduction

In this tutorial, we will walk you through the process of partitioning
and formatting a hard drive using the cfdisk utility in Arch Linux.
This guide is designed for users who are comfortable with basic computer
hardware and operating systems.

## Required Dependencies

- Arch Linux
- cfdisk utility (part of the Arch Linux installation)

## Required Commands Definitions

- `cfdisk`: A disk partitioning utility used to create, modify, and
delete partitions on a hard drive.
- `lsblk`: A command used to list all block devices (hard drives, etc.)
connected to the system.

## Estimated Time

Approximately 30 minutes to complete this tutorial, depending on your
level of experience with computer hardware and operating systems.

## Skill Level

* Beginner: Familiarity with basic computer hardware and operating
systems.
* Intermediate: Experience with Linux distributions and command-line
interfaces.
* Advanced: Knowledge of advanced disk partitioning techniques and
troubleshooting methods.

### Step-by-Step Instructions

#### 1. Back Up Your Data

Before starting the partitioning process, make sure to back up your
important files and data. You can use the `dd` command or a third-party
backup tool to create backups of your data.

#### 2. Disconnect Your Hard Drive

Disconnect your hard drive from your computer using one of the following
methods:

* Using the power button: Unplug the power cord connected to the hard
drive.
* Using the SATA switch: If you have an SATA switch on your motherboard,
use it to disconnect the hard drive from the system.

#### 3. Identify Your Hard Drive

Locate your hard drive and identify its device name using `lsblk`. You
can do this by running the following command:

```bash
lsblk
```

Once you know the device name of your hard drive, you can use the
`cfdisk` utility to access it.

#### 4. Create a New Partition

Run the `cfdisk` utility and select "Create" from the menu. Choose the
partition type as "Linux Filesystem" (default).

* For Linux Filesystems, you will see an option to create a new
partition.
* Select the partition size based on your needs.

#### 5. Format Your Partition

Select the partition you created in step 4 and choose the file system
type. You can choose from various file systems such as ext4, xfs, or
reiserfs.

For example:

```bash
cfdisk /dev/sda1
```

Format your partition using the following command:

```bash
mkfs.ext4 /dev/sda1
```

#### 6. Create a New Partition (Optional)

If you want to create an additional partition for data, repeat steps
4-5.

* For Linux Filesystems, select "Create" and choose the file system
type.
* Format your new partition using the following command:

```bash
mkfs.ext4 /dev/sda2
```

#### 7. Verify Your Partition

Verify that your hard drive is successfully partitioned by running the
`df` command:

```bash
df -h
```

This will display information about the mounted file systems on your
system.

#### 8. Set Up File Systems

Create a new file system for your data and mount it using the following
commands:

* For ext4, run:

```bash
mkfs.ext4 /dev/sda2
```

Mount the partition using:

```bash
sudo mkdir -p /mnt/data
sudo mount /dev/sda2 /mnt/data
```

#### 9. Configure Mount Points

Configure the mount points for your data by adding them to the
`/etc/fstab` file.

* For ext4, add the following lines to the ` fstab` file:

```bash
UUID=<your UUID> /mnt/data ext4 defaults 0 2
```

Replace `<your UUID>` with your actual UUID.

### Additional Tips and Troubleshooting Advice

* Make sure to back up your data regularly to avoid losing important
files.
* Use a third-party backup tool or service to ensure that all your data
is safely backed up.
* If you encounter any issues during the partitioning process, refer to
the `cfdisk` documentation for troubleshooting advice.

By following these steps and using the provided commands, you should be
able to successfully partition and format your hard drive using the
cfdisk utility in Arch Linux.
