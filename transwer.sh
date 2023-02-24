#!/bin/bash
#
# TrAnswer: Open Source
# License: General Public License
# System: GNU/linux
# Date: 24-02-2023
#
# YouTube: https://youtube.com/channel/UCfMjNcFvJae_9g7wQI2W7EA
# Facebook: https://www.facebook.com/whitehacks00
# TikTok: https://tiktok.com/@whitehacks00
# Telegram: https://t.me/whitehacks00
# GitHub: https://github.com/Darkmux
#
# ==============================================
#                   VARIABLES
# ==============================================
operatingSystem=$(uname -o)
deviceArchitecture=$(uname -m)
showPath=$(pwd)
argument=$1
error=$2
# ==============================================
#                  LIGHT COLORS
# ==============================================
black="\e[1;30m"
blue="\e[1;34m"
green="\e[1;32m"
cyan="\e[1;36m"
red="\e[1;31m"
purple="\e[1;35m"
yellow="\e[1;33m"
white="\e[1;37m"
# ==============================================
#                  DARK COLORS
# ==============================================
blackDark="\e[0;30m"
blueDark="\e[0;34m"
greenDark="\e[0;32m"
cyanDark="\e[0;36m"
redDark="\e[0;31m"
purpleDark="\e[0;35m"
yellowDark="\e[0;33m"
whiteDark="\e[0;37m"
# ==============================================
#               BACKGROUND COLORS
# ==============================================
blackBack=$(setterm -background black)
blueBack=$(setterm -background blue)
greenBack=$(setterm -background green)
cyanBack=$(setterm -background cyan)
redBack=$(setterm -background red)
yellowBack=$(setterm -background yellow)
whiteBack=$(setterm -background white)
# ==============================================
#                   CHECK OS
# ==============================================
if [[ "${operatingSystem}" == "Android" ]]; then
    APT="pkg"
else
    APT="apt"
fi
# ==============================================
#            INSTALLING DEPENDENCIES
# ==============================================
checktrans=$(command -v trans)
if [[ "${checktrans}" == "" ]]; then
    ${APT} install translate-shell -y
fi
checkbat=$(command -v bat)
if [[ "${checkbat}" == "" ]]; then
    ${APT} install bat -y
fi
# ==============================================
#                BANNER TRANSWER
# ==============================================
function transwer() {
    clear
    echo -e "
 ${white}_____      ${red}_
${white}|_   _| __ ${red}/ \   _ __  _____      _____ _ __
  ${white}| || '__${red}/ _ \ | '_ \/ __\ \ /\ / / _ \ '__|
  ${white}| || | ${red}/ ___ \| | | \__ '\ V  V /  __/ |
  ${white}|_||_|${red}/_/   \_\_| |_|___/ \_/\_/ \___|_|

             ${white}WHITE HACKS © 2023
             ${black}Coded by: ${red}@Darkmux"
}
transwer
while [ true ]; do
    echo -e -n "${white}
exec transwer(${red}translate/shell${white}) > "
    read -r cmd
    echo -e ""
    res=$(${cmd})

    if [[ "${cmd}" == "exit" ]]; then
        exit
    elif [[ "${res}" == "" ]]; then
        echo "EL COMANDO NO ARROJA UNA RESPUESTA PARA TRADUCIR" | bat
    elif [[ "${cmd}" == "clear" ]]; then
        transwer
    else
        ${cmd} | trans -b :es | bat
    fi
done
