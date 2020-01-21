# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load custom scripts from dotfiles
export PATH=~/.dotfiles/bin:${PATH}

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

zplugin ice wait"0" lucid
zplugin snippet OMZ::lib/git.zsh
zplugin ice wait"0" atload"unalias grv" lucid
zplugin snippet OMZ::plugins/git/git.plugin.zsh

# fzf git awesomeness
zplugin light 'wfxr/forgit'

# Turn on completion system
autoload -Uz compinit && compinit

# Setup theme
zinit ice depth=1; zinit light romkatv/powerlevel10k


# Custom functions

# Find directory - looks for any children directory with real time search
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
