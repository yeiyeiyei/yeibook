#!/bin/bash

# LABEL
echo -e "\e[1;33m
################################################################################
# SCRIPT: Verbose Details: OFF
################################################################################
\e[0m"
# COMMANDS (uncomment for detailed script live activity)
#set -v

echo -e "\e[1;42m
################################################################################
# ARGUMENTS
################################################################################
Argument 0 = Script Filename = $0
Argument 1 = User = $1
\e[0m"



echo -e "\e[1;32m
################################################################################
# OPTIONS: Color Codes (used in "echo").
################################################################################
TEXT                BACKGROUND
0  = reset          0  = reset
30 = black          40 = black
31 = red            41 = red
32 = green          42 = green
33 = yellow         43 = yellow
34 = blue           44 = blue
35 = magenta        45 = magenta
36 = cyan           46 = cyan
37 = white          47 = white
\e[0m"



# LABEL
echo -e "\e[1;33m
################################################################################
# UPDATE & UPGRADE
################################################################################
 \e[0m"
# COMMANDS
sudo apt -y update
sudo apt -y upgrade



# LABEL
echo -e "\e[1;33m
################################################################################
# FOLDERS: Prepare
################################################################################
 \e[0m"
# COMMANDS
sudo rm -rf /opt/*
sudo rm -rf /tmp/*
sudo rm /etc/apt/sources.list.d/*.list*
sudo mkdir /opt/github.com



# LABEL
echo -e "\e[1;33m
################################################################################
# SOFTWARE: Snap Purge
################################################################################
 \e[0m"
# COMMANDS
sudo apt purge -y snapd
sudo apt autoremove -y


# LABEL
echo -e "\e[1;33m
################################################################################
# CORE: PYTHON 3, Development Tools
# https://dev.to/py3course/setting-up-a-python-environment-in-2020-3e9e#whats-the-winning-recipe
################################################################################
 \e[0m"
# COMMANDS
# Dependencies
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev

# Python DEV
sudo apt install -y python3 python3-pip python3-setuptools python3-venv
python3 -m venv /home/$USER/.env/python/3

# PyEnv: Script
# https://github.com/pyenv/pyenv-installer
sudo curl https://pyenv.run | bash

# LABEL
echo -e "\e[1;33m
################################################################################
# UX: Touchpad 1, libinput
# https://github.com/bulletmark/libinput-gestures
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo gpasswd -a $USER input
sudo apt install -y xdotool wmctrl libinput-tools
sudo git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install



# LABEL
echo -e "\e[1;33m
################################################################################
# UX: Touchpad 2, gestures (after libinput)
# https://gitlab.com/cunidev/gestures
################################################################################
 \e[0m"
# COMMANDS
cd /opt/github.com
sudo mkdir cunidev
cd cunidev
sudo apt install -y python3 python3-gi python-gobject python3-setuptools
sudo apt install -y meson xdotool libinput-tools gettext
sudo git clone https://gitlab.com/cunidev/gestures
sudo git clone https://gitlab.com/cunidev/gestures
cd gestures
meson build --prefix=/usr
ninja -C build
sudo ninja -C build install



# LABEL
echo -e "\e[1;35m
################################################################################
# FIRMWARE: Bluez, Repository
# https://medium.com/@overcode/fixing-bluetooth-in-ubuntu-pop-os-18-04-d4b8dbf7ddd6
################################################################################
# SOFTWARE: Bluetooth Audio Configuration. Existing audio.conf
# https://medium.com/@overcode/fixing-bluetooth-in-ubuntu-pop-os-18-04-d4b8dbf7ddd6
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo add-apt-repository -y ppa:bluetooth/bluez
if [ -f "/etc/bluetooth/audio.conf" ];
then echo "The file exists, removing..."; sudo rm /etc/bluetooth/audio.conf;
fi
# create new audio config with content
sudo echo "# This section contains general options
[General]
Enable=Source,Sink,Media,Socket" > /etc/bluetooth/audio.conf
# Service restart
sudo service bluetooth restart



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: ATOM Editor
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update -y
sudo apt install -y atom



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Brave Browser
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo apt install -y apt-transport-https
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
sudo apt update -y
sudo apt install -y brave-browser brave-keyring



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Utils
################################################################################
 \e[0m"
# COMMANDS
sudo apt install -y perl git htop curl mdadm nfs-common bleachbit xclip # System
sudo apt install -y gparted gnome-disk-utility # Disks
sudo apt install -y pulseaudio pulseaudio-utils pavucontrol pulseaudio-module-bluetooth # Bluetooth
sudo apt install -y rdfind fdupes fslint # Duplicate Files Tools
sudo apt install -y openvpn nmap net-tools samba # Network
sudo apt install -y libreoffice # Desktop & Utils
sudo apt install -y gimp blender # Graphics
sudo apt install -y pavucontrol # Audio
sudo apt install -y cups # Printer
sudo apt install -y chromium-browser # Browser




# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Spotify
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - &&
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list &&
sudo apt update
sudo apt install -y spotify-client



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Docker.
# NOTE: Add your user to docker group. This script add root user to docker group.
# https://docs.docker.com/install/linux/linux-postinstall/
################################################################################
 \e[0m"
# COMMANDS
sudo apt install -y docker docker.io
sudo systemctl enable docker
sudo groupadd docker
sudo gpasswd -a $USER docker



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Kitematic
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
wget https://github.com/docker/kitematic/releases/download/v0.17.7/Kitematic-0.17.7-Ubuntu.zip
unzip Kitematic-0.17.7-Ubuntu.zip
sudo apt install -y /tmp/Kitematic-0.17.7_amd64.deb



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Slack. Point to specific version.
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.1-amd64.deb
sudo apt install -y /tmp/slack-desktop-4.0.1-amd64.deb



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: AngryIP. Point to specific version.
# https://angryip.org/download/#linux
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo wget https://github.com/angryip/ipscan/releases/download/3.5.5/ipscan_3.5.5_amd64.deb
sudo apt install -y /tmp/ipscan_3.5.5_amd64.deb



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: MQTTfx. Point to specific version.
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo mkdir /opt/MQTTfx/
sudo mkdir /opt/MQTTfx/MQTTfx
sudo wget http://www.jensd.de/apps/mqttfx/1.7.1/mqttfx-1.7.1-64bit.deb
sudo apt install -y /tmp/mqttfx-1.7.1-64bit.deb



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Katoolin
# https://github.com/LionSec/katoolin
################################################################################
 \e[0m"
# COMMANDS
sudo mkdir /opt/github.com/LionSec
cd /opt/github.com/LionSec
sudo git clone https://github.com/LionSec/katoolin.git
sudo cp katoolin/katoolin.py /usr/bin/katoolin
sudo chmod +x /usr/bin/katoolin



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: ddclient + Cloudflare API
# https://github.com/ddclient/ddclient/blob/master/README.md
################################################################################
 \e[0m"
# COMMANDS
cd /tmp
sudo apt install -y libdata-validate-ip-perl  #SIMILAR (Pearl): sudo perl -MCPAN -e 'install Data::Validate::IP'
git clone https://github.com/ddclient/ddclient.git
cd ddclient
sudo cp ddclient /usr/sbin/
sudo mkdir /etc/ddclient
sudo mkdir /var/cache/ddclient
sudo cp sample-etc_ddclient.conf /etc/ddclient/ddclient.conf
sudo ddclient -daemon=0 -verbose -noquiet

## MANUAL COMMAND
## sudo nano /etc/ddclient/ddclient.conf
## CONFIG: ddclient, Cloudflare (cloudflare.com)
## ssl=yes
## protocol=cloudflare, \
## zone=aquarela.cl, \
## server=www.cloudflare.com, \
## login=joaquin.estay@aquarela.cl,\
## password=3afe7e9653c366bf7fadcb89332796b1835da \
## yeibook.aquarela.cl,"

## For those using Ubuntu style rc files and using daemon-mode:
sudo cp sample-etc_rc.d_init.d_ddclient.ubuntu /etc/init.d/ddclient
## enable automatic startup when booting
sudo update-rc.d ddclient defaults
## start the first time by hand
sudo service ddclient start



# LABEL
echo -e "\e[1;35m
################################################################################
# Android Studio Tools (64)
# https://developer.android.com/studio/install#64bit-libs
################################################################################
 \e[0m"
# COMMANDS
sudo apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386



# LABEL
echo -e "\e[1;35m
################################################################################
# SOFTWARE: Speedtest
# https://github.com/sivel/speedtest-cli
################################################################################
 \e[0m"
# COMMANDS
sudo mkdir /opt/github.com/sivel
cd /opt/github.com/sivel
sudo git clone https://github.com/sivel/speedtest-cli.git
cd speedtest-cli
sudo python setup.py install
speedtest



# LABEL
echo -e "\e[1;35m
################################################################################
# SYSTEM: Final Tasks
################################################################################
 \e[0m"
# COMMANDS
sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
