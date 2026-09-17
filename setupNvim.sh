#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# This will setup Neovim in an ubuntu distro.
# Uses kickstart distro 

# STEPS
# 1. download the latest release from github using curl 
# 2. extract it in that location 
# 3. adding its path 
# 4. setting up Kickstart 
# 5. doing extra settings => auto close parantheses etc 

# VARIABLES
shell_rc_path="~/.bashrc"

# FOR LINUX
sudo apt update
sudo apt install nodejs npm -y
sudo apt install -g tree-sitter-cli

#
#
# 1. download the latest release from github using curl 
github_url="https://github.com/neovim/neovim/releases/latest/download/"
version="nvim-linux-x86_64.tar.gz"
final_url="${github_url}${version}"


echo "Downloading from: ${final_url}..."

curl -LO "$final_url"
echo "Download complete!"

# 2. extract it in that location 
sudo rm -rf /opt/nvim-linux*
echo "Neovim Extraction started..."
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo "Neovim Extraction completed..."
rm nvim-linux-x86_64.tar.gz

# 3. adding its path 
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> "${shell_rc_path}"
source "${shell_rc_path}"
echo 'Congrats!! Neovim has been setup globally'
echo 'Its version is: '
nvim --version 

# 4. setting up Kickstart 
echo 'Cloning kickstart....'
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
echo 'Cloning completed...'

echo 'Starting nvim...'
echo 'Please give it 2 minutes to setup'
nvim
# 5. doing extra settings => auto close parantheses etc 
#

