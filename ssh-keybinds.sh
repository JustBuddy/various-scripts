# Adding this to your bashrc (or other rc files)
# will add support for windows input keybinds like CTRL + Backspace or Control + Arrow Keys.

bindkey -e
# Control + backspace
bindkey '^H' backward-kill-word
# Control + arrows
bindkey ";5C" forward-word
bindkey ";5D" backward-word