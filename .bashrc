#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# Append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Set variable identifying the chroot environment (used in the prompt below)
if [ -z "$arch_chroot" ] && [ -r /etc/arch_chroot ]; then
    arch_chroot=$(cat /etc/arch_chroot)
elif [ -f /run/arch-chroot ]; then
    arch_chroot="arch-chroot"
fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Detect chroot environment
if [ -z "$arch_chroot" ] && [ -r /etc/arch_chroot ]; then
    arch_chroot=$(cat /etc/arch_chroot)
elif [ -f /run/arch-chroot ]; then
    arch_chroot="arch-chroot"
fi

# Set prompt
if [ "$color_prompt" = yes ]; then
    PS1='${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${arch_chroot:+($arch_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm, set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${arch_chroot:+($arch_chroot)}\u@\h: \W\a\]$PS1"
        ;;
    *)
        ;;
esac

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias

# alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Shortcut aliases
alias ls='ls -p --group-directories-first --color=auto'  # list files
alias l='ls -p --group-directories-first --color=auto'   # list files
alias la='ls -a'          # list hidden files
alias l.='ls -d .*/'      # list hidden files
alias ll='ls -lhrt'       # extra info compare to "l"
alias lld='ls -lUd */'    # list directories

alias ..="cd .."          # go to parent dir
alias ...="cd ../.."      # go to grantparent dir

alias nv='nvim'           # open nvim

#  Source global definition
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# \u > username
# \h > hostname
# \H > the full hostname
# \w > current dir
# \W > current base dir
# $ symbol is represent regular user and # represent root
# PS1 (prompt)

# Git shortcut
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

#
PATH=$PATH:/home/adnan/.local/bin

# Reload bashrc without restarting terminal
alias reload="source ~/.bashrc"
