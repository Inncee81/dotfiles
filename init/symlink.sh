#!/usr/bin/env bash
set -eu

PROJECT_ROOT=$(cd ${0%/*}/.. && pwd)
DOTFILES_DIR=$PROJECT_ROOT/linked
DOTFILES_DROPBOX_DIR=$HOME/Dropbox/.share

ln_s() {
  local target_dir=$1
  local target=$2
  local link_dir=$HOME/${3-}
  link_dir=${link_dir%/}
  local link=$link_dir/$target
  if [[ -L $link ]]; then
    echo "Symlink exists, skip: $link"
  else
    ln -isv $target_dir/$target $link
  fi
}

create_symlinks() {
  local dir=$1
  for target in $dir/.[A-Za-z]*; do
    if [[ -f $target ]]; then
      ln_s $dir ${target##*/}
    fi
  done
}

create_symlinks_darwin() {
  ln_s $DOTFILES_DIR Code/User/keybindings.json Library/Application\ Support
  ln_s $DOTFILES_DIR Code/User/settings.json    Library/Application\ Support
  ln_s $DOTFILES_DIR Library/Scripts
}

create_symlinks_linux() {
  ln_s $DOTFILES_DIR Code/User/keybindings.json .config
  ln_s $DOTFILES_DIR Code/User/settings.json    .config
}

create_symlinks $DOTFILES_DIR
[[ $(uname -s) = "Darwin" ]] && create_symlinks_darwin
[[ $(uname -s) = "Linux"  ]] && create_symlinks_linux

if [[ -d $DOTFILES_DROPBOX_DIR ]]; then
  create_symlinks $DOTFILES_DROPBOX_DIR
  ln_s $DOTFILES_DROPBOX_DIR .ssh/config
fi
