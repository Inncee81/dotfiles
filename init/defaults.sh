#!/usr/bin/env bash
set -eu

# General
## disable auto-save
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

# Desktop & Screen Saver
## Screen Saver Start after: Never

# Dock
## autohide
defaults write com.apple.dock autohide -bool true

## size
defaults write com.apple.dock tilesize -int 40

## position left
defaults write com.apple.dock orientation -string "left"

## disable auto-rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

## Hide recent applications
defaults write com.apple.dock show-recents -bool false

## restart dock
killall Dock

# Language & Region
## Preferred languages: English, Japanese

# Security & Privacy
## Require passwore after: 5 seconds

# Notifications
## Turn off DnD: when the display is sleeping

# Displays
## Resolution: Scaled to 1680 x 1050
## Hide mirroring options in the menu bar

# Energy Saver
## Turn display off after: 15 minutes (Battery), 1 hour (Adapter)

# Keyboard
## key repeat
defaults write -g KeyRepeat -int 2

## delay until repeat
defaults write -g InitialKeyRepeat -int 25

## use function keys
defaults write -g com.apple.keyboard.fnState -bool true

## Change Caps Lock to Option or something

## spelling: US English
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
defaults write -g NSPreferredSpellServerLanguage -string "en"

## Shortcuts
### Unbind ctrl+f1, ctrl+space, ctrl+alt+space
### Bind ctrl+cmd+{num} to `Switch to Desktop {num}`

## Full Keyboard Access: All controls
defaults write -g AppleKeyboardUIMode -int 2

## Automatically switch to document's input source
defaults write com.apple.HIToolbox AppleGlobalTextInputProperties -dict TextInputGlobalPropertyPerContextInput 1

# Trackpad
## tracking speed
defaults write -g com.apple.trackpad.scaling -int 1

# Bluetooth
## Show Bluetooth in menu bar

# Sharing
## Change Computer Name

# Date & Time
## menu bar format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm"

# Finder
## show extensions
defaults write -g AppleShowAllExtensions -bool true

## show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

## show full path on title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## hide files on desktop
defaults write com.apple.finder CreateDesktop -bool false

## default location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

## Enable copy text in Quick Look (not available on El Capitan or later)
#defaults write com.apple.finder QLEnableTextSelection -bool true

## do not create .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

## restart Finder
killall Finder
