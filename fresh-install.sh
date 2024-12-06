sudo apt install software-properties-common

# Workflow.
# TODO: minimal self-made pomodoro on polybar
sudo apt install -y zsh git fzf \
    p7zip-full \
    python3-pip\
    libc++-dev libc++abi-dev gcc-11-plugin-dev \
    autoconf \
    btop \
    valgrind gdbserver \
    ninja-build automake autoconf \
    checksec

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# ccache
sudo apt install -y ccache
sudo /usr/sbin/update-ccache-symlinks
# NOTE: No need for my backup .zshrc 
# echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc

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

# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# change docker data-root
sudo cp ./docker/daemon.json /etc/docker/

# --------------------------------------------------------

# Less priority
sudo snap install obsidian --classic
sudo apt install -y i3 polybar feh dunst rofi tmux xclip ripgrep tree
sudo apt update


curl -sS https://starship.rs/install.sh | sh
chsh -s $(which zsh)
