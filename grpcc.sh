#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl http://akses.jagoanneon-premium.xyz:81/akses | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Akses Di Izinkan...${NC}"
else
echo -e "${merah}VPS tidak diijinkan${NC}";
echo "Kontak Admin Untuk Mendapatkan Akses Script"
echo "Facebook   : Generasi Ronggolawe Tuban"
echo "WhatsApp   : 083857684916"
exit 0
fi
clear
figlet -f small Panel GRPC | lolcat
echo -e ""
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Create Grpc Account" | lolcat
echo -e "     [2]  Delete Grpc Account" | lolcat
echo -e "     [3]  Renew Grpc Tls Account" | lolcat
echo -e "     [4]  Check User Login Grpc" | lolcat
echo -e "     [x]  Exit" | lolcat
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-4 or x] :  " port
echo -e ""
case $port in
1)
addgrpc
;;
2)
delgrpc
;;
3)
renewgrpc
;;
4)
cekgrpc
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
