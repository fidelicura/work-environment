#!/bin/bash



clear &&
echo -e "[$] > Welcome!" &&
echo -e "[$] > Installation will update your system" &&
echo -e "[$] > Installation will change Git config file" &&
echo -e "[$] > If you are OK with this, write your root password, else press CTRL+C" &&
echo -e "[$] > Continue?" &&
sudo clear &&



read -p "[$] > Enter your Git username: " GIT_USERNAME &&
read -p "[$] > Enter your Git email: " GIT_EMAIL &&
read -p "[$] > Enter name of the user to update useful system rigts: " RIGHTS_USER &&
read -p "[$] > Enter name videodriver ('intel'/'amdgpu'/'nouveau'): " GRAPHICS_USER &&



./bootstrap/hierarchy.sh



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
    intel-ucode xf86-video-$GRAPHICS_USER \
    xorg-minimal bspwm sxhkd \
    dbus seatd pam_rundir dhcpcd chrony pipewire \
    xrandr xset xclip xwallpaper picom \
    bash git curl tar xz unzip unrar \
    man-db man-pages \
    clang clang-tools-extra llvm python3 go fasm \
    make python3-pip python3-wheel pkg-config docker \
    kitty helix fzf stow mdp \
    papirus-icon-theme picom dunst rofi \
    xcolor slop shotgun \
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



echo -e "\n[$] > Ignoring 'sudo', 'wpa_supplicant' and 'gcc' packages...\n" &&
sudo touch /usr/share/xbps.d/ignorepkgs.conf &&
echo "ignorepkg=sudo" | sudo tee -a /usr/share/xbps.d/ignorepkgs.conf &&
echo "ignorepkg=wpa_supplicant" | sudo tee -a /usr/share/xbps.d/ignorepkgs.conf &&
echo "ignorepkg=gcc" | sudo tee -a /usr/share/xbps.d/ignorepkgs.conf &&
echo -e "\n[$] > Ignored successfully!\n" &&

    

echo -e "\n[$] > Setting up local Git settings...\n" &&
$GITHUB user.email $GIT_EMAIL &&
$GITHUB user.name $GIT_USERNAME &&
$GITHUB credential.helper store &&
$GITHUB http.postBuffer 157286400 &&
echo -e "\n[$] > Git settings successfully set!\n" &&



echo -e "\n[$] > Removing 'sudo', 'wpa_supplicant' and 'gcc' packages...\n" &&
sudo -c "ln -sf /bin/clang /bin/cc" &&
sudo -c "ln -sf /bin/clang /bin/g++" &&
sudo -c "ln -sf /bin/clang /bin/gcc" &&
$REM sudo wpa_supplicant gcc &&
echo -e "\n[$] > Removed successfully!\n" &&



echo -e "\n[$] > Stowing configuration files...\n" &&
rm -f $HOME/.bashrc &&
rm -f $HOME/.bash_profile &&
./bootstrap/stower.sh &&
echo -e "\n[$] > Configuration files successfully stowed!\n" &&



echo -e "[$] > Installation successfully completed!" &&
echo -e "[$] > You are able to use your system" &&
echo -e "[$] > Optionally, reboot the system to be sure for 100%" &&
echo -e "[$] > Goodbye!\n"
