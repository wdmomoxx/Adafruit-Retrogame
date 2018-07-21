#!/bin/bash
clear

#    GPIO GameBoy keypad Installing by wdmomo

echo  "       \033[0;32m█              █\033[0m     "
echo  "  \033[0;33m█\033[0m     \033[0;32m█            █\033[0m     \033[0;33m█"
echo  "\033[0;33m  █  ████████████████████  █"
echo  "\033[0;33m  ███████\033[1;37m██\033[0;33m████████\033[1;37m██\033[0;33m███████"
echo  "\033[0;33m  ██████████████████████████"
echo  "\033[0;33m    ██████████████████████ "
echo  "\033[0;33m     ████████████████████  "
echo  "\033[0;33m        █             █   "
echo  "\033[0;33m       █               █  "
echo ""
echo ""
echo "*****************************************************************"
echo "*                                                               *"
echo "*           Installing GPIO GameBoy keypad by wdmomo            *"
echo "*                                                               *"
echo "*****************************************************************"
sleep 3
cd ~
git clone git://git.drogon.net/wiringPi
cd ~/wiringPi
./build
cd ~/retrogame
make
sudo install retrogame /usr/local/bin/retrogame
sudo sed -i 's/retrogame\ &//g' /etc/rc.local
sudo sed -i '/^exit\ 0/i\retrogame\ &' /etc/rc.local
sudo cp -r 10-retrogame.rules /etc/udev/rules.d/
sudo cp -r configs/retrogame.cfg.others /boot/retrogame.cfg
cd ~
sudo rm -rf wiringPi/
sudo rm -rf retrogame/
sudo reboot
