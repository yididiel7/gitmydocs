Here's a step-by-step guide on formatting a hard drive using `cfdisk` in
Arch Linux:

**Prerequisites:**

* You have installed Arch Linux.
* You have an unformatted hard drive that you want to format.
* You know the device path of your hard drive, e.g., `/dev/sdb`.

**Step 1: Unmount the hard drive (umount)**

Before formatting the hard drive, you need to unmount it. This will
allow you to reformat the disk.

```bash
umount /dev/sdb
```

**Step 2: Format the hard drive**

Now that the hard drive is unmounted, you can format it using `cfdisk`.
You'll need to create a new partition and set the file system type.
Let's use ext4 as the file system type.

```bash
cfdisk /dev/sdb
```

**Step 3: Create a new partition (n)**

In the cfdisk menu, select "New" and enter the desired partition size
(e.g., 1 GB). You'll need to choose the part of the hard drive where you
want to create the partition.

* Partition 1 (first partition): `/dev/sdb1`
* Partition 2 (second partition): `/dev/sdb2`

**Step 4: Set the file system type**

In the "Partition" menu, select the partition that you created in Step
3. Then, click on the "File System" button and enter `ext4` as the file
system type.

```bash
cfdisk /dev/sdb1
```

**Step 5: Create a mount point (e.g., `/mnt`)**

In the cfdisk menu, select "Mountpoint" and enter a desired location for
your mounted partition. Let's create a new directory called `/mnt`.

* Mountpoint `/mnt`: `y`
* Reboot system: `n`

**Step 6: Verify the format (mkfs)**

After creating the mount point and setting the file system type, you can
verify that the hard drive is formatted using `mkfs`:

```bash
mkfs.ext4 /dev/sdb1
```

**Step 7: Mount the hard drive**

To use your newly formatted hard drive, follow these steps:

```bash
mount /dev/sdb1 /mnt
```

This will mount the hard drive at `/mnt`.

Congratulations! Your Arch Linux system is now up and running on the
formatted hard drive.

Note: Make sure to replace `/dev/sdb` with the actual device path of
your hard drive.
