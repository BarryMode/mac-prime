# Permissions
echo ; echo '--- Permissions' ; echo
echo 'Granting Executive Rights...'
sudo chown -R $(whoami):admin /usr/local
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
find $HOME -type f \( -perm 777 -o -perm 666 \) -exec chmod 644 {} \; -print

# Dot configs
echo ; echo 'Loading dot configs...'
ditto ./Settings/.[^.]* ~/

# Xcode
echo ; echo '--- Xcode' ; echo
read -p 'Install Xcode Command Line Tools? * (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing Xcode Command Line Tools...'
  xcode-select --install
  ;;
esac

# Ruby
echo ; echo '--- Ruby' ; echo
read -p 'Update RubyGems? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Updating RubyGems...'
  sudo gem update --system
  ;;
esac

# Jekyll
echo ; read -p 'Install Gem: Jekyll? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing Jekyll...'
  sudo gem install jekyll
  ;;
esac

# Sass
echo ; read -p 'Install Gem: Sass? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Installing Sass...'
  sudo gem install sass
  ;;
esac

# Wayback Machine Downloader
echo ; read -p 'Install Gem: Wayback Machine Downloader? (y/n) ' answer
case ${answer:0:1} in
  y|Y )
  echo 'Installing Wayback Machine Downloader...'
  gem install wayback_machine_downloader
  ;;
esac

# Homebrew
echo ; echo '--- Homebrew' ; echo
read -p 'Install Homebrew? * (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  echo 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
  echo ; echo 'Updating Homebrew...'
  brew update
  ;;
esac

echo ; echo '--- Development Packages' ; echo
read -p 'Install Development Packages? (y/n) ' answer
case ${answer:0:1} in
  y|Y|yes|Yes )
  # Ack
  echo ; echo 'Installing Ack...'
  brew install ack
  # GCC
  echo ; echo 'Installing GCC...'
  brew install gcc
  # ImageMagick
  echo ; echo 'Installing ImageMagick...'
  brew install imagemagick
  # Ghostscript
  echo ; echo 'Installing Ghostscript...'
  brew install ghostscript
  # QT5
  echo ; read -p 'Install QT5? (y/n) ' answer
  case ${answer:0:1} in
  y|Y|yes|Yes )
    echo 'Installing QT5...'
    brew install qt5 #--with-docs --with-developer --with-d-bus --with-mysql
    ;;
  esac
  # FileBot
  echo ; echo 'Installing FileBot...'
  brew cask install filebot
  # Qlvideo
  echo ; echo 'Installing Qlvideo...'
  brew cask install qlvideo
  # Youtube-dl
  echo ; echo 'Installing Youtube-dl...'
  brew install youtube-dl
  brew install ffmpeg
  # Python
  echo ; echo 'Installing Python...'
  brew install python
  # Buster
  sudo pip install buster
  # Node
  echo ; echo 'Installing Node...'
  brew install node010
  echo ; echo 'Upgrading Homebrew Packages...'
  brew upgrade
  # Coffeescript
  echo ; echo 'Installing CoffeeScript...'
  sudo npm install -g coffee-script
  # Underscore
  echo ; echo 'Installing Underscore...'
  sudo npm install -g underscore
  # Moment
  echo 'Installing Moment...'
  sudo npm install -g moment
  # Gulp
  echo 'Installing Gulp...'
  sudo npm install -g gulp gulp-util bower gulp-concat gulp-sass gulp-minify-css gulp-rename shelljs
  # Electron
  echo 'Installing Electron...'
  sudo npm install -g electron-prebuilt
  echo ; echo 'Updating Node Packages...'
  npm update
  ;;
esac