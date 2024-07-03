set fish_greeting ""

alias ls "eza"
alias ll "eza -l"

# Jenv
command -v jenv &> /dev/null && eval "$(jenv init -)"

# Zoxide
command -v zoxide &> /dev/null && zoxide init fish | source

# Cross-platform config
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
end

# Local config
set FISH_LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $FISH_LOCAL_CONFIG
  source $FISH_LOCAL_CONFIG
end
