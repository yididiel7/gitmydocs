**Title:** Niri Install Wayland Compositor on Arch Linux
**Date:** 2026-02-09 (17:30:34 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Niri-Install-Wayland-Compositor-on-Arch-Linux_2026-02-09_17-30-34.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

## How to Install and Customize Niri Wayland Compositor on Arch Linux

Installing and customizing the Niri Wayland compositor on Arch Linux
involves a few straightforward steps. Here’s a step-by-step guide to get
you started.

---

### Step 1: Prepare Your System

Before you begin, ensure that your system is up to date and you have the
necessary tools installed. Open your terminal and run:

```bash
sudo pacman -Syu
```

---

### Step 2: Install Niri and Dependencies

You can install Niri along with some essential packages using the
following command:

```bash
sudo pacman -S niri xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk alacritty
```

If you want a graphical launcher and a shell, you can additionally
install:

```bash
paru -S dms-shell-bin matugen cava qt6-multimedia-ffmpeg
```

**Note:** The specific installations may require a package manager like
`paru` which can be installed from `AUR` if it’s not already available.

---

### Step 3: Set Up Niri as a User Service

Once installed, configure Niri to start automatically:

```bash
systemctl --user enable niri.service
systemctl --user start niri.service
```

---

### Step 4: Configure Niri

1. **Initial Configuration:**
After logging out and choosing Niri in your display manager, you may
have some initial setting tweaks to perform. If you run into duplicate
bars (like Waybar appearing), you can kill it with:

   ```bash
   pkill waybar
   ```

2. **Edit Configuration File:**
   Open Niri’s configuration file to customize your environment:

   ```bash
   nano ~/.config/niri/config.kdl
   ```

Here, you can adjust settings like keybindings, layout preferences, and
more. For example, to customize gaps and focus rings:

   ```kdl
   layout {
       gaps 5
       focus-ring {
           width 1.5
           active-color "#7fc8ff"
           inactive-color "#505050"
       }
       border {
           off
       }
   }
   ```

---

### Step 5: Use Xwayland for X11 Applications

If you need to run X11 applications, ensure you set up
`xwayland-satellite`. To start it automatically with Niri, add this line
to your configuration:

```kdl
spawn-at-startup "xwayland-satellite"
```

---

### Step 6: Additional Customizations

- **Launchers and Utilities:**
To enhance your experience, you can install additional utilities such as
`fuzzel` for application launching or `mako` for notifications.

```bash
sudo pacman -Sy fuzzel mako swaybg
```

- **Set Up Keybindings:**
Customize keybindings in `config.kdl` to make navigation smoother and
improve your workflow. For example:

```kdl
keybindings {
    super + Return = open_terminal
}
```

---

### Step 7: Enjoy and Further Tweaks

Once you have everything set up, log back into your Niri session and
start experimenting. Use commands like `niri msg outputs` to check your
monitor configurations and make any layout adjustments if necessary.

Feel free to explore more advanced settings in the Niri documentation or
community resources to fully customize your environment to your liking.

---

By following these steps, you should have Niri installed and customized
to your preferences on Arch Linux. If you have any specific requirements
or features you'd like to implement further, let me know!
