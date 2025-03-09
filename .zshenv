export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export TERM=xterm-256color

export EDITOR="nano"
export VISUAL="nano"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory" # History filepath
export HISTSIZE=10000                # Maximum events for internal history
export SAVEHIST=10000                # Maximum events in history file

export FZF_COMPLETION_TRIGGER='\\'
export FZF_OPTIONS='--follow --hidden --exclude .git --exclude .cache --exclude .var --exclude node_modules --color=always'
export FZF_DEFAULT_COMMAND="fdfind --type f $FZF_OPTIONS"
export FZF_CTRL_T_COMMAND="fdfind --type f $FZF_OPTIONS"
export FZF_ALT_C_COMMAND="fdfind --type d $FZF_OPTIONS"
export FZF_DEFAULT_OPTS="--ansi"

export FZF_FLAGS="--excpect '/'"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --follow --hidden --exclude .git --exclude .cache --exclude .var --exclude node_modules --color=always . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --follow --hidden --exclude .git --exclude .cache --exclude .var --exclude node_modules --color=always . "$1"
}