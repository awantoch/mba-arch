#!/bin/bash

# install stuff

sudo pacman -S yaourt fakeroot autoconf automake powertop htop
yaourt -Sya bcwc-pcie-git macfanctld xf86-input-mtrack-git xbindkeys xautomation grub-customizer

# copy stuff

echo "Copying mtrack config..."
sudo cp 50-mtrack.conf /usr/share/X11/xorg.conf.d/

echo "Copying rc.local..."
sudo cp rc.local /etc/rc.local

echo "Copying tilde fix to modprobe.d..."
sudo cp hid_apple.conf /etc/modprobe.d/

echo "Copying xbindkeys config..."
cp .xbindkeysrc ~/.xbindkeysrc

echo "Copying xbindkeys autostart..."
cp xbindkeys.desktop ~/.config/autostart/

echo "Copying Suspend fix..make sure to have swap!"
sudo cp 90-xhc_sleep.rules /etc/udev/rules.d/90-xhc_sleep.rules

echo "Copying resume wifi fix..."
sudo cp resume.sh /etc/resume.sh
sudo cp resume.service /etc/systemd/system/resume.service
sudo systemctl daemon-reload
sudo systemctl enable resume

echo "RECOMMENDED: Please add 'acpi_osi=' to your kernel params for more power savings!"
echo "Done!"
