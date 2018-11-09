#!/usr/bin/env zsh
### autolaod
autoload -Uz \
  co \
  w-cdup-or-insert-circumflex \
  w-fzf-ghq \
  w-fzf-ghq--cd \
  w-fzf-git-checkout-local \
  w-fzf-git-commit-hash \
  w-fzf-git-unstaged-files

autoload -z \
  lab-browse \
  lab-mr \
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

# <alt-:>
zle -N w-fzf-git-checkout-local
bindkey '^[:' w-fzf-git-checkout-local

# <alt-@>
zle -N w-fzf-git-commit-hash
bindkey '^[@' w-fzf-git-commit-hash

# <alt-t>
zle -N w-fzf-git-unstaged-files
bindkey '^[t' w-fzf-git-unstaged-files

# <alt-l>
zle -N w-ls-and-git-status
bindkey '^[l' w-ls-and-git-status

# <ctrl-o>
zle -N w-open-current-directory
bindkey '^O' w-open-current-directory

# <ctrl-^>
bindkey -s '^^' '^Qtig^J'
