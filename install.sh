#!/bin/bash

cd ~

# Adiciona nodejs ao repositório apt
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
sudo apt-get install -y nodejs

# Instala dependências
sudo apt update
sudo apt install -y build-essential cmake libreadline-dev stow nodejs gettext ripgrep golang fd-find

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
git switch release-0.11
make CMAKE_BUILD_TYPE=Release
sudo make install

cd ~

rm -rf neovim/ lua-5.1.5/ lua-5.1.5.tar.gz nodesource_setup.sh

# Instala command line do Tree-sitter para buildar o parser de Blade.php
npm install -g tree-sitter-cli
