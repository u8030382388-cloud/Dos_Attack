#!/bin/bash

clear
sleep 1

sudo apt install figlet -y

printf '\033[38;2;235;85;100m'
figlet "DosBash"
printf '\033[0m\n'

python3 -c 's="By Elpíxel"; a=(220,45,45); b=(255,150,40); n=len(s); print("".join(f"\033[38;2;{int(a[0]+(b[0]-a[0])*i/max(n-1,1))};{int(a[1]+(b[1]-a[1])*i/max(n-1,1))};{int(a[2]+(b[2]-a[2])*i/max(n-1,1))}m{c}" for i,c in enumerate(s))+"\033[0m")'
echo "-----------------------------------------------------------"

sudo apt update && sudo apt upgrade -y

echo "Introduce una página web o una IP objetivo: "
read pagina

ping -c 9223372036854775807 $pagina
