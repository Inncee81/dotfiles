#!/usr/bin/env bash
set -eu

ZSH_PATHS=(
  /usr/local/bin/zsh
  /usr/bin/zsh
  /bin/zsh
)
ZGEN_PATH=$HOME/src/github.com/tarjoilija/zgen/zgen.zsh
TPM_PATH=$HOME/.tmux/plugins/tpm/tpm

prepare_login_shell() {
  for path in "${ZSH_PATHS[@]}"; do
    if [[ -x $path ]]; then
      _prepare_login_shell $path
      return
    fi
  done

  echo "zsh is not found, exit."
  exit 1
}

_prepare_login_shell() {
  local new=$1

  local current=$(get_login_shell)
  if [[ -z $current ]]; then
    echo "Can't get current login shell, exit."
    exit 1
  elif [[ $current = $new ]]; then
    echo "Login shell is already set, skip."
    return
  fi

  echo "Setting login shell..."
  set_login_shell $current $new
}

get_login_shell() {
  local os=$(uname -s)
  if [[ $os = "Darwin" ]]; then
    dscl . -read $HOME UserShell | cut -d ' ' -f 2
  elif [[ $os = "Linux" ]]; then
    getent passwd $USER | cut -d : -f 7
  fi
}

set_login_shell() {
  local current=$1
  local new=$2

  local os=$(uname -s)
  if [[ $os = "Darwin" ]]; then
    sudo dscl . -change $HOME UserShell $current $new
  elif [[ $os = "Linux" ]]; then
    chsh -s $new
  fi
}

prepare_zgen() {
  if [[ -x $ZGEN_PATH ]]; then
    echo "zgen exists, skip."
    return
  fi
  git clone https://github.com/tarjoilija/zgen ${ZGEN_PATH%/*}
}

prepare_tpm() {
  if [[ -x $TPM_PATH ]]; then
    echo "tpm exists, skip."
    return
  fi
  git clone https://github.com/tmux-plugins/tpm ${TPM_PATH%/*}
}

prepare_login_shell
prepare_zgen
prepare_tpm
