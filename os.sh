# Angry IP Scanner
# https://angryip.org/download/#linux

# ATOM IDE
# https://atom.io/

# BRAVE
# https://brave.com/linux/
#cd /tmp &&
#sudo apt install -y  apt-transport-https curl &&
#curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - &&
#echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list &&
#sudo apt update &&
#sudo apt install -y brave-browser

# Chromium browser
#cd /tmp &&
#sudo apt install -y chromium-browser

# Spotify
#
#cd /tmp &&
#sudo curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - &&
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list &&
#sudo apt-get update && sudo apt-get install spotify-client

# Python DEV
# https://dev.to/py3course/setting-up-a-python-environment-in-2020-3e9e#whats-the-winning-recipe
# Dependencies
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev

sudo apt install python3-pip

# Script
sudo curl https://pyenv.run | bash
