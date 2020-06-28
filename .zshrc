# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load custom scripts from dotfiles
export PATH=~/.dotfiles/bin:${PATH}

export PATH=$(brew --prefix openvpn)/sbin:$PATH

# No need of using cd to move across directories
setopt AUTO_CD

# Setup Vim config from text-triumvirate
export EDITOR="vim"
bindkey -v 

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  

ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel10k Setup
POWERLEVE9K_MODE="awesome-patched"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# Zinit plugins

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-history-substring-search

# ohmyzsh fuzzy completion
zplugin snippet OMZ::lib/completion.zsh


zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

# Options for forgit (interactive git)
forgit_log=iglo
forgit_diff=igd
forgit_add=iga
forgit_reset_head=igrh
forgit_ignore=igi
forgit_restore=igcf
forgit_clean=igclean
forgit_stash_show=igss

# fzf git awesomeness
zplugin light 'wfxr/forgit'

zplugin ice wait"0" lucid
zplugin snippet OMZ::lib/git.zsh
zplugin ice wait"0" atload"unalias grv" lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh


# Turn on completion system
autoload -Uz compinit && compinit

# Setup theme
zinit ice depth=1; zinit light romkatv/powerlevel10k


# Import Aliases
source $HOME/.aliases

# Custom functions

# Find directory - looks for any children directory with real time search
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

opend() {
  local dir
  dir=$(find $HOME -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  code "$dir"
}

. /usr/local/opt/asdf/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
