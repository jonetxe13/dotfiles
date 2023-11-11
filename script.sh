#!/bin/bash

#install nvim current latest
nvim_latest_version=$(curl -s https://github.com/neovim/neovim/releases/latest | grep -Po '".*"' )
# get version
nvim_latest_version="${nvim_latest_version:47:-1}"
# get download link
nvim_base_download_link=https://github.com/neovim/neovim/releases/download/${nvim_latest_version}
# append assets
nvim_appimage_link=$nvim_base_download_link/nvim.appimage

# download 
 wget $nvim_appimage_link 
 chmod +x nvim.appimage
 cp nvim.appimage /bin/nvim

#install kitty
sudo apt-get install kitty gnome-tweaks zsh
#install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

#the plugins and the powerlevel10k theme you have to mannually add them to your .zshrc file

mv -r ./nvim ~/config/.
mv -r ./kitty ~/config/.
mv -r ./.themes ~/.
mv -r ./.oh-my-zsh ~/.
mv -r ./.p10k.zsh ~/.
mv -r ./powerlevel10k ~/.

echo "folders moved successfully!!"

#move scripts to bin
sudo chmod +x usync dotfilessync
sudo cp usync dotfilessync /bin/.

cd ~/Desktop/

git clone https://github.com/jonetxe13/obsidian.git
git clone https://github.com/jonetxe13/universidad.git
