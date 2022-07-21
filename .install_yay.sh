curl https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz -O
tar xf yay.tar.gz
cd yay
makepkg -sr
sudo pacman -U `find . -name "yay*pkg.tar.*"` --noconfirm
cd ..
rm -rf yay
rm yay.tar.gz
