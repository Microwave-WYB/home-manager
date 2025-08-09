# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz compinit; compinit

# zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light reegnz/jq-zsh-plugin

# bindkey
bindkey '^R' history-incremental-search-backward
bindkey "^[[3~" delete-char

# Environments
source $HOME/.env
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export CLICOLOR=1
export TERM=xterm-256color
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

local hm_session_vars="$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
if [[ -f $hm_session_vars ]]; then
    # Load Home Manager session variables if available.
    source $hm_session_vars
fi

# Alias
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

if command -v zeditor >/dev/null 2>&1; then
    alias zed="zeditor"
fi

if command -v trash >/dev/null 2>&1; then
    alias rm="trash"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

if command -v home-manager >/dev/null 2>&1; then
    alias hm="home-manager"
fi

# Functions
va() {
    # Start from the current directory.
    local dir="$PWD"

    while true; do
        # Check for venv or .venv in the current directory.
        for env in venv .venv; do
        if [[ -d "$dir/$env" && -f "$dir/$env/bin/activate" ]]; then
            source "$dir/$env/bin/activate"
            return
        fi
        done

        # If there are no more parents, break the loop.
        if [[ "$dir" == "/" ]]; then
            break
        fi

        # Move to the parent directory.
        dir="$(dirname "$dir")"
    done

    # If no venv was found, activate the default one.
    local activate="~/.venv/bin/activate"
    if [[ -f "$activate" ]]; then
        source "$activate"
    else
        echo "No venv found and default venv is not set up correctly"
    fi
}

y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
