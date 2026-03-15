alias ll='ls -lh'
alias la='ls -lah'

# Set up the prompt

# autoload -Uz promptinit
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

function venv_prompt() {
  [[ -n "$VIRTUAL_ENV" ]]
}

setopt PROMPT_SUBST
PROMPT='$(venv_prompt) [%F{yellow}%~%f%F{yellow}%f] ${vcs_info_msg_0_} >> '


# promptinit
# prompt adam1

setopt histignorealldups sharehistory

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use emacs keybindings even if our EDITOR is set to vi
# no-no-no
# bindkey -e

# only vim
bindkey -v

bindkey '^F' autosuggest-accept
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# aliases

alias reconnect_kb="~/scripts/reconnect_keyboard.sh"

alias fastfetch="fastfetch -l TempleOS --logo-padding-left 3 --logo-padding-top 3"

export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin:$PATH"
export GEM_HOME="$HOME/.local/share/gem/ruby/3.2.0"
export GEM_PATH="$GEM_HOME"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.cargo/bin:$PATH"
