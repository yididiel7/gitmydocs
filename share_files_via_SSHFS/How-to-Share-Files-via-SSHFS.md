**Title:** How to Share Files via SSHFS On Arch-Linux
**Date:** 2026-02-15 (17:56:36 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin
**lfnc:** How-to-Share-Files-via-SSHFS.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details


sshfs is covered, which is a fuse-based solution that enables you 
to quickly share directories on your network.

`$ mkdir remote_z170p`

Created a Directory on Z170-P PC-2

`$ mkdir ~/z170p = /home/srhills/z170p

CONNECTION TYPE: sshfs

`$ sshfs srhills@192.168.10.228:/home/srhills/z170p remote_z170p

`$ mount

[Note]: Shows the Fused Connection at the Bottom of the command output.

srhills@192.168.10.228:/home/srhills/z170p on /home/srhills/remote_z170p 
type fuse.sshfs (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)

Network Remote PC Z170p

❯ touch ~/z170p/01_Header-Fields-Template-Error.md

❯ cd

❯ ls z170p/
.rw-r--r-- 0 15 Feb 16:18  01_Header-Fields-Template-Error.md

Station PC: srhills@archcraft 04:19:29 PM
❯ 

[Now on the Main PC-SERVER]

Local Minipc PCPN62

`❯ ls remote_z170p` 
~                                                         03:52:05 PM
`❯ ls remote_z170p/`

 01_Header-Fields-Template-Error.md

Lastly to umout the remote_z170p

`$ umount remote_z170p`

