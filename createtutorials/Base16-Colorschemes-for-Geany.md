**Title:** Base16 Colorschemes for Geany
**Date:** 2026-02-13 (10:30:00 Asia/Jerusalem)
**Author:** Sr. Yididiel Hills, Arch Linux Admin, Developer
**lfnc:** Base16-Colorschemes-for-Geany.md
**Copyright:** © 2026-2027 Sr. Tyrone Hills
**License:** MIT – see LICENSE file for details

Installation For Base16 Colorschemes for Geany



[tinted-builder-rust](git clone
https://github.com/RobLoach/tinted-geany.git)

git clone https://github.com/RobLoach/tinted-geany.git

cd tinted-geany

cargo install tinted-builder-rust

tinted-builder-rust sync

tinted-builder-rust build .


~/tinted-geany/colorschemes master*


cp -r * ~/.config/geany/colorschemes

[tinted-builder-rust](https://github.com/tinted-theming/tinted-builder-rust?tab=readme-ov-file#installation)
Installation

    Copy the files to your ~/.config/geany/colorschemes directory.
    Choose the scheme at View -> Editor -> Color Schemes.

Building

    Download the Geany scheme

git clone https://github.com/RobLoach/tinted-geany.git
cd tinted-geany

    Install tinted-builder-rust

    Run it...

tinted-builder-rust sync
tinted-builder-rust build .

[Note]: For Any Problem installing Plugins Use This command.

sudo pacman -S geany-plugins --noconfirm --overwrite '*'
