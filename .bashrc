#!/usr/bin/env bash

##############################
# @jaimecgomezz
#
# Contains bash configuration
############## lessons-learned
# 1. non-interactive shells
# sources .bash_profile or
# .profile at the beggining
#
# 2. env-variables are set at
# the top prior to the
# shell type evaluation
##############################
SCRIPTS_PATH="${HOME}/sh"
##############################

# ----------------------------------------------------------
# env
# ----------------------------------------------------------
export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export TOP=gotop
export DISPLAY=:0.0
export CONSOLE=kitty
export VIEWER=zathura
export READER=newsboat
export BROWSER=firefox
export NOTIFIER=dunstify
export HISTCONTROL=ignoredups:erasedups
export BAT_THEME=1337
export DMENU='rofi -dmenu'
export ARCHFLAGS="-arch x86_64"
export PATH="${PATH}:${SCRIPTS_PATH}"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Initializers
eval "$(rbenv init -)"

# Aliases
alias cz='npx git-cz -S --disable-emoji'
alias configs='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ----------------------------------------------------------
# utils
# ----------------------------------------------------------
# return unless interactive shell
[[ $- != *i* ]] && return

# ----------------------------------------------------------
# utils
# ----------------------------------------------------------
# compressed-files-extractor
ex() {
	if [ -f "$1" ]; then
		case "$1" in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz) tar xzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar x "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xf "$1" ;;
		*.tbz2) tar xjf "$1" ;;
		*.tgz) tar xzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*) echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# ----------------------------------------------------------
# prompt
# ----------------------------------------------------------

# custom config
cBRACKETS="\[\e[38;5;243m\]"	# Brackets around each data item
cERROR="\[\e[38;5;124m\]"		# Error block when previous command did not return 0
cPWD="\[\033[0m\]"				# Color of current directory
cCMD="\[\033[0m\]"				# Color of the command you type

# Enable block
eERR=1  # Previous command return status tracker
eTIME=1 # Enable time display
ePWD=1  # Show current directory

# git-current-brach
function parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "  ${BRANCH}${STAT}"
	else
		echo ""
	fi
}

# git-status
function parse_git_dirty {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	names=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
		if [ -n "${names}" ]; then names="${names},"; fi
		names="${names}rnm"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
		if [ -n "${names}" ]; then names="${names},"; fi
		names="${names}ahd"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
		if [ -n "${names}" ]; then names="${names},"; fi
		names="${names}new"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
		if [ -n "${names}" ]; then names="${names},"; fi
		names="${names}utk"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
		if [ -n "${names}" ]; then names="${names},"; fi
		names="${names}del"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
		if [ -n "${names}" ]; then names="${names},"; fi
		names="${names}dty"
	fi
	if [ ! "${bits}" == "" ]; then
		echo ":${bits}"
	else
		echo ""
	fi
}

function promptcmd() {
	PREVRET="$?"
	history -a

	local COL=$(expr $(tput cols) - 8)

	#---------------------------------------------------------
	# First Dynamic Block - Previous Command Error
	#---------------------------------------------------------
	PEC=""
	if [ $eERR -eq 1 ]; then
		if [ $PREVRET -ne 0 ]; then
			PEC="${cBRACKETS}[${cERROR}${PREVRET}${cBRACKETS}]"
		fi
	fi


	#---------------------------------------------------------
	# Third Static Block - Current Directory
	#---------------------------------------------------------
	DIR_BLOCK=""
	if [ $ePWD -eq 1 ]; then
		HPWD='$(pwd | sed -E -e "s|^$HOME|~|" -e '\''s|^.*/(.*)(/[^/]*)|\1\2|'\'')'
		DIR_BLOCK="${cBRACKETS}[${cPWD}${HPWD}$(parse_git_branch)${cBRACKETS}]"
	fi

	#---------------------------------------------------------
	# Assemble
	#---------------------------------------------------------
	PS1="${PEC}${DIR_BLOCK} λ ${cCMD}"
}

function load_prompt() {
	PROMPT_COMMAND=promptcmd
	export PS1 PROMPT_COMMAND
}

load_prompt

# ----------------------------------------------------------
# fzf
# ----------------------------------------------------------
# source: https://github.com/tinted-theming/base16-fzf
_gen_fzf_default_opts() {

local color00='#1c1e26'
local color01='#232530'
local color02='#2e303e'
local color03='#6f6f70'
local color04='#9da0a2'
local color05='#cbced0'
local color06='#dcdfe4'
local color07='#e3e6ee'
local color08='#e95678'
local color09='#fab795'
local color0A='#fac29a'
local color0B='#29d398'
local color0C='#59e1e3'
local color0D='#26bbd9'
local color0E='#ee64ac'
local color0F='#f09383'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts

# ----------------------------------------------------------
# conf
# ---------------------------------------------------------
xhost +local:root >/dev/null 2>&1
unset use_color safe_term match_lhs sh

complete -cf sudo

shopt -s checkwinsize   # bash won't get SIGWINCH if another process is in the foreground.
shopt -s expand_aliases # allow aliases
shopt -s histappend     # append history entries..

echo -e -n "\x1b[\x35 q" # cursor, blinking cursos

eval "$(keychain --agents ssh --eval id_rsa)" # auto-launch

eval "clear"