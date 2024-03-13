#!/bin/bash
echo "Copying .tmux.conf to ~/."
cp ./setup/tmux/.tmux.conf ~/.tmux.conf

echo "Copying nvim to ~/.config/."
mkdir ~/.config
cp -r ./setup/nvim ~/.config/nvim

echo "Bootstrapping Packer"
echo 'require("dominik.packer")' > ~/.config/nvim/lua/dominik/init.lua
echo ls ~/setup/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Restoring nvim configuration"
cp ~/setup/nvim/lua/dominik/init.lua ~/.config/nvim/lua/dominik/init.lua

