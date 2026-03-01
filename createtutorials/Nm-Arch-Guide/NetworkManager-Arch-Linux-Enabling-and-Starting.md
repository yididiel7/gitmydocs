**Title:** NetworkManager Arch Linux Enabling and Starting
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** NetworkManager-Arch-Linux-Enabling-and-Starting.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

2. Enabling and Starting NetworkManager
NetworkManager-Arch-Linux-Enabling-and-Starting.md
With the driver loaded (or identified), the next step is to enable and
start the NetworkManager service.
Enabling the NetworkManager Service

Use systemctl to enable the NetworkManager service. This ensures that
NetworkManager starts automatically on boot.

systemctl enable NetworkManager

Starting the NetworkManager Service

Now, start the NetworkManager service immediately:

systemctl start NetworkManager

Checking the Status of NetworkManager

Verify that NetworkManager is running without errors:

systemctl status NetworkManager

Look for “active (running)” in the output. If there are errors, review
the error messages for clues about the problem. Common issues include
missing dependencies or configuration errors.
3. Connecting to a Wireless Network

Once NetworkManager is running, you can use the nmcli command-line tool
to connect to a wireless network.
Scanning for Available Networks

Use nmcli to scan for available Wi-Fi networks:

nmcli dev wifi

This command lists available networks along with their SSIDs (network
names) and security types (e.g., WPA2).
Connecting to a Wireless Network (using nmcli)

To connect to a specific network, use the following command, replacing
<SSID> with the network name and <password> with the Wi-Fi password:

nmcli dev wifi connect <SSID> password <password>

Example:

nmcli dev wifi connect MyWiFiNetwork password MySecretPassword

Verifying the Connection

After attempting to connect, verify that you have obtained an IP
address. Use the ip addr command:

ip addr

Look for an interface (usually wlan0 or `wlp…) with an IP address
assigned. If you have an IP address, you should be able to ping external
websites:

ping -c 5 itsfoss.com

If the ping is successful, you’re connected to the internet!
4. Addressing Common Issues

Even with the steps above, you might encounter further problems. Here
are some common issues and their solutions:
“Device not managed” Error

Sometimes, NetworkManager might not manage your wireless interface,
resulting in a “Device not managed” error. This can happen if another
network management tool is interfering. To resolve this:

Ensure no other network managers are running: Disable and stop any other
network managers (e.g., dhcpcd).

Modify NetworkManager.conf: Edit the
/etc/NetworkManager/NetworkManager.conf file. Ensure that managed=true
is set within the [main] section:

    [main]
    plugins=ifupdown,keyfile
    managed=true

    [ifupdown]
    managed=false

    Restart the NetworkManager service after making these changes:

    systemctl restart NetworkManager

Authentication Issues

If you are prompted for authentication multiple times or encounter
connection failures, ensure you have entered the correct Wi-Fi password.
Double-check for typos and capitalization errors. Consider using nmcli
to store the Wi-Fi password securely:

nmcli connection modify <SSID> wifi-password <password>

Replace <SSID> with the network name. After saving the password,
reconnect to the network:

nmcli connection up <SSID>

DHCP Problems

If you’re connected to the Wi-Fi network but can’t access the internet,
you might have a DHCP issue. DHCP (Dynamic Host Configuration Protocol)
is responsible for automatically assigning IP addresses. You can try
forcing NetworkManager to renew the DHCP lease:

nmcli device disconnect wlan0  # Replace wlan0 if necessary
nmcli device connect wlan0

This disconnects and reconnects the wireless interface, forcing a DHCP
lease renewal.
Firewall Issues

While less common immediately after installation, a restrictive firewall
configuration can prevent network access. Ensure that your firewall (if
enabled) allows outgoing connections on the necessary ports (e.g., port
80 for HTTP, port 443 for HTTPS).
5. Persistence and Further Configuration

Once you have a working network connection, you can install essential
packages and configure your system further.
Installing Essential Packages

With network connectivity established, update your system:

pacman -Syu

Install any necessary packages, such as a graphical desktop environment
(e.g., Xfce, GNOME, KDE Plasma) and a display manager (e.g., LightDM,
SDDM, GDM).
Setting Up a Graphical Network Manager (Optional)

While nmcli is powerful, a graphical network manager can be more
convenient for some users. Common graphical network managers include:

network-manager-applet: A system tray applet that provides a graphical
interface for NetworkManager. Install it with:

    pacman -S network-manager-applet

You’ll likely need to add it to your desktop environment’s autostart
settings.
