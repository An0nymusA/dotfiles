source $ZDOTDIR/zinit.zsh

eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Plugins
#fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)
# source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::command-not-found

autoload -U compinit && compinit
zinit cdreplay -q

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':completion:*' list-max-items 20
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':completion:*' fzf-tab continuous-trigger '/'

# zstyle ':fzf-tab:*' fzf-flags "$FZF_FLAGS"

# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

source $ZDOTDIR/bindings
source $ZDOTDIR/aliases

eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"

enable-fzf-tab

# bun completions
[ -s "/home/adam/.bun/_bun" ] && source "/home/adam/.bun/_bun"

. "$HOME/.config/local/share/../bin/env"
