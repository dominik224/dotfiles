#!/bin/bash

echo "Copying .tmux.conf to ~/."
cp ./tmux/.tmux.conf ~/.tmux.conf

echo "Copying nvim to ~/.config/."
mkdir ~/.config
cp -r nvim ~/.config/nvim

echo "Bootstrapping Packer"
echo 'require("dominik.packer")' > ~/.config/nvim/lua/dominik/init.lua
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Restoring nvim configuration"
cp -r nvim ~/.config/nvim

