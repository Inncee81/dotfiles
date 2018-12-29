#!/usr/bin/env bash
set -eu

PROJECT_ROOT=$(cd ${0%/*}/.. && pwd)
DOTFILES_DIR=$PROJECT_ROOT/linked
DOTFILES_DROPBOX_DIR=$HOME/Dropbox/.share

ln_s() {
  local target=$1/$2
  local link="$HOME/${3-}"
  link="${link%/}/$2"
  if [[ -L "$link" ]]; then
    echo "Symlink exists, skip: $link"
    return
  fi

  local link_dir="${link%/*}"
  if [[ ! -d "$link_dir" ]]; then
    mkdir -p "$link_dir"
  fi
  ln -isv $target "$link"
}

create_symlinks() {
  local dir=$1
  for target in $dir/.[A-Za-z]*; do
    if [[ -f $target && $target != */.DS_Store ]]; then
      ln_s $dir ${target##*/}
    fi
  done
}

create_symlinks_darwin() {
  ln_s $DOTFILES_DIR Code/User/keybindings.json Library/Application\ Support
  ln_s $DOTFILES_DIR Code/User/settings.json    Library/Application\ Support
  ln_s $DOTFILES_DIR Code/User/snippets         Library/Application\ Support
  ln_s $DOTFILES_DIR Library/Scripts
}

create_symlinks_linux() {
  ln_s $DOTFILES_DIR Code/User/keybindings.json .config
  ln_s $DOTFILES_DIR Code/User/settings.json    .config
  ln_s $DOTFILES_DIR Code/User/snippets         .config
}

create_symlinks $DOTFILES_DIR
[[ $(uname -s) = "Darwin" ]] && create_symlinks_darwin
[[ $(uname -s) = "Linux"  ]] && create_symlinks_linux

if [[ -d $DOTFILES_DROPBOX_DIR ]]; then
  create_symlinks $DOTFILES_DROPBOX_DIR
  ln_s $DOTFILES_DROPBOX_DIR .ssh/config
fi
