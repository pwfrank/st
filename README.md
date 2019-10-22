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
`h, j, k, l`   move cursor left/down/up/right 
`!, _, *`      move cursor to the middle of the line/column/screen
`Backspace, $` move cursor to the beginning/end of the line
`PgUp, PgDown` move cursor to the beginning/end of the column
`Home, End`    move cursor to the top/bottom left corner of the screen
`/, ?`         activate input mode and search up/down
`n, N`         repeat last search, up/down
`s`            toggle move/selection mode
`t`            toggle regular/rectangular selection type
`Return`       quit keyboard_select, keeping the highlight of the selection
`Escape`       quit keyboard_select

### st-scrollback
Allows scrolling upwards to view previous output. Diff with st.h amended with correct context to apply patch

Scroll one line: `alt-up/k`, `alt-down/j`  
Scroll one page: `shift-PageUp`, `shift-PageDown`  

### st-scrollback-mouse
Allows scrolling upwards using shift + mousewheel

### st-xresources
Allows colors and terminal attributes to be set dynamically via an .Xresources or .Xdefaults file

### st-alpha 
Applies background opacity to st windows. Defined by `opacity` in .Xresources file. Defaults to 0.9

### st-alpha-swap
Swap between .Xresources-defined opacity and 1.0 (opaque) with `F5`

### st-externalpipe
Allows access to scrollback buffer. Copy functions require adding `st-copyout` to your $PATH
Follow a url in scrollback buffer: `alt-l`
Copy a url to X clipboard:         `alt-y`
Copy output of a previous command: `alt-o` 

## config.h additions
* keyboard_select mode entry keybinding (removed diff with config.def.h)
* st-scrollback keybindings (removed diff with config.def.h)
* ResourcePref array
* Added mkeys array and set mshortcuts array to XK_NO_MOD
* A more sensible default colorscheme
* various remapped controls
