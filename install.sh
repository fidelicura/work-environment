#!/bin/bash



clear &&
echo -e "[$] > Welcome!" &&
echo -e "[$] > Installation will update your system" &&
echo -e "[$] > Installation will change Git config file" &&
echo -e "[$] > If you are OK with this, write your root password, else press CTRL+C" &&
echo -e "[$] > Continue?" &&
sudo clear &&



read -p "\n [$] > Enter name of user to change system rights for: " RIGHTS_USER



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
$INST -Suyv void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree &&
$INST -Suyv linux linux-firmware linux-headers \
    intel-ucode nvidia nvidia-libs nvidia-libs-32bit \
    mesa mesa-32bit glu glu-32bit vulkan-loader vulkan-loader-32bit \
    xorg-minimal bspwm sxhkd \
    dbus seatd pam_rundir dhcpcd polkit-gnome chrony openssl pipewire \
    xrandr xset xclip xwallpaper picom \
    bash git curl tar xz unzip unrar udiskie \
    man-db man-pages man-pages-devel man-pages-posix \
    gcc ccls python3 go fasm zig zls ghc haskell-language-server tectonic texlab \
    make python3-pip python3-wheel pkg-config docker \
    alacritty helix fzf stow telegram-desktop \
    steam libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit \
    papirus-icon-theme picom dunst rofi \
    xcolor slop shotgun handlr \
    bottom tty-clock tree calc rtorrent ufetch \
    firefox zathura-pdf-mupdf &&
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

    

echo -e "\n[$] > Removing 'sudo' package...\n" &&
$REM sudo &&
echo -e "\n[$] > Removed successfully!\n" &&



echo -e "\n[$] > Stowing configuration files...\n" &&
su -c "ln -sf /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/" &&
su -c "xbps-reconfigure -f fontconfig" &&
rm -f $HOME/.bashrc &&
rm -f $HOME/.bash_profile &&
rm -f $HOME/.profile &&
cd ./bootstrap &&
./stower.sh &&
echo -e "\n[$] > Configuration files successfully stowed!\n" &&



echo -e "[$] > Installation successfully completed!" &&
echo -e "[$] > You are able to use your system" &&
echo -e "[$] > Optionally, reboot the system to be sure for 100%" &&
echo -e "[$] > Goodbye!\n"
