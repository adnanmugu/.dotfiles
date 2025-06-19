#!/usr/bin/env bash

# Get Kitty socket
ALACRITTY_SOCKET=$(echo $ALACRITTY_SOCKET)
ALACRITTY_WINDOW_ID=$(echo $ALACRITTY_WINDOW_ID)

# We can control the current kitty terminal using socket 
# and using "kitten" : https://sw.kovidgoyal.net/kitty/remote-control/#remote-control-via-a-socket

if [ -n "$ALACRITTY_SOCKET" ]; then
  # kitten @ --to $KITTY_SOCKET set-spacing padding=0

  alacritty msg --socket $ALACRITTY_SOCKET config -w $ALACRITTY_WINDOW_ID options 'window.padding.x=0' 'window.padding.y=0'
fi

nvim $*

if [ -n "$ALACRITTY_SOCKET" ]; then
  #  kitten @ --to $KITTY_SOCKET set-spacing padding=default
  alacritty msg --socket $ALACRITTY_SOCKET config -w $ALACRITTY_WINDOW_ID options 'window.padding.x=10' 'window.padding.y=5' 'cursor.style.shape="Underline"'
fi
