# Path to your oh-my-zsh installation.
export ZSH="/home/blixhavn/.oh-my-zsh"

ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliases

# My scripts and executables
export PATH="$HOME/bin:$PATH"

# Keyboard and touchpad fixes
setxkbmap -layout no -option ctrl:nocaps
xinput --set-prop "Synaptics TM3288-011" "libinput Natural Scrolling Enabled" 1


# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

if [ "$TMUX" = "" ]; then exec tmux; fi
