#!/bin/bash

#simple shell changer.

if [ $(whoami) != "root" ]
then
   echo "sudo privileges required."
exit 1
fi

echo -n "choose a shell. [ 1.bash./2.fish./3.zsh./ ]: "
read num


[ "$num" -eq "1" ] && sudo chsh "$USER" -s /bin/bash
[ "$num" -eq "2" ] && sudo chsh "$USER" -s /bin/fish
[ "$num" -eq "3" ] && sudo chsh "$USER" -S /bin/zsh

[ -z "$num" ] && echo "invalid number."
