**Title:** How to Install Sweet Dark v40 Theme
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** how-to-install-sweet-dark-v40.tar.xz-theme.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

How to install Full Icon Themes

URL Source: [Sweet Folder
Icons](https://www.opendesktop.org/p/1284047/).

Candy icons

Full Icon Themes

Homepage

https://github.com/EliverLara/candy-icons

Source i

https://github.com/EliverLara/candy-icons


how-to-install-sweet-dark-v40.tar.xz-theme.md

Installation Instructions

Install from package

Download Linux package from: https://www.opendesktop.org/p/1136805/

Then click the downloaded package and continue to installation with
package manager.

Or install the downloaded package using terminal:

Arch Linux

# pacman -S qt5-base qt5-svg qt5-declarative qt5-quickcontrols
# pacman -U /path/to/ocs-url*.pkg.tar.xz

Theme name:  Sweet - New Flavor -

Package: Sweet-Dark-v40.tar.xz

Install from source

Make git clone, or download the source archive and extract it.

Build and install

$ cd /path/to/ocs-url
$ ./scripts/prepare
$ qmake PREFIX=/usr
$ make
$ sudo make install

Uninstall

$ sudo make uninstall

Ubuntu 14.04

$ sudo apt install libqt5svg5 qtdeclarative5-qtquick2-plugin
qtdeclarative5-window-plugin qtdeclarative5-controls-plugin
$ sudo dpkg -i /path/to/ocs-url*.deb

Ubuntu 16.04

$ sudo apt install libqt5svg5 qml-module-qtquick-controls
$ sudo dpkg -i /path/to/ocs-url*.deb

Fedora 20

# yum insall qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
# rpm -i /path/to/ocs-url*.rpm

Fedora 22

# dnf insall qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols
# rpm -i /path/to/ocs-url*.rpm

openSUSE 42.1

# zypper install libQt5Svg5 libqt5-qtquickcontrols
# rpm -i /path/to/ocs-url*.rpm

1.- Extract the zip file to the themes directory i.e. ~/.themes/ or
/usr/share/themes/ (create it if necessary).

2.- To set the theme in Gnome, run the following commands in Terminal.
gsettings set org.gnome.desktop.interface gtk-theme Sweet-Dark-v40
gsettings set org.gnome.desktop.wm.preferences theme Sweet-Dark-v40

TYPICAL USAGE

After installing icons:

gtk-update-icon-cache /usr/share/icons/hicolor
Forces rebuild: gtk-update-icon-cache -f /path/to/theme

gtk-update-icon-cache /home/srhills/.icons/Sweet-Dark-v40/

Update after installing a new .desktop file

❯ sudo update-desktop-database /usr/share/applications

Update user MIME database

❯ update-mime-database ~/.local/share/mime
