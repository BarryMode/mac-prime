echo ; echo '--- Preferences' ; echo
read -p 'Install Preferences? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
    echo ; echo 'Loading Bash Profile, Git Config, and Git Ignore...'
    ditto ./.[^.]* ~/
    echo 'Loading Sublime Text Settings...'
    ditto ./Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
    echo 'Loading OS X system settings...'
    # Disable Dashboard.
    defaults write com.apple.dashboard mcx-disabled -boolean YES
    echo 'Loading Finder settings...'
    # Finder: Set the default Finder location to the home folder.
    defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
    defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
    # Finder: Set the current directory as the default search scope.'
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    # Finder: Activate the path bar.
    defaults write com.apple.finder ShowPathbar -bool true
    # Finder: Activate the status bar.
    defaults write com.apple.finder ShowStatusBar -bool true
    # Finder: Display the Library folder.
    chflags nohidden ~/Library
    # Finder: Display folders first when sorted by kind.
    # ditto ./InfoPlist.strings /System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/
    # Finder: Disable the extension change warning.
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    # Desktop: Disable icons for hard drives, servers, and removable media.
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false && \
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false && \
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool false && \
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
    echo 'Loading Quick Look settings...'
    # Quick Look: Enable text selection.
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE
    echo 'Loading Terminal settings...'
    # Terminal: Pro Theme.
    defaults write com.apple.Terminal "Default Window Settings" "Pro"
    echo 'Loading Safari settings...'
    # Safari: Activate the develop menu.
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
  ;;
esac
echo ; read -p 'Shortcut for Sublime Text alias? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
    ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
  ;;
esac