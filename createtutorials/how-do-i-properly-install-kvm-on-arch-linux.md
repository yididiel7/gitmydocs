**Title:** How Do I Properly Install KVM on Arch Linux
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** how-do-i-properly-install-kvm-on-arch-linux.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

URL Source: https://sysguides.com/install-kvm-on-linux

Published Time: 2021-10-17T00:36:32+05:30

Markdown Content:
The**K**ernel-based**V**irtual**M**achine (KVM) is a Linux hypervisor
that supports full virtualization. When you install KVM on Linux, your
Linux distribution is transformed into a Type-1 hypervisor, allowing you
to run virtual machines at near-host machine speeds.

A Type-1 hypervisor, also known as a bare-metal hypervisor, interacts
with the underlying machine hardware directly rather than through an
operating system.

In this article, I'll show you how to properly install KVM on Linux
distributions such as Fedora, Rocky, Ubuntu, Debian, and Arch Linux.

Table of Contents
-----------------

*   [1. Overview of Key KVM
Components](https://sysguides.com/install-kvm-on-linux#0-01-overview-of-key-kvm-components)
*   [1.1. KVM Kernel
Modules](https://sysguides.com/install-kvm-on-linux#11-kvm-kernel-modules)
    *   [1.2. QEMU](https://sysguides.com/install-kvm-on-linux#12-qemu)
*   [1.3.
Libvirt](https://sysguides.com/install-kvm-on-linux#13-libvirt)

*   [2. Check Virtualization
Support](https://sysguides.com/install-kvm-on-linux#1-02-check-virtualization-support)
*   [3. Install KVM on Linux
Distributions](https://sysguides.com/install-kvm-on-linux#2-03-install-kvm-on-linux-distributions)
*   [4. Install VirtIO Drivers for Windows
Guests](https://sysguides.com/install-kvm-on-linux#3-04-install-virtio-drivers-for-windows-guests-)

Discover more

operating system

OS

operating systems

libvirtd

virtual machines

LIBVIRT

virtualizer

Installation

hypervisor

kvm

*   [5. Enable the Modular libvirt
Daemon](https://sysguides.com/install-kvm-on-linux#4-05-enable-the-modular-libvirt-daemon-)
*   [6. Validate Host Virtualization
Setup](https://sysguides.com/install-kvm-on-linux#5-06-validate-host-virtualization-setup-)
*   [7. Optimize the Host with
TuneD](https://sysguides.com/install-kvm-on-linux#6-07-optimize-the-host-with-tuned)
*   [8. Configure a Network
Bridge](https://sysguides.com/install-kvm-on-linux#7-08-configure-a-network-bridge)
*   [9. Give the User System-Wide
Permission](https://sysguides.com/install-kvm-on-linux#8-09-give-the-user-system-wide-permission-)
*   [10. Set ACL on the Images
Directory](https://sysguides.com/install-kvm-on-linux#9-10-set-acl-on-the-images-directory)
*   [11.
Conclusion](https://sysguides.com/install-kvm-on-linux#10-11-conclusion-)
*   [12. Watch on
YouTube](https://sysguides.com/install-kvm-on-linux#10-11-conclusion-)

1. Overview of Key KVM Components
---------------------------------

Before you can install KVM on Linux, you must first understand the three
key components of KVM virtualization and how they work together to make
virtual machines run faster.

Here is a quick overview:

### 1.1. KVM Kernel Modules

At the heart of KVM virtualization are its kernel modules. They consist
of a loadable kernel module kvm.ko, which provides the core
virtualization infrastructure, and a processor-specific kernel module
kvm-intel.ko(Intel) or kvm-amd.ko(AMD).

The kernel modules will use the hardware-assisted virtualization
capabilities of the CPU (Intel VT-x or AMD-Vi) to transform Linux into a
Type-1 hypervisor. This allows you to run guest operating systems at
speeds close to those of the host machine.

Discover more

operating system

OS

operating systems

LIBVIRT

KVM kernel

Virtualization

V</strong>irtual&nbsp;<strong>M</strong>achine

device {&quot;driver

Kernel

hypervisor

However, since the kernel modules have no interface, they provide all
the resources needed to manage the virtualization to the user-space
software.

### 1.2. QEMU

At the user-space level, it is managed
by[QEMU](https://en.wikipedia.org/wiki/QEMU)(**Q**uick**EMU**lator).
QEMU is a generic and open source machine emulator and virtualizer. It
provides hardware emulation, like hard disks, network cards, VGA, PCI,
etc., and a low-level interface to the virtual machine.

QEMU alone can emulate an entire machine, including a processor and
various devices in the software, with no need for hardware-assisted
virtualization. As an emulator, QEMU may thus target a broad range of
computer architectures, from conventional x86-64 PCs to architectures
such as ARM, MIPS, SPARC, and others. For example, on your host PC with
an x86_64 board, you can run a virtual machine that can emulate the
Raspberry Pi with a raspi3b board. Since this emulation happens entirely
through software, it will be accurate but slow.

But when QEMU is paired with KVM, it’s a different story altogether. In
the QEMU-KVM setup, QEMU focuses on emulating hardware devices while
allowing the hypervisor (KVM kernel modules) to manage the CPU. With
hypervisor support, QEMU may reach virtual machine CPU performance as
near to that of the host computer.

### 1.3. Libvirt

Libvirt is a software suite that provides various tools to manage
virtual machines and other virtualization functionality. These tools
include an open-source API, a daemon, and a command-line utility
`virsh`.

Some of the key capabilities of libvirt include virtual machine
management, remote machine support, storage management, network
interface management, as well as virtual NAT and route-based network
management.

Discover more

operating system

operating systems

OS

installing

virtualization

install

K</strong>ernel-based&nbsp;<strong>V</strong>irtual&nbsp;<strong>M</strong>achine

VM

Installation

virtual machine

Libvirt also provides a common means of managing multiple different
virtualization platforms. Supported virtualization platforms include
QEMU/KVM, Bhyve, Hyper-V, LXC, OpenVZ, PowerVM, UML, VMware ESXi and
GSX, VMware Workstation, VirtualBox, and Xen.

2. Check Virtualization Support
-------------------------------

Check if your hardware supports KVM virtualization. If your hardware
isn't supported, you'll get errors when trying to run a virtual machine.

Your processor must support [hardware-assisted
virtualization](https://en.wikipedia.org/wiki/Hardware-assisted_virtualization).
It will either be Intel's VT-x or AMD's AMD-V.

```
$ lscpu | grep Virtualization
Virtualization:          VT-x
```

I'm using an Intel processor. So I'm getting VT-x as output. If you have
an AMD processor, the output should be AMD-V.

If the output is blank, the hardware virtualization extension is most
likely disabled in the BIOS/UEFI. Before proceeding, enable it. It will
be located in the CPU configuration section.

Next, ensure that your kernel includes KVM modules.

```
## For Arch Linux
$ zgrep CONFIG_KVM /proc/config.gz

## For Other Distros
$ zgrep CONFIG_KVM /boot/config-$(uname -r)
CONFIG_KVM_GUEST=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
CONFIG_KVM_AMD=m
CONFIG_KVM_AMD_SEV=y
CONFIG_KVM_XEN=y
CONFIG_KVM_EXTERNAL_WRITE_TRACKING=y
```

Discover more

OS

operating systems

operating system

drivers

KVM

Kernel

Installation

installation

Virtualization

libvirt

The module is only available if it is set to y or m. If both steps are
successful, proceed with the installation of KVM.

3. Install KVM on Linux Distributions
-------------------------------------

To use KVM virtualization on Linux, you'll need 1) KVM kernel modules,
2) QEMU, and 3) the Libvirt software suite. Since Linux already includes
KVM kernel modules, you just have to install QEMU and Libvirt to use the
KVM hypervisor. However, there are a number of other virtualization
management packages that are recommended when using virtualization.

****Fedora / Rocky Linux:****

```
$ sudo dnf install qemu-kvm libvirt virt-install virt-manager virt-viewer \
    edk2-ovmf swtpm qemu-img guestfs-tools libosinfo tuned
```

****Ubuntu / Debian Linux:****

```
$ sudo apt install qemu-system-x86 libvirt-daemon-system virtinst \
    virt-manager virt-viewer ovmf swtpm qemu-utils guestfs-tools \
    libosinfo-bin tuned
```

****Arch Linux:****

`$ sudo pacman -S qemu-full libvirt virt-install virt-manager
virt-viewer \    edk2-ovmf swtpm qemu-img guestfs-tools libosinfo$ yay
-S tuned`
A brief description of the packages listed above.

*   qemu-kvm/qemu-system-x86/qemu-full:A user-level KVM emulator that
facilitates communication between hosts and VMs.
*   libvirt/libvirt-daemon-system:A daemon that manages virtual machines
and the hypervisor as well as handles library calls.
*   virt-install/virtinst:A command-line tool for creating guest virtual
machines.
*   virt-manager:A graphical tool for creating and managing guest
virtual machines.
*   virt-viewer:A graphical console for connecting to a running virtual
machine.
*   edk2-ovmf/ovmf: Enables UEFI support for Virtual Machines.
*   swtpm: A TPM emulator for Virtual Machines.
*   qemu-img/qemu-utils:Provides tools to create, convert, modify, and
snapshot offline disk images.
*   guestfs-tools:Provides a set of extended command-line tools for
managing virtual machines.
*   libosinfo/libosinfo-bin:A library for managing OS information for
virtualization.
*   tuned:A system tuning service for Linux.

4. Install VirtIO Drivers for Windows Guests
--------------------------------------------

VirtIO drivers are para-virtualized drivers for KVM guests.
Unfortunately, Microsoft does not provide VirtIO drivers. If you want to
create a Microsoft Windows virtual machine, you need to download the
virtio-win.iso image, which contains the VirtIO drivers for the Windows
operating system.

**Fedora / Rocky Linux:**

Install the VirtIO repository.

```
$ sudo wget https://fedorapeople.org/groups/virt/virtio-win/virtio-win.repo \
    -O /etc/yum.repos.d/virtio-win.repo
```

The virtio-win package can now be installed.

`$ sudo dnf install virtio-win`
The virtio-win.iso file will be saved in
the/usr/share/virtio-win/directory.

**Ubuntu / Debian / Arch Linux**:

For Linux distributions that are not based on Red Hat, you can directly
download the stable version of virtio-win.iso.

`$ wget
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso`
When you create a Windows VM, you need to attach this ISO image to a
CD-ROM. It includes all the VirtIO drivers necessary for Windows OS
installation.

Check out
this[repository](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/)for
a complete list of drivers, both old and new.

5. Enable the Modular libvirt Daemon
------------------------------------

There are two types of[libvirt
daemons](https://libvirt.org/daemons.html): monolithic and modular. The
type of daemon(s) you use affects how granularly you can configure
individual virtualization drivers.

The traditional monolithic libvirt daemon,libvirtd, manages a wide range
of virtualization drivers via centralized hypervisor configuration.
However, this may result in inefficient use of system resources.

In contrast, the newly introduced modular libvirt provides a specific
daemon for each virtualization driver. As a result, modular libvirt
daemons offer more flexibility in fine-tuning libvirt resource
management.

While most Linux distributions have started to offer a modular option,
at the time of writing, Ubuntu and Debian continue to offer only a
monolithic daemon.

**Fedora / Rocky / Arch Linux**:

```
$ for drv in qemu interface network nodedev nwfilter secret storage; do \
    sudo systemctl enable virt${drv}d.service; \
    sudo systemctl enable virt${drv}d{,-ro,-admin}.socket; \
  done
```

**Ubuntu / Debian Linux:**

`$ sudo systemctl enable libvirtd.service`
A reboot is recommended so that the KVM can properly start.

`$ sudo reboot`
6. Validate Host Virtualization Setup
-------------------------------------

After the reboot, verify that your host is correctly configured to run
all libvirt hypervisor drivers.

`$ sudo virt-host-validate qemu`
You may receive the following warning message from the validation tool:

QEMU: Checking for device assignment IOMMU support : WARN (No ACPI DMAR
table found, IOMMU either disabled in BIOS or not supported by this
hardware platform)
**Meaning**: Your Intel processor supports VT-x (vmx) but does not
support VT-d, or VT-d support is disabled in the BIOS.

VT-d is used to implement a feature known as PCIe Pass-through. VT-d
enables virtual machines to have direct access to specific I/O devices
such as graphics cards, network adapters, and storage controllers.

---

QEMU: Checking if IOMMU is enabled by kernel : WARN (IOMMU appears to be
disabled in kernel. Add intel_iommu=on to kernel cmdline arguments)
**Meaning**: Your Intel CPU supports the VT-d capability, but it must be
enabled in the kernel.

To enable VT-d, open the /etc/default/grub file and add 'intel_iommu=on
iommu=pt' to the GRUB_CMDLINE_LINUX line.

```
#### For Intel CPU
$ sudo vim /etc/default/grub
...
GRUB_CMDLINE_LINUX="... intel_iommu=on iommu=pt"
...
```

If you have an AMD CPU, IOMMU is enabled by default. To enable
pass-through mode, just add iommu=pt.

```
#### For AMD CPU
$ sudo vim /etc/default/grub
...
GRUB_CMDLINE_LINUX="... iommu=pt"
...
```

Then, regenerate the grub configuration file.

**Fedora Linux:**

`$ sudo grub2-mkconfig -o /boot/grub2/grub.cfg`
**Rocky Linux:**

`$ sudo grub2-mkconfig --update-bls-cmdline -o /boot/grub2/grub.cfg`
**Ubuntu / Debian:**

`$ sudo update-grub`
**Arch Linux:**

`$ sudo grub-mkconfig -o /boot/grub/grub.cfg`
Reboot the system and validate the host again to ensure that no issues
remain.

`$ sudo virt-host-validate qemu`
On the Intel CPU, verify that the VT-d is enabled.

`$ dmesg | grep -i -e DMAR -e IOMMU`
On the AMD CPU, verify that the AMD-Vi is enabled.

`$ dmesg | grep -i -e AMD-Vi`
---

QEMU: Checking for secure guest support : WARN (Unknown if this platform
has Secure Guest support)
**Meaning**: Enable AMD Secure Encrypted Virtualization (SEV) support.

If you have an Intel CPU, you can safely ignore this warning. This
applies to AMD CPUs.

The SEV feature is only supported on (most) EPYC and Ryzen Pro
processors. This feature enables libvirt/kvm to encrypt memory.

This is a nice feature, but if your AMD processor does not support it,
you can safely ignore the warning (as with Intel processors).

To test feature support, run the following command:

`$ lscpu | grep sev`
If the output returns nothing, SEV is not supported.

Otherwise, enable the feature in the BIOS and activate it in the kernel
([Launch security with AMD
SEV](https://libvirt.org/kbase/launch_security_sev.html)).

7. Optimize the Host with TuneD
-------------------------------

[TuneD](https://tuned-project.org/)is a system tuning service for Linux.
It provides a number of pre-configured tuning profiles, each optimized
for unique workload characteristics, including CPU-intensive job needs,
storage/network throughput responsiveness, or power consumption
reduction.

Enable and start the TuneD service.

`$ sudo systemctl enable --now tuned`
Find out which TuneD profile is currently active.

```
$ tuned-adm active
Current active profile: balanced
```

List all TuneD profiles that are available on your system

```
$ tuned-adm list
Available profiles:
- accelerator-performance     - Throughput performance based tuning with disabled higher latency STOP states
- aws                         - Optimize for aws ec2 instances
- balanced                    - General non-specialized tuned profile
- desktop                     - Optimize for the desktop use-case
- hpc-compute                 - Optimize for HPC compute workloads
- intel-sst                   - Configure for Intel Speed Select Base Frequency
- latency-performance         - Optimize for deterministic performance at the cost of increased power consumption
- network-latency             - Optimize for deterministic performance at the cost of increased power consumption, focused on low latency network performance
- network-throughput          - Optimize for streaming network throughput, generally only necessary on older CPUs or 40G+ networks
- optimize-serial-console     - Optimize for serial console use.
- powersave                   - Optimize for low power consumption
- throughput-performance      - Broadly applicable tuning that provides excellent performance across a variety of common server workloads
- virtual-guest               - Optimize for running inside a virtual guest
- virtual-host                - Optimize for running KVM guests
Current active profile: balanced
```

I will set the profile to virtual-host. This optimizes the host for
running KVM guests.

`$ sudo tuned-adm profile virtual-host`
Check that the TuneD profile has been updated and that virtual-host is
now active.

```
$ tuned-adm active
Current active profile: virtual-host
```

Make sure there are no errors.

```
$ sudo tuned-adm verify
Verfication succeeded, current system settings match the preset profile.
See TuneD log file ('/var/log/tuned/tuned.log') for details.
```

Your host is now optimized to run KVM guests. When you create a Linux
virtual machine, you can also enable TuneD and set the TuneD profile to
virtual-guest to improve virtual guest performance.

To learn more about the`tuned-adm`command, go to
its[GitHub](https://github.com/redhat-performance/tuned)page.

8. Configure a Network Bridge
-----------------------------

All the virtual machines on the host are by default connected to the
same NAT-type virtual network, named 'default'.

```
$ sudo virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes
```

> **Note:**If you use Debian, the default network state will be
inactive, and autostart will be disabled. To activate, run the
command`sudo virsh net-start default`followed by`sudo virsh
net-autostart default`.

The virtual machines that use this 'default' network will be assigned an
IP address in the 192.168.124.0/24 address space, with the host OS
reachable at 192.168.124.1.

`$ sudo virsh net-dumpxml default | xmllint --xpath '//ip' -<ip
address="192.168.124.1" netmask="255.255.255.0">    <dhcp>      <range
start="192.168.124.2" end="192.168.124.254"/>    </dhcp></ip>`
Virtual machines using this default network will only have outbound
network access. Virtual machines will have full access to network
services, but devices outside the host will be unable to communicate
with virtual machines inside the host. For example, the virtual machine
can browse the web but cannot host a web server that is accessible to
the outside world.

If you want virtual machines to be directly visible on the same physical
network as the host and visible to external devices, you must use a
network bridge.

A network bridge is a link-layer device that connects two local area
networks into one network. In this case, a software bridge is used
within a Linux host to simulate a hardware bridge. As a result, all
other physical machines on the same physical network of the host can
detect and access virtual machines. The virtual machine, for example,
can browse the web, and will also be able to host a web server that is
accessible to the outside world.

> **Important:**
>
>
> Unfortunately, you cannot set up a network bridge when using Wi-Fi.
>
>
> Due to the IEEE 802.11 standard which specifies the use of 3-address
frames in Wi-Fi for the efficient use of airtime, you cannot configure a
bridge over Wi-Fi networks operating in Ad-Hoc or Infrastructure modes.
>
> Source: [Configuring a network
bridge](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html-single/configuring_and_managing_networking/index#configuring-a-network-bridge_configuring-and-managing-networking)

First, find the name of the interface you want to add to the bridge. In
my case, it is enp2s0.

`$ sudo nmcli device statusDEVICE             TYPE      STATE           
CONNECTION         enp2s0             ethernet  connected              
Wired connection 1 lo                 loopback  connected (externally) 
lo                 virbr0             bridge    connected (externally) 
virbr0`
Create a bridge interface. I'll name it bridge0, but you can call it
whatever you want.

`$ sudo nmcli connection add type bridge con-name bridge0 ifname
bridge0`
Assign the interface to the bridge. I'm going to name this connection
'Bridge connection 1', but you can call it whatever you want.

`$ sudo nmcli connection add type ethernet slave-type bridge \   
con-name 'Bridge connection 1' ifname enp2s0 master bridge0`
The following step is optional. If you want to configure a static IP
address, use the following commands; otherwise, skip this step. Change
the IP address and other details to match your configuration.

```
$ sudo nmcli connection modify bridge0 ipv4.addresses '192.168.1.7/24'
$ sudo nmcli connection modify bridge0 ipv4.gateway '192.168.1.1'
$ sudo nmcli connection modify bridge0 ipv4.dns '8.8.8.8,8.8.4.4'
$ sudo nmcli connection modify bridge0 ipv4.dns-search 'sysguides.com'
$ sudo nmcli connection modify bridge0 ipv4.method manual
```

Activate the connection.

`$ sudo nmcli connection up bridge0`
Enable the connection.autoconnect-slaves parameter of the bridge
connection.

`$ sudo nmcli connection modify bridge0 connection.autoconnect-slaves 1`
Reactivate the bridge.

`$ sudo nmcli connection up bridge0`
Verify the connection. If you get your IP address from DHCP, it may take
a few seconds to lease a new one. So please be patient.

`$ sudo nmcli device statusDEVICE             TYPE      STATE           
CONNECTION          bridge0            bridge    connected              
bridge0             lo                 loopback  connected (externally) 
lo                  virbr0             bridge    connected (externally) 
virbr0              enp2s0             ethernet  connected              
Bridge connection 1$ ip -brief addr show dev bridge0bridge0          UP 
192.168.1.7/24 fe80::a345:fb7b:cb67:c778/64`
You can now start using a network bridge when creating virtual machines.

However, it is recommended that you also set up a virtual bridge network
in KVM so that the virtual machines can use this bridge interface by
name.

Create an XML file called nwbridge.xml and fill it with the following
information. I'll call my host network bridge nwbridge, but you can call
it whatever you want.

```
$ vim nwbridge.xml
<network>
  <name>nwbridge</name>
  <forward mode='bridge'/>
  <bridge name='bridge0'/>
</network>
```

Define nwbridge as a persistent virtual network.

`$ sudo virsh net-define nwbridge.xml`
Activate the nwbridge and set it to autostart on boot.

```
$ sudo virsh net-start nwbridge
$ sudo virsh net-autostart nwbridge
```

Now you can safely delete the nwbridge.xml file. It’s not required
anymore.

`$ rm nwbridge.xml`
Finally, verify that the virtual network bridge nwbridge is up and
running.

```
$ sudo virsh net-list --all
 Name       State    Autostart   Persistent
---------------------------------------------
 default    active   yes         yes
 nwbridge   active   yes         yes
```

A network bridge has been created. You can now start using the nwbridge
network bridge in your virtual machines. The virtual machines will get
their IP addresses from the same pool as your host machine.

If you ever want to remove this network bridge and return it to its
previous state, then run the following commands.

```
$ sudo virsh net-destroy nwbridge
$ sudo virsh net-undefine nwbridge

$ sudo nmcli connection up 'Wired connection 1'
$ sudo nmcli connection down bridge0
$ sudo nmcli connection del bridge0
$ sudo nmcli connection del 'Bridge connection 1'
```

9. Give the User System-Wide Permission
---------------------------------------

Libvirt provides two methods for connecting to the local qemu-kvm
hypervisor.

**qemu:///session**
Connect as a regular user to a per-user instance locally. This is the
default mode when running a virtual machine as a regular user. This
allows users to only manage their own virtual machines.

```
$ virsh uri
qemu:///session
```
**qemu:///system**
Connect to a system instance as the root user locally. When run as root,
it has complete access to all host resources. This is also the
recommended method to connect to the local hypervisor.

```
$ sudo virsh uri
qemu:///system
```

So, if you want to connect to a system instance as a regular user with
full access to all host resources, do the following.

> **Note:**For Ubuntu users, system-wide permissions are enabled by
default. You can skip this section and move on to the next.

Add the regular user to the libvirt group.

`$ sudo usermod -aG libvirt $USER`
Define the environment variable LIBVIRT_DEFAULT_URI in the local.bashrc
file of the user.

```
$ echo "export LIBVIRT_DEFAULT_URI='qemu:///system'" >> ~/.bashrc
$ source ~/.bashrc
```

Check again as a regular user to see which instance you are connected
to.

```
$ virsh uri
qemu:///system
```

You can now use the `virsh` command-line tool and the Virtual Machine
Manager (`virt-manager`) without `sudo`.

10. Set ACL on the Images Directory
-----------------------------------

By default, virtual machine disk images are stored in
the/var/lib/libvirt/images directory. Only the root user has access to
this directory.

```
$ ls /var/lib/libvirt/images/
ls: cannot open directory '/var/lib/libvirt/images/': Permission denied
```

As a regular user, you might want access to this directory without
having to type`sudo`every time. So, setting the ACL for this directory
is the best way to access it without changing the default permissions.

First, recursively remove any existing ACL permissions on the directory.

`$ sudo setfacl -R -b /var/lib/libvirt/images`
Grant regular user permission to the directory recursively.

`$ sudo setfacl -R -m u:$USER:rwX /var/lib/libvirt/images`
The capital 'X' above indicates that 'execute' should only be applied to
child folders and not child files.

All existing directories and files (if any)
in/var/lib/libvirt/images/now have permissions. However, any new
directories and files created within this directory will not have any
special permissions. To get around this, we need to enable 'default'
special permissions. The 'default acls' can only be applied to
directories and not to files.

`$ sudo setfacl -m d:u:$USER:rwx /var/lib/libvirt/images`
Now review your new ACL permissions on the directory.

```
$ getfacl /var/lib/libvirt/images
getfacl: Removing leading '/' from absolute path names
# file: var/lib/libvirt/images
# owner: root
# group: root
user::rwx
user:madhu:rwx
group::--x
mask::rwx
other::--x
default:user::rwx
default:user:madhu:rwx
default:group::--x
default:mask::rwx
default:other::--x
```

Try accessing the/var/lib/libvirt/images directory again as a regular
user.

```
$ touch /var/lib/libvirt/images/test_file

$ ls -l /var/lib/libvirt/images/
total 0
-rw-rw----+ 1 madhu madhu 0 Feb 12 21:34 test_file
```

You now have full access to the/var/lib/libvirt/images directory.

11. Conclusion
--------------

In this blog, you have learned about key elements of KVM virtualization
and how they relate to each other. You have also learned how to install
KVM on a variety of Linux distributions.

You should be able to start creating virtual machines right away. If you
would like to install a virtual machine using the command line, visit my
blog "[How to Install a KVM Guest OS from the
Command-Line](https://sysguides.com/kvm-guest-os-from-the-command-line/)".
But if you want to install a virtual machine using a Virtual Machine
Manager, check out my other blog, "[How to Install Guest OS in
Virt-Manager: A Quick
Intro](https://sysguides.com/install-guest-os-in-virt-manager/)".

12. Watch on YouTube
--------------------
