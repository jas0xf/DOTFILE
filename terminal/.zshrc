# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	 grc
	 zsh-autosuggestions
   	 zsh-syntax-highlighting
     enhancd
     cd-ls)


source $ZSH/oh-my-zsh.sh

source $(dirname $(gem which colorls))/tab_complete.sh

export ENHANCD_FILTER="fzf --height 40%:fzy"
export ENHANCD_ENABLE_DOUBLE_DOT=false
path+=(
    $(ruby -e 'puts File.join(Gem.user_dir, "bin")')
)

#------------CUSTOM-------
alias ls='colorls'
alias nowrap='echo -ne "\x1b[?7l"'
alias wrap='echo -ne "\x1b[?7h"'
bindkey '^H' backward-kill-word # ctrl + backspace

alias vim='nvim'
alias cat='bat --paging=never'
alias gdb='gdbconfig'
alias example='tldr'

alias unzip='7za x'

alias 2zh='trans -b :zh-TW'
alias httpl2p='ssh -R 80:localhost:80 ssh.localhost.run'


export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
export PATH="$HOME/.local/bin:$PATH"

export OPENAI_API_KEY=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
[ -f ~/.lazyshell.zsh ] && source ~/.lazyshell.zsh

# rogue delete annoying Office Templete cos I don't know how to really diable it
if [[ -d ~/模板 ]]; then
    rm -rf ~/模板
fi

compdef '_files -g "*.md"' _typora
_typora() {
    typora "$1" > /dev/null 2>&1 & disown
}
alias open='_open'
compdef '_files -g "*.*"' _open
_open() {
    xdg-open "$1" & disown
}

alias md='_md'
compdef '_files -g "*.md"' _md
_md(){
    tmux new-session -d -s markdownsession \; \
        bind-key X "kill-session" \; \
        split-window -h \; \
        send-keys -t 1 "touch ./$2" C-m \; \
        send-keys -t 1 "pyenv" C-m \; \
        send-keys -t 1 "lookatme --single --live $1" C-m \; \
        send-keys -t 0 "nvim --cmd 'autocmd CursorHold * silent write' $1" C-m \; \
        select-pane -t 0 \; \
        attach-session -d
}



getRecentDownload(){
    string="$(ls -t ~/Downloads |head -1 | cut -b 11-)"
    mv ~/Downloads/${string%% } ./
}

pyenv(){
    source ~/WorkSpace/python_venv_bundle/bin/activate
}


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ctf-tools: gem install
export PATH=$PATH:/home/jas0xf/.local/share/gem/ruby/3.1.0/bin

# export http_proxy=http://proxy.ncu.edu.tw:3128/
# export https_proxy=$http_proxy
# export ftp_proxy=$http_proxy

