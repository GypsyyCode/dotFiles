export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(aws composer docker docker-compose git npm pip rsync)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

#neofetch
