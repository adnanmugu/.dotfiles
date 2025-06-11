# if not running interactive, don't do anything
[[ $- != *i* ]] && return

# load global system-wide bash 
# settings if available
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

HISTCONTROL=ignorespace            # don't save duplication in history
HISTIGNORE="ls:bg:fg:history"      # ignore trivial cmd

HISTFILESIZE=5000         # max n of cmd saved to file  
HISTSIZE=5000             # max n of cmd stored in memory

shopt -s histappend       # append session history to ~/.bash_history
shopt -s checkwinsize     # auto-adjust bash's termrinal size window 

# set a colored prompt
case "$TERM" in
  xterm-color|*-256color|xterm-kitty|alacritty) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Git branch in prompt

parse_git_branch() {
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    echo "$branch "
  fi
}

if [ "$color_prompt" = yes ]; then
 PS1='\[\033[01;31m\]$(parse_git_branch)\[\033[01;34m\]\W \[\033[0m\]'
else
 PS1='$(parse_git_branch) \W '
fi

unset color_prompt force_color_prompt

# Alias
alias grep='grep --color=auto'
alias ls='ls --group-directories-first --color=auto'  # list files
alias l='ls --group-directories-first --color=auto'   # list files
alias la='ls -a'          # list hidden files
alias l.='ls -d .*/'      # list hidden files
alias ll='ls -lhrt'       # extra info compare to "l"
alias lld='ls -lUd */'    # list directories

alias ..="cd .."          # go to parent dir
alias ...="cd ../.."      # go to grantparent dir

alias nv="~/.config/kitty/script/kitty_nvim.sh"
alias alac="bash ~/.local/bin/padding_alacritty.sh decrease"

# Git shortcut
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

# Overrides the nvim command only when run in kitty 
nvim() {
  if [ "$TERM" = "xterm-kitty" ]; then
    kitty @ set-spacing padding=0 
    command nvim "$@"
    kitty @ set-spacing padding=default
  else
    command nvim "$@"
  fi
}

# Load hyprland uwsm
# if uwsm check may-start && uwsm select; then
#  exec uwsm start default
# fi

# Reload bashrc without restarting terminal
alias reload="source ~/.bashrc"

# manpath
export MANPATH="$HOME/.local/share/man:$MANPATH"
