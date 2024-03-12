#!/bin/bash

echo "Copying .tmux.conf to ~/."
cp ./tmux/.tmux.conf ~/.tmux.conf

echo "Copying nvim to ~/.config/."
mkdir ~/.config
cp -r nvim ~/.config/nvim
