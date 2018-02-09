# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias xh='command xhost'

alias ucommand='cat ~/Documents/Divers/"Commandes utiles.txt"'
alias bsod="xterm -hold -T TEST -bg blue -b 100 -cr red -ms pink -fullscreen -e echo $'A problem has been detected and ubuntu has been shut down to prevent damage to your computer.\n\nThe problem seem to be caused by the following file: SPCMDCON.SYS\n\nPAGE_FAULT_IN_NONPAGED_AREA\n\nIf this is the first time you have seen this Stop error screen,\nrestart your computer. If this screen appears again, follow\nthese steps:\n\nCheck to make sure an new hardware or software is properly installed.\nIf this is a new installation, ask your hardware or software manufacturer for any Ubuntu updates you might need.\n\nIf problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing.\nIf you need to use Safe Mode to remove or disable components, restart your computer, press f8 to select Advanced Startup Options, and then select Safe Mode.\n\nTechnical information:\n\n*** STOP: 0x00000050 (0xFD3094C2,0x00000001,0xFBFE7617,0x00000000)\n\n\n*** SPCMDCAN.SYS - Adress FBFE7617 base at FBFE5000, DateStamp 3d6dd67c\n\n\nOr just press Alt+f4 to exit...'"
alias disp='export DISPLAY=:0'
alias hide='shred ~/.bash_history && killall -9 bash'
alias nscreen='xrandr -o normal'
alias fr='setxkbmap fr'·_
alias йц='setxkbmap fr'
alias subl='/auto_home/todorico/Documents/IDE/Sublime_text_3/sublime_text'

smallProgPath='/auto_home/todorico/Documents/Small-Prog'

alias gobash='cd "$smallProgPath"/"Scripts-Bash"'
alias gopatch='cd "$smallProgPath"/"Patch-Xhost"/'
alias patch='"$smallProgPath"/"Patch-Xhost"/patch'
alias depatch='"$smallProgPath"/"Patch-Xhost"/depatch'
alias prevent='"$smallProgPath"/"Scripts-Bash"/prevent'

# Affiche le contenu du dossier courent à chaque fois que la commande cd est utillisé
cd() {
    command cd "$1"
    ls
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export CLASSPATH=${HOME}/Java:.

