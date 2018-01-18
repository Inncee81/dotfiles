#!/usr/bin/env zsh
### autolaod
autoload -Uz \
  w-cdup-or-insert-circumflex \
  w-fzf-ghq \
  w-fzf-ghq--cd \
  w-fzf-git-commit-hash \
  w-tig

autoload -z \
  w-fzf-ghq--browse \
  w-ls-and-git-status \
  w-open-current-directory

### keybindings
# <^>
zle -N w-cdup-or-insert-circumflex
bindkey '\^' w-cdup-or-insert-circumflex

# <ctrl-shift-]> or <ctrl-\>
zle -N w-fzf-ghq
bindkey '^\' w-fzf-ghq

# <alt-]>
zle -N w-fzf-ghq--browse
bindkey '^[]' w-fzf-ghq--browse

# <ctrl-]>
zle -N w-fzf-ghq--cd
bindkey '^]' w-fzf-ghq--cd

# <alt-@>
zle -N w-fzf-git-commit-hash
bindkey '^[@' w-fzf-git-commit-hash

# <alt-l>
zle -N w-ls-and-git-status
bindkey '^[l' w-ls-and-git-status

# <ctrl-o>
zle -N w-open-current-directory
bindkey '^O' w-open-current-directory

# <ctrl-^>
zle -N w-tig
bindkey '^^' w-tig
