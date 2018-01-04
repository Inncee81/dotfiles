dotfiles
====
[![Build Status](https://travis-ci.org/kojole/dotfiles.svg?branch=master)](https://travis-ci.org/kojole/dotfiles)

> :wrench: My dotfiles


Environments
----
- macOS Sierra


Setup
----
```console
$ make brew
$ make shell       # after installing zsh
$ make symlink     # after syncing ~/Dropbox/.share
```


Files in this repository
----
| directory | files |
| --- | ----- |
| init | init scripts |
| linked | dotfiles linked to $HOME |
| spec | serverspec tests for localhost |
