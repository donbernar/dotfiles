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

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

zinit snippet OMZ::plugins/osx/osx.plugin.zsh

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/brew/brew.plugin.zsh
zinit snippet OMZ::plugins/docker/_docker

zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
# zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh
# zinit snippet OMZ::plugins/tmuxinator/tmuxinator.plugin.zsh

# Setup theme
zinit ice depth=1; zinit light romkatv/powerlevel10k



# Alias here:
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias gss='git status --short'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gm='git merge'
alias gp='git pull'
alias ggp="git push origin $(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')"

# Custom functions

# Find directory - looks for any children directory with real time search
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
