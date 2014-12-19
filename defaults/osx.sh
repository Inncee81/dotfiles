#!/usr/bin/env bash
set -eu

# Desktop & Screen Saver
## Screen Saver Start after: Never

# Dock
## autohide
defaults write com.apple.dock autohide -bool true

## size
defaults write com.apple.dock tilesize -int 36

## position left
defaults write com.apple.dock orientation -string "left"

## disable auto-rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

## restart dock
killall Dock

# Security & Privacy
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Spotlight
## Spotlight menu/window keyboard shortcut: unchecked

# Displays
## Resolution: Scaled to 1680 x 1050

# Energy Saver
## Turn display off after: 30 minutes (Battery), 1 hour (Adapter)

# Keyboard
## key repeat
defaults write -g KeyRepeat -int 2

## delay until repeat
defaults write -g InitialKeyRepeat -int 25

## use function keys
defaults write -g "com.apple.keyboard.fnState" -bool true

## spelling: US English
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false

# Trackpad
## tracking speed
defaults write -g "com.apple.trackpad.scaling" -int 1

## expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Bluetooth
## Turn Bluetooth off

# Sharing
## Change Computer Name

# Date & Time
## menu bar format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  HH:mm"

# Finder
## show extensions
defaults write -g AppleShowAllExtensions -bool true

## show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

## hide files on desktop
defaults write com.apple.finder CreateDesktop -bool false

## default location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

## do not create .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## restart Finder
killall Finder
