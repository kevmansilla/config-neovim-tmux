#/bin/bash

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

function dependencies(){
  tput civis
  clear; dependencies=(tmux nvim)

  echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Programa${endColour} Oh-my-bash -> "
  test -f ~/.oh-my-bash

  if [ "$(echo $?)" == "1" ]; then
    echo -e "${greenColour}(V)${endColour}"
  else
    echo -e "${redColour}(X)${endColour}\n"
    echo -e "${yellowColour}[**]${endColour} Instalando Oh my bash"
    bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" 2> /dev/null
  fi; sleep 1

  for program in "${dependencies[@]}"; do
    echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Programa${endColour} $program ->"
    test -f /usr/bin/$program
    if [ "$(echo $?)" == "0" ]; then
      echo -e " ${greenColour}(V)${endColour}"
    else
      echo -e " ${redColour}(X)${endColour}\n"
      echo -e "${yellowColour}[**]${endColour}${grayColour} Instalando ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
      sudo pacman -S $program
    fi; sleep 1
  done
}

# Main Function

dependencies

echo -e "\n${yellowColour}[*]${endColour} Configurando - Removiendo dotfiles existentes"

echo -e "\n${yellowColour}[**]${endColour} Removiendo config de neo vim"
rm -rf -v ~/.config/nvim

echo -e "\n${yellowColour}[**]${endColour} Remomoviendo config tmux"
rm -rf -v ~/.vim ~/.vimrc ~/.tmux.conf ~/.config/nvim 2> /dev/null

echo -e "\n${yellowColour}[**]${endColour} Remomoviendo config basrc"
rm -v ~/.bashrc

echo -e "\n${yellowColour}[**]${endColour} Linkeando con archivos del repo"

echo -e "\n${yellowColour}[**]${endColour} Linkeando archivos vim"
mkdir -v ~/.config/nvim/
mkdir -v ~/.config/nvim/lua/
mkdir -v ~/.config/nvim/lua/kevmansilla/
mkdir -v ~/.config/nvim/after
mkdir -v ~/.config/nvim/after/plugin/
cp -v nvim/init.lua ~/.config/nvim/
cp -v nvim/after/plugin/* ~/.config/nvim/after/plugin/
cp -v nvim/lua/kevmansilla/* ~/.config/nvim/lua/kevmansilla/

echo -e "\n${yellowColour}[**]${endColour} Linkeando con archivos del tmux"
ln -s -v tmux.conf ~/.tmux.conf

echo -e "\n${yellowColour}[**]${endColour} Linkeando con archivos del repo"
ln -s -v bashrc ~/.bashrc
