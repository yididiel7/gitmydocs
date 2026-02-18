**Title:** Understanding the Command sudo cfdisk l
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Understanding_the_Command_sudo_cfdisk_l.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Understanding the Command: sudo cfdisk -l

The command sudo cfdisk -l is used in Linux systems to list the
partitions on all available disks. Here’s a breakdown of what each part
of the command does:
Breakdown of the Command

sudo: This prefix allows the command to be executed with superuser
(administrative) privileges. Since partitioning and disk management
require elevated permissions, sudo is necessary.

cfdisk: This is a text-based partition table manipulator for Linux. It
provides a user-friendly interface for managing disk partitions.

-l: This option stands for "list." It instructs cfdisk to display a list
of all known disks and their partitions, including information such as
the partition name, size, and filesystem type.

What the Command Does

When you run sudo cfdisk -l, it will:

    List all available storage devices on your system.
    Display details about each device's partitions, such as:
        Device names (like /dev/sda, /dev/sdb)
        Partition sizes
        Filesystem types

This command is particularly useful for getting an overview of the disk
setup before performing any partitioning or formatting tasks.
Example Output

You might see output resembling:

Code

Disk /dev/sda: 500.1 GB, 500107862016 bytes
  Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *          2048      102604      102400   83  Linux
/dev/sda2          102605    500117503    499984026   5  Extended
/dev/sda5          102606      204703      510000   83  Linux

This output indicates the partitions on the /dev/sda device, including
bootable partitions, their sizes, and filesystem types.
