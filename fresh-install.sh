sudo add-apt-repository ppa:greymd/tmux-xpanes
sudo apt-get update
sudo apt install software-properties-common


# Workflow
sudo apt install -y zsh git xclip \
    p7zip-full \
    gnome-shell-pomodoro \
    python2 python3-pip\
    libc++-dev libc++abi-dev gcc-11-plugin-dev \
    autoconf \
    nodejs npm sass \
    btop \
    valgrind gdbserver \
    ninja automake autoconf \
    checksec

# ccache
sudo apt install -y ccache
sudo /usr/sbin/update-ccache-symlinks
echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc

# Pwning
# openssl, liblzma, pkg-config are required
cargo install liblzma
cargo install pwninit

sudo apt install -y gcc ruby-dev
sudo gem install seccomp-tools

# Fuzzing
sudo apt install -y gcovr lcov clang cmake \
                    qemu-system-x86-64 

# NOTE: Docker
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

sudo systemctl enable docker.service
sudo systemctl enable containerd.service


# Less priority

sudo snap install obsidian --classic
sudo apt install -y i3 polybar nitrogen dunst rofi cargo tmux xclip tree yt-dlp
sudo apt update
sudo apt install tmux-xpanes

cargo install starship --locked

chsh -s $(which zsh)

