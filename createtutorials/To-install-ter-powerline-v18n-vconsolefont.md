Vconsole-kbd-Font-Change.md
To-install-ter-powerline-v18n-vconsolefont.md

FONT=ter-powerline-v18n

❯ sudo vim /etc/vconsole.conf

KEYMAP=us
FONT=default8x16
FONT_MAP=8859-2

❯ pdw
/usr/share/kbd/consolefonts
❯ cd
❯ git clone https://github.com/powerline/fonts powerline-fonts

Cloning into 'powerline-fonts'...
remote: Enumerating objects: 1018, done.
remote: Counting objects: 100% (23/23), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 1018 (delta 13), reused 12 (delta 12), pack-reused 995 (from 2)
Receiving objects: 100% (1018/1018), 20.66 MiB | 1.77 MiB/s, done.
Resolving deltas: 100% (414/414), done.
❯ cd powerline-fonts
❯ sudo cp Terminus/PSF/ter-powerline-v18n.psf.gz /usr/share/kbd/consolefonts/
❯ sudo vim /etc/vconsole.conf
❯ sudo vim /etc/mkinitcpio.conf
$ sudo mkinitcpio -P
~/powerline-fonts master

### To install the ter-powerline-v18n.psf.gz font
To install the ter-powerline-v18n.psf.gz font, first copy the file to the /usr/share/kbd/consolefonts/ directory using the command sudo cp ter-powerline-v18n.psf.gz /usr/share/kbd/consolefonts/. After that, you can set the font in your console by editing the /etc/vconsole.conf file to include FONT=ter-powerline-v18n and then reboot your system. Arch Linuxphoikoi.io
Installing ter-powerline-v18n.psf.gz to /usr/share/kbd/consolefonts
Step 1: Download the Font

    Clone the Powerline fonts repository from GitHub:

    Code
    git clone https://github.com/powerline/fonts powerline-fonts

    Navigate to the cloned directory:

    Code
    cd powerline-fonts

Step 2: Copy the Font File

    Copy the specific font file to the console fonts directory:

    Code
    cp Terminus/PSF/ter-powerline-v18n.psf.gz /usr/share/kbd/consolefonts/

Step 3: Update Console Configuration

    Edit the /etc/vconsole.conf file to set the font:

    Code
    FONT=ter-powerline-v18n

Step 4: Rebuild Initramfs (if necessary)

    If you are using KMS (Kernel Mode Setting) with Intel graphics, you may need to edit the mkinitcpio.conf file and rebuild the initramfs:

    Code
    mkinitcpio -P

Step 5: Reboot

    Restart your system to apply the changes.

After following these steps, the ter-powerline-v18n.psf.gz font should be installed and ready for use in your console.
