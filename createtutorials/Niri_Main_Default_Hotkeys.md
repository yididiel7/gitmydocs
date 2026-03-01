Fix Thunar File Manager Not Running

Make sure XDG_CURRENT_DESKTOP is set. Make sure WAYLAND_DISPLAY and XDG_CURRENT_DESKTOP are imported into D-Bus. If you're running Niri, this can be added to your config file:

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=niri

When correctly installed, xdg-desktop-portal should automatically invoke xdg-desktop-portal-wlr when needed.

Recent changes to xdg-desktop-portal is requiring desktop environments to set up a *-portals.conf configuration that specify which portals should be used for a given XDG_CURRENT_DESKTOP value. If this file does not exists in /usr/share/xdg-desktop-portal/, you should create it under ~/.config/xdg-desktop-portal/ with content like this:

[preferred]
default=gtk
org.freedesktop.impl.portal.Screenshot=wlr
org.freedesktop.impl.portal.ScreenCast=wlr

(you can specify the default portal to use for any implementation not explicitly defined, and you can add any portal you need for other specific interfaces like gnome-keyring for the Secret portal).
Configuration

See man 5 xdg-desktop-portal-wlr.
Manual startup

At the moment, some command line flags are available for development and testing. If you need to use one of these flags, you can start an instance of xdpw using the following command:

xdg-desktop-portal-wlr -r [OPTION...]

To list the available options, you can run xdg-desktop-portal-wlr --help


paru -S xdg-desktop-portal-wlr

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=niri

mkdir ~/.config/xdg-desktop-portal/

nano portal.conf

Recent changes to xdg-desktop-portal is requiring desktop environments 
to set up a *-portals.conf configuration that specify which portals should 
be used for a given XDG_CURRENT_DESKTOP value. If this file does not exists in 

```/usr/share/xdg-desktop-portal/,```

you should create it under ```~/.config/xdg-desktop-portal/``` with content like this:

[preferred]
default=gtk
org.freedesktop.impl.portal.Screenshot=wlr
org.freedesktop.impl.portal.ScreenCast=wlr

[Arch Linux Using AUR (Recommended)](https://docs.noctalia.dev/getting-started/installation/#arch).

gsettings set org.gnome.desktop.wm.preferences theme Sweet-Dark-v40
gsettings set org.gnome.desktop.interface gtk-theme Sweet-Dark-v40
gsettings set org.gnome.Console shell "['/home/srhills/.cargo/bin/nu']"

~/.config/niri/config.kdl
  
Main Default Hotkeys

When running on a TTY, the Mod key is Super. When running in a window, the Mod key is Alt.

The general system is: if a hotkey switches somewhere, then adding Ctrl will move the focused window or column there.
Hotkey 	Description
ModShift/ 	Show a list of important niri hotkeys
ModT 	Spawn alacritty (terminal)
ModD 	Spawn fuzzel (application launcher)
SuperAltL 	Spawn swaylock (screen locker)
ModQ 	Close the focused window
ModH or Mod← 	Focus the column to the left
ModL or Mod→ 	Focus the column to the right
ModJ or Mod↓ 	Focus the window below in a column
ModK or Mod↑ 	Focus the window above in a column
ModCtrlH or ModCtrl← 	Move the focused column to the left
ModCtrlL or ModCtrl→ 	Move the focused column to the right
ModCtrlJ or ModCtrl↓ 	Move the focused window below in a column
ModCtrlK or ModCtrl↑ 	Move the focused window above in a column
ModShiftHJKL or ModShift←↓↑→ 	Focus the monitor to the side
ModCtrlShiftHJKL or ModCtrlShift←↓↑→ 	Move the focused column to the monitor to the side
ModU or ModPageDown 	Switch to the workspace below
ModI or ModPageUp 	Switch to the workspace above
ModCtrlU or ModCtrlPageDown 	Move the focused column to the workspace below
ModCtrlI or ModCtrlPageUp 	Move the focused column to the workspace above
ModShiftU or ModShiftPageDown 	Move the focused workspace down
ModShiftI or ModShiftPageUp 	Move the focused workspace up
Mod, 	Consume the window to the right into the focused column
Mod. 	Expel the bottom window in the focused column into its own column
Mod[ 	Consume or expel the focused window to the left
Mod] 	Consume or expel the focused window to the right
ModR 	Toggle between preset column widths
ModShiftR 	Toggle between preset column heights
ModF 	Maximize column
ModC 	Center column within view
Mod- 	Decrease column width by 10%
Mod= 	Increase column width by 10%
ModShift- 	Decrease window height by 10%
ModShift= 	Increase window height by 10%
ModCtrlR 	Reset window height back to automatic
ModShiftF 	Toggle full-screen on the focused window
ModV 	Move the focused window between the floating and the tiling layout
ModShiftV 	Switch focus between the floating and the tiling layout
PrtSc 	Take an area screenshot. Select the area to screenshot with mouse, then press Space to save the screenshot, or Escape to cancel
AltPrtSc 	Take a screenshot of the focused window to clipboard and to ~/Pictures/Screenshots/
CtrlPrtSc 	Take a screenshot of the focused monitor to clipboard and to ~/Pictures/Screenshots/
ModShiftE or CtrlAltDelete 	Exit niri
Building
