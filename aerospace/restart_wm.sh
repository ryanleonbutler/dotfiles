#!/usr/bin/env bash
osascript -e 'display notification "Restarting Environment" with title "Windows Manager"'
killall Dock
killall Finder
osascript -e 'quit app "AeroSpace"'
osascript -e 'activate app "AeroSpace"'
aerospace reload-config
brew services restart borders
