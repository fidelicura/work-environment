#!/bin/bash



clear &&
echo -e "[$] > Welcome!" &&
echo -e "[$] > Installation will update your system" &&
echo -e "[$] > Installation will change Git config file" &&
echo -e "[$] > If you are OK with this, write your root password, else press CTRL+C" &&
echo -e "[$] > Continue?" &&
sudo clear &&



read -p "\n [$] > Enter name of user to change system rights for: " RIGHTS_USER
read -p "\n [$] > Enter name of system graphics driver to install (amdgpu/ati/intel/nouveau): " GRAPHICS_USER



cd ./bootstrap &&
./hierarchy.sh &&



echo -e "\n[$] > Creating temporary environment shell variables...\n" &&
export GOPATH=$HOME/.own/go
export CARGO_HOME=$HOME/.own/rust/cargo
export RUSTUP_HOME=$HOME/.own/rust/rustup
INST="sudo xbps-install" &&
REM="sudo xbps-remove -Roy" &&
GITHUB="git config --global" &&
function SERVICE() {
    local service_name="$@";
    sudo ln -sf /etc/sv/$service_name /var/service/
}
echo -e "\n[$] > Temporary environment shell variables successfully created!\n" &&
echo -e "\n[$] > Updating $RIGHTS_USER system rights...\n" &&
sudo usermod -aG audio,video,network,input,plugdev $RIGHTS_USER &&
echo -e "\n[$] > $RIGHTS_USER system rights successfully updated!\n" &&



echo -e "\n[$] > Updating system packages...\n" &&
$INST -Su &&
echo -e "\n[$] > System successfully updated!\n" &&



echo -e "\n[$] > Installing libraries, tools, programming languages and apps...\n" &&
$INST -Suy void-repo-nonfree &&
$INST -Suy linux linux-firmware linux-headers \
    intel-ucode mesa mesa-dri xf86-video-$GRAPHICS_USER \
    xorg-minimal bspwm sxhkd \
    dbus seatd pam_rundir dhcpcd chrony pipewire \
    xrandr xset xclip xwallpaper picom \
    bash git curl tar xz unzip unrar \
    man-db man-pages man-pages-devel man-pages-posix \
    gcc ccls python3 go fasm \
    make python3-pip python3-wheel pkg-config docker \
    kitty helix fzf stow telegram-desktop \
    papirus-icon-theme picom dunst rofi \
    xcolor slop shotgun handlr \
    bottom tty-clock tree calc rtorrent ufetch \
    firefox zathura-pdf-mupdf ffmpeg &&
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs |\
    sh -s -- -y --profile minimal --default-toolchain stable &&
source $HOME/.own/rust/cargo/env &&
rustup component add rust-analyzer clippy rustfmt &&
echo -e "\n[$] > Libraries, tools, programming languages and apps are succesfully installed!\n" &&



echo -e "\n[$] > Enabling services...\n" &&
SERVICE dbus &&
SERVICE sshd &&
SERVICE seatd &&
SERVICE docker &&
SERVICE dhcpcd &&
SERVICE chronyd &&
SERVICE pipewire &&
SERVICE pipewire-pulse &&
echo -e "\n[$] > Services enabled successfully!\n" &&



echo -e "\n[$] > Initializing PAM...\n" &&
echo "-session   optional   pam_rundir.so" | sudo tee -a /etc/pam.d/system-login &&
echo -e "\n[$] > PAM initialized successfully!\n" &&



echo -e "\n[$] > Changing GRUB config to skip choice part...\n" &&
sudo sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub &&
sudo update-grub &&
echo -e "\n[$] > GRUB config changed successfully!\n" &&



echo -e "\n[$] > Ignoring 'sudo' package...\n" &&
sudo touch /usr/share/xbps.d/ignorepkgs.conf &&
echo "ignorepkg=sudo" | sudo tee -a /usr/share/xbps.d/ignorepkgs.conf &&
echo -e "\n[$] > Ignored successfully!\n" &&

    

# echo -e "\n[$] > Setting up local Git settings...\n" &&
# $GITHUB user.email $GIT_EMAIL &&
# $GITHUB user.name $GIT_USERNAME &&
# $GITHUB credential.helper store &&
# $GITHUB http.postBuffer 157286400 &&
# echo -e "\n[$] > Git settings successfully set!\n" &&



echo -e "\n[$] > Removing 'sudo' package...\n" &&
sudo -c "ln -sf /bin/gcc /bin/clang" &&
$REM sudo &&
echo -e "\n[$] > Removed successfully!\n" &&



echo -e "\n[$] > Stowing configuration files...\n" &&
rm -f $HOME/.bashrc &&
rm -f $HOME/.bash_profile &&
cd ./bootstrap &&
./stower.sh &&
echo -e "\n[$] > Configuration files successfully stowed!\n" &&



echo -e "[$] > Installation successfully completed!" &&
echo -e "[$] > You are able to use your system" &&
echo -e "[$] > Optionally, reboot the system to be sure for 100%" &&
echo -e "[$] > Goodbye!\n"
