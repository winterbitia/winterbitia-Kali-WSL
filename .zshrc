# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Export path
export PATH=$PATH:/home/winter/.local/bin:/home/winter/.cargo/bin

# Activate oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/json.json)"

# Keybindings
bindkey '^[w' kill-region			# Alt + W
bindkey ' ' magic-space				# Space
bindkey '5~' kill-word				# C + Del
bindkey '^H' backward-kill-word		# C + Back
bindkey '^[[1;5C' forward-word		# C + ->
bindkey '^[[1;5D' backward-word		# C + <-
bindkey '^[[H' beginning-of-line	# Home
bindkey '^[[F' end-of-line			# End

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Aliases
alias ls='ls -CF --color'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias nf='neowofetch'
alias c='clear'
alias q='exit'

# Work Aliases
alias vpn-its='/home/winter/vpn-script.sh'

# App Aliases
alias wcode='cmd.exe /c code'
alias ghidra='cmd.exe /c C:/WSL/tools/ghidra_11.2_PUBLIC_20240926/ghidra_11.2_PUBLIC/ghidraRun.bat'

# fzf theme
export FZF_DEFAULT_OPTS="--color=fg:#908caa,bg:#232136,hl:#ea9a97 --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97 --color=border:#44415a,header:#3e8fb0,gutter:#232136 --color=spinner:#f6c177,info:#9ccfd8 --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
export _ZO_FZF_OPTS=$FZF_DEFAULT_OPTS

# Zoxide setup
eval "$(zoxide init --cmd cd zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
