# Simple Terminal
A simple, sensible build of the suckless.org Simple Terminal project.

A PKGBUILD is included for anyone in an Arch-based environment who wants to manage their installation via pacman. Anyone else can build directly from the src directory using make/make clean install

## General controls
Resize font: `Control + up/K`, `Control-down/J`  
Reset font: `Control-home`
Copy: `alt-c`  
Paste: `alt-v`  

## Patches applied
### st-clipboard
Keeps xorg clipboard and primary selections the same, regardless of whether copied by mouse selection or the clipcopy command. Note that this only affects selections made within st, other windows managed by X will still copy to the clipboard and primary selections independently

### st-keyboard_select
Adds a vim-like text selection mode that does not require the use of the mouse.

Enter mode: `alt-esc` 

### st-scrollback
Allows scrolling upwards to view previous output. Diff with st.h amended with correct context to apply patch

Scroll one line: `alt-up/k`, `alt-down/j`  
Scroll one page: `shift-PageUp`, `shift-PageDown`

### st-scrollback-mouse
Allows scrolling upwards using shift + mousewheel

### st-xresources
Allows colors and terminal attributes to be set dynamically via an .Xresources or .Xdefaults file

### st-alpha 
Applies background opacity to st windows. Defined by `opacity` in .Xresources file, defaults to `1.0` (no transparency)

## config.h additions
* keyboard_select mode entry keybinding (removed diff with config.def.h)
* st-scrollback keybindings (removed diff with config.def.h)
* ResourcePref array
* Added mkeys array and set mshortcuts array to XK_NO_MOD
* A more sensible default colorscheme
* various remapped controls
