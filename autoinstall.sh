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
cd ~
git clone https://github.com/wdmomoxx/Adafruit-Retrogame.git
cd Adafruit-Retrogame
make
sudo install retrogame /usr/local/bin/retrogame
sudo sed -i 's/retrogame\ &//g' /etc/rc.local
sudo sed -i '/^exit\ 0/i\retrogame\ &' /etc/rc.local
sudo sed -i '1i/SUBSYSTEM=="input",\ ATTRS{name}=="retrogame",\ ENV{ID_INPUT_KEYBOARD}="1"' /etc/udev/rules.d/10-retrogame.rules
sudo cp configs/retrogame.cfg /boot/retrogame.cfg
sudo cp configs/retrogame.cfg.2player /boot/retrogame.cfg.2player
cd ~
sudo rm -rf wiringPi/
sudo rm -rf Adafruit-Retrogame/
sudo reboot
