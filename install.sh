#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


echo -e "\n${yellowColour}[*]${endColour} Verificando si están los programas necesarios."
sleep 2

echo -e "\n${yellowColour}[**]${endColour} Oh my bash, está instalado?"
test -f ~/.oh-my-bash
if [ "$(echo $?)" == "1" ]; then
  echo -e "${greenColour}(Sí)${endColour}"
else
  echo -e "${redColour}(No)${endColour}\n"
  echo -e "${yellowColour}[**]${endColour} Instalando Oh my bash"
  bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" 2> /dev/null
fi; sleep 1

echo -e "\n${yellowColour}[**]${endColour} Tmux, está instalado?"
test -f ~/.tmux
if [ "$(echo $?)" == "1" ]; then
  echo -e "${greenColour}(Sí)${endColour}"
else
  echo -e "${redColour}(No)${endColour}\n"
  echo -e "${yellowColour}[**]${endColour} Instalando tmux"
  pamac install tmux > /dev/null 2>&1
fi; sleep 1

echo -e "\n${yellowColour}[**]${endColour} Neovim, está instalado?"
test -f ~/.config/nvim/
if [ "$(echo $?)" == "1" ]; then
  echo -e "${greenColour}(Sí)${endColour}"
else
  echo -e "${redColour}(X)${endColour}\n"
  echo -e "${yellowColour}[**]${endColour} Instalando nvim"
  sudo pacman -S neovim > /dev/null 2>&1
fi; sleep 1

echo -e "\n${yellowColour}[*]${endColour} Configurando - Remomoviendo dotfiles existentes"
echo -e "\n${yellowColour}[**]${endColour} Removiendo config de neo vim"

rm -rf ~/.config/nvim

echo -e "\n${yellowColour}[**]${endColour} Remomoviendo config tmux"
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

echo -e "\n${yellowColour}[**]${endColour} Linkeando con archivos del repo"
mkdir -p ~/.config/ ~/.config/nvim/ ~/.config/nvim/lua/ ~/.config/nvim/lua/kevmansilla/
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/nvim/* ~/.config/nvim/


