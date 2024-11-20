# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cinnabar/.oh-my-zsh"
export PATH="$HOME/bin:$HOME/.dotnet/tools:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export PATH=/usr/lib/ccache:/home/cinnabar/Documents/v8/tools/dev:/home/cinnabar/tools/depot_tools:$PATH 

export LC_CTYPE="en_US.UTF-8"
export LANG=en_US.UTF-8
#
# export NVM_DIR=~/.nvm
# source ~/.nvm/nvm.sh
# export npm_config_prefix=~/.nvm/versions/node/v20.17.0/
# export PATH="~/.nvm/versions/node/v22.5.1/bin:$PATH"
# LANG="en_US.UTF-8"
# LC_COLLATE="en_US.UTF-8"
# LC_CTYPE="en_US.UTF-8"
# LC_MESSAGES="en_US.UTF-8"
# LC_MONETARY="en_US.UTF-8"
# LC_NUMERIC="en_US.UTF-8"
# LC_TIME="en_US.UTF-8"
# LC_ALL="en_US.UTF-8"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(z zsh-autosuggestions git sudo)
# copyfile copypath copybuffer)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alias

alias cpd="realpath . | xclip -selection clipboard"
alias v="/home/cinnabar/bin/nvim.appimage"
alias tm="tmux"
# alias cpf="copyfile"
# alias ytdl="youtube-dl -x -f bestaudio --add-metadata --embed-thumbnail"
# alias nmtui="bspc rule -a \* -o state=floating layer=above rectangle=720x700+600+190 && kitty /usr/bin/nmtui"
alias ctf="source ~/Pwn/pwn/bin/activate"
alias fzfc="fzf | xclip -selection clipboard"
alias aslr-off='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias aslr-on='echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'
alias ptrace-scope-off='echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope'
alias ptrace-scope-on='echo 1 | sudo tee /proc/sys/kernel/yama/ptrace_scope'
alias pld="python3 -i solve.py LOCAL PLT_DEBUG"
alias plc="python3 -i solve.py LOCAL"
alias prm="python3 solve.py REMOTE"
alias cs="checksec --file"
alias readelf="creadelf.pl"
alias pwninit="pwninit --template-path ~/.config/pwn/pwninit-template.py --template-bin-name bin"
alias pwntmp="cp ~/.config/pwn/pwninit-template.py ./solve.py"
alias cquery="~/tools/cquery/build/cquery"
# alias vmlinux_to_elf="/home/cinnabar/tools/vmlinux-to-elf/vmlinux-to-elf"
# alias extract-image="/home/cinnabar/tools/extract-image.sh"
# alias rebuild-zimage="/home/cinnabar/tools/recreate-zImage/rebuild_kernel.sh"

#alias lsd="ls -p | grep /"


##autopair          #################
source ~/.config/zsh/zsh-autopair/autopair.zsh
autopair-init

source /home/cinnabar/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# TODO: uncomment for conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# __conda_setup="$('/home/cinnabar/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/cinnabar/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/cinnabar/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/cinnabar/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# NOTE: end conda
#
# <<< conda initialize <<<
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"


# For man-pages syntax highlight
# export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# NOTE: Might delete. Use to activate before use.
eval "$(starship init zsh)"

# NOTE: This one make start time so slow! 
# Lazy Load nvm only if NVM_LOADED is not set
load_nvm() {
    if [ -z "$NVM_LOADED" ]; then
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        export NVM_LOADED=1  # Mark nvm as loaded
    fi
}

