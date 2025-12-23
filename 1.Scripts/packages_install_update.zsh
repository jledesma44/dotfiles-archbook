#!/bin/zsh
#

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

set -e # Exit on error

echo "######################################################################################"
echo "               ${YELLOW}!!  Package Installation / Updates !!${NC}                         "
echo "######################################################################################"

#Updates and upgrades the Arch linux local repositories
sudo pacman -Syu

#Install/Updates packages from pacman list.
sudo pacman -S --noconfirm --needed - <~/.dotfiles/2.Package-lists/pkglist_pacman.txt

#Install/Updates packages from yay/aur list.
yay -S --noconfirm --needed - <~/.dotfiles/2.Package-lists/pkglist_yay.txt

#Add any newly installed packages to pkglist_pacman.txt file
pacman -Qqe >~/.dotfiles/2.Package-lists/pkglist_pacman.txt

#kmonad - change file permissions to run as user when using exec-once command
sudo chmod u+s /usr/bin/kmonad

sudo usermod -aG input jledesma44

echo "${GREEN}All packages have been installed and or updated${NC}"
