if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias pro "cd /Volumes/Code/projects"
alias brew "/opt/homebrew/bin/brew"
alias ls "exa"
alias ll "exa -l"

export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm use 16

export PNPM_HOME="/Users/j10c/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

export M2_HOME="/etc/maven/apache-maven-3.9.0"
export PATH="$M2_HOME/bin:$PATH"

eval "$(jenv init -)"
