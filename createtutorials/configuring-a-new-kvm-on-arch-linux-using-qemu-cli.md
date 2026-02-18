Configuring a New KVM on Arch Linux Using QEMU CLI
configuring-a-new-kvm-on-arch-linux-using-qemu-cli.md

Commands:
mkdir kvm
mv /path/to/linux-distro.iso ./kvm
qemu-img create -f qcow2 Image.img 20G
qemu-system-x86_64 -enable-kvm -cdrom linux-distro.iso -boot menu=on
-drive file=Image.img -m 4G -cpu host -vga virtio -display sdl,gl=on
qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=Image.img -m 4G
-cpu host -vga virtio -display sdl,gl=on

What you will learn:
1. How To create a KVM on Arch Linux from the command line
2. How to use qemu commands
3. How to create a separate directory for the virtual machine and move
the downloaded OS ISO file to the newly created folder
4. How to create a 20G image file that will store the KVM's data
5. How to start the virtual machine using commands
6. How to configure the amount of memory you want to allocate to the KVM
