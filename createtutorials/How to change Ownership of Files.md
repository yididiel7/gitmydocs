# How to change Ownership of Files

## Change Ownership commands in Linux

`$ sudo chown srhills:srhills .config/polybar/config.ini`

`$ sudo chmod +x .config/polybar/launch.sh`

## Polybar Texts Settings

## Polybar Directory:

`$ /home/srhills/.config/openbox-themes/themes/default/polybar`

## Configuration File:

*Edit File: 
`nvim config.ini`

; text
font-0 = "JetBrainsMono Nerd Font:size=10;3"
; icons
font-1 = "Iosevka Nerd Font:size=12;3"
; glyphs
font-2 = "Iosevka Nerd Font:size=15;4"
; dot
font-3 = "Iosevka Nerd Font:size=10;4"
; clock & mpd
font-4 = "Iosevka:style=bold:size=10;4"
; Archcraft
font-5 = "archcraft:size=12;3"



require 'lspconfig'.marksman.setup {}
