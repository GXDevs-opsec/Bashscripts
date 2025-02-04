#!/bin/bash


add_a_fulluser5() {
   clear
 echo -n "[+]type the name of the new user:"
 read name
 sudo adduser $name
echo -n "[+]press enter to exit.."
read 
clear
 }



see_all_users() {

echo -n "[+]type the name of the user:"
read name

 if id "$name" &>/dev/null 2>&1; then
        clear
     cat /etc/passwd | grep $name
     id -u $name && echo "user's id" && id -g $name && echo "user's group id"
     echo "[+]press enter to exit.."
       read 
        clear
 else
      clear
     echo "[!] user not found"
    sleep 2
    clear
 fi 

 }




simply_add_user() {

 clear
 echo -n "[+]type the name of the new user:"
 read name
 sudo useradd $name
 echo -n "[+]press enter to exit.."
 read
 clear

 }




change_password() {

 clear
 echo -n "[+]please enter the name of the user:"
 read name

 if id "$name" &>/dev/null 2>&1; then
     sudo passwd $name
   echo -n "[+]user's password successfuly changed, press enter to exit.."
   read
  else
     clear
     echo "[!]user not found"
    sleep 2
   clear
 fi

}






change_shell() {
clear
echo -n "[+]type the name of the user and the shell you want to change:"
echo "[bash]/[sh]/[csh]/[ksh]/[zsh]"
read name
read shell

if id "$name" &>/dev/null 2>&1; then
   sudo usermod $name --shell /bin/$shell
    echo -n "[+]press enter to exit"
    read
          clear
    else 
     clear
    echo "[!]user not found"
    sleep 2
    clear
fi
}






change_name() {

clear
echo -n "type the user's name:"
read name
 if id "$name" &>/dev/null 2>&1; then
   echo -n "type the new name for the user:"
   read reborn
   sudo usermod -l $name $reborn
   echo -n "[+]press enter to exit"
   read
   clear
  else
     clear
    echo "[!]user not found"
       sleep 2
      clear
 fi

}





create_custom_user() {
clear
 echo -n "type the new user's name:"
 read name
 echo "1.create home "-m" "
 echo "2.create password "-p" "
 echo "3.create a group  "-n""
 echo -n "[!]type:"
 read num1 num2 num3
 sudo useradd $name $num1 $num2 $num3
  echo -n "[+]press enter to exit"
  read
  clear
}



switch_user() {

clear
echo -n "type the user's name:"
read name
 if id "$name" &>/dev/null 2>&1; then
   sudo su - $name
  else
    clear
    echo "[!]user not found"
    sleep 2
    clear
 fi

}





give_sudo_perms() {

pantheon=/etc/sudoers.tmp
num=70

clear
echo -n "type the user's name:"
read name 

SUDO_POWER="$name ALL = ALL"

 if id "$name" &>/dev/null 2>&1; then
   sed i "${num}s/.*/${SUDO_POWER}/" "$pantheon"
   echo -n "[+]the user $name has officially sudo permissions,press enter to exit" 
   read
   clear
   else
        clear
     echo "[!]user not found"
       sleep 2
      clear
  fi
 }






delete_users() {

clear
echo -n "type the user's name:"
read name
 if id "$name" &>/dev/null 2>&1; then
   sudo userdel $name
   echo -n  "[+]user deleted successfuly, press enter to exit"
   read
   clear 
  else
       clear 
    echo "[!]user not found"
       sleep 2
      clear
 fi
 }






creat_group() {

clear
 echo -n "type the name of the group:"
 read name
  sudo groupadd $name
 echo -n "[+]group $name is now available, press enter to exit"
  read
  clear
 }



see_groups() {

clear
echo -n "type the groups name:"
read name
cat /etc/group | grep $name
echo -n "[+]press enter to exit"
read
clear
 }





give_sudo_perms_group() {

pantheon=/etc/sudoers.tmp
num=80


clear
echo -n "type the group's name:"
read name

SUDO_POWER="%$name ALL = NOPASSWD:ALL"
   sed i "${num}s/.*/${SUDO_POWER}/" "$pantheon"
   echo -n "[+]the group $name has officially sudo permissions, press enter to exit"
  read
  clear
 }





add_users_group() {

clear
echo -n "type the user's name:"
read name
echo -n "type the group's name:"
read group

 if id "$name" &>/dev/null 2>&1; then
   sudo usermod -aG $group $name
     echo -n "[+]user $name is now member of the group $group, press enter to exit"
    read
    clear
  else
     clear
    echo "[!]user not found"
   sleep 2 
     clear
 fi

 } 





remove_users_group() {

clear
echo -n "type the user's name:"
read name
echo -n "type the group's name:"
read group

 if id "$name" &>/dev/null 2>&1; then
   sudo gpasswd -d $name $group
   echo -n "[+]user $name has been removed from the group $group, press enter to exit"
   read
   clear
  else
      clear
    echo "[!]user not found"
     sleep 2
      clear
 fi

 }




clear
until [[ $num == "16" ]]
do
echo   " USER MANAGER "
echo "------------------"
echo " "
echo "[1]-Change the shell for a user"
echo "[2]-Change the name of a user"
echo "[3]-Create a user (no directory/no passwd)"
echo "[4]-Create a user (custom)"
echo "[5]-Create a full user"
echo "[6]-Set a password for a user"
echo "[7]-Switch user"
echo "[8]-Give sudo permissions to users"
echo "[9]-Delete a user"
echo "[10]-Create a group"
echo "[11]-See users"
echo "[12]-See groups"
echo "[13]-Add users on groups"
echo "[14]-Remove users from groups"
echo "[15]-Give sudo permissions to groups"
echo "[16]-Exit"
echo -n "[+] please choose a number:"
read num

[ "$num" -eq "1" ] && change_shell 
[ "$num" -eq "2" ] && change_name
[ "$num" -eq "3" ] && simply_add_user
[ "$num" -eq "4" ] && create_custom_user
[ "$num" -eq "5" ] && add_a_fulluser5
[ "$num" -eq "6" ] && change_password
[ "$num" -eq "7" ] && switch_user
[ "$num" -eq "8" ] && give_sudo_perms
[ "$num" -eq "9" ] && delete_users
[ "$num" -eq "10" ] && creat_group
[ "$num" -eq "11" ] && see_all_users
[ "$num" -eq "12" ] && see_groups
[ "$num" -eq "13" ] && add_users_group
[ "$num" -eq "14" ] && remove_users_group
[ "$num" -eq "15" ] && give_sudo_perms_group

done
