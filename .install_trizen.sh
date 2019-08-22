curl https://aur.archlinux.org/cgit/aur.git/snapshot/trizen.tar.gz -O
tar xf trizen.tar.gz
cd trizen
makepkg -s
sudo pacman -U `find . -name "trizen*pkg.tar.xz"` --noconfirm
cd ..
rm -r trizen
rm trizen.tar.gz
