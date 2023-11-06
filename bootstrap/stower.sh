#!/bin/bash



./hierarchy.sh



echo -e "\n[$] > Stowing configuration files..." &&
cd ../files/home/ &&
stow -t $HOME */ &&

cd ../assets/ &&
stow -t $HOME */ &&

cd ../ &&
echo &&
su -c "mkdir -p /etc/X11/xorg.conf.d/ && stow -t /etc/X11/xorg.conf.d/ xorgs/" &&
echo -e "\n[$] > Done!"
