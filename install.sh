#!/bin/bash

cd ~

# Adiciona nodejs ao repositório apt
curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh

# Instala dependências
sudo apt update
sudo apt install -y build-essential cmake libreadline-dev stow nodejs gettext ripgrep tree-sitter-cli

cd ~

# Instala lib Lua
curl -L -R -O https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar zxf lua-5.1.5.tar.gz
cd lua-5.1.5/
make linux
sudo make install

cd ~

# Instala neovim
git clone --recursive https://github.com/neovim/neovim.git
cd neovim/
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd ~

rm -rf neovim/ lua-5.1.5/ lua-5.1.5.tar.gz nodesource_setup.sh
