**Title:** Formatting a Hard Drive Using (fdisk/cfdisk) on Arch Linux
**Author:** Sr. Yididiel Hills Arch Linux AMD, Developer
**Date:** November, 18-11-2025 (00:17:22 IST)
**lfnc:** FHD_Prompt_BestResults_Deep-v3_1_671b_cloud.md
**Copyright:** © 2025–2026 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

**I ran this prompt and got a much better  result.**

echo "Formatting a Hard Drive using fdisk Disk Utility on Arch-Linux. Im
using cfdisk and pacman package manager" | fabric --model
deepseek-v3.1:671b-cloud

Here's a comprehensive guide to formatting a hard drive using `fdisk` or
`cfdisk` on Arch Linux.

## 1. Install Necessary Tools

First, ensure you have the necessary tools installed:

```bash
sudo pacman -S fdisk parted dosfstools ntfs-3g
```

## 2. Identify the Drive

List all connected storage devices:

```bash
sudo fdisk -l
```

Or use `lsblk` for a simpler view:

```bash
lsblk
```

You'll see output like:
```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda     8:0    0 238.5G  0 disk
├─sda1  8:1    0   512M  0 part /boot
└─sda2  8:2    0   238G  0 part /
sdb     8:16   0   1.8T  0 disk
```

## 3. Using cfdisk (Recommended for beginners)

For the target drive (e.g., `/dev/sdb`):

```bash
sudo cfdisk /dev/sdb
```

### In cfdisk:
1. Use arrow keys to navigate
2. Select "New" to create a new partition
3. Choose "Primary" or "Logical" as needed
4. Set partition size
5. Select "Type" and choose the filesystem type (e.g., Linux, FAT32,
NTFS)
6. Select "Write" to apply changes
7. Select "Quit" to exit

## 4. Using fdisk (Traditional method)

```bash
sudo fdisk /dev/sdb
```

### Common fdisk commands:
- `n` - Create new partition
- `d` - Delete partition
- `t` - Change partition type
- `p` - Print partition table
- `w` - Write changes and exit
- `q` - Quit without saving

### Example workflow in fdisk:
```
Command (m for help): n
Partition type: p (primary), e (extended), l (logical)
Partition number: 1
First sector: (press Enter for default)
Last sector: (press Enter for default or specify size like +50G)

Command (m for help): t
Selected partition 1
Hex code: 83 (for Linux), 7 (for NTFS), b (for FAT32), etc.

Command (m for help): w
```

## 5. Format the Partition

After creating partitions, format them:

### For Linux filesystem (ext4):
```bash
sudo mkfs.ext4 /dev/sdb1
```

### For FAT32:
```bash
sudo mkfs.fat -F32 /dev/sdb1
```

### For NTFS:
```bash
sudo mkfs.ntfs /dev/sdb1
```

### For Btrfs:
```bash
sudo mkfs.btrfs /dev/sdb1
```

## 6. Mount the Partition

Create a mount point and mount the partition:

```bash
sudo mkdir /mnt/mydrive
sudo mount /dev/sdb1 /mnt/mydrive
```

## 7. Automatic Mounting at Boot

Edit `/etc/fstab` to auto-mount at boot:

```bash
sudo nano /etc/fstab
```

Add a line like:
```
/dev/sdb1   /mnt/mydrive   ext4   defaults   0   2
```

## 8. Verify the Setup

Check if the partition is mounted correctly:

```bash
df -h
lsblk
```

## Important Notes:

- **⚠️ Warning**: Double-check the device name (`/dev/sdX`) to avoid
formatting the wrong drive
- Replace `/dev/sdb` with your actual device name
- The first partition on the drive will be `/dev/sdb1`, second will be
`/dev/sdb2`, etc.
- Unmount any mounted partitions before modifying: `sudo umount
/dev/sdb1`

## Alternative: Using GNU Parted

You can also use `parted` for more advanced operations:

```bash
sudo parted /dev/sdb
(parted) mklabel gpt
(parted) mkpart primary ext4 1MiB 100%
(parted) quit
```

This guide should help you successfully format a hard drive using
command-line tools on Arch Linux.
