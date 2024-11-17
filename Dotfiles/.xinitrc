# Keyboard Layout
setxkbmap -layout us,ara -variant ,digits -option grp:win_space_toggle caps:escape
# Enviroment Variables
export PATH=$PATH:/home/$USER/.local/bin:/home/$USER/Source/Scripts:/home/$USER/go/bin
export BROWSER=firefox
export TERMINAL=kitty
export TERM=kitty
export EDITOR=nvim

exec dwm
