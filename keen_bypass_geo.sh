#!/bin/sh

GREEN="\033[32m"
RED="\033[31m"
YELLOW="\033[33m"
RESET="\033[0m"

DOMAINS_IPS="
chatgpt.com 204.12.192.222
ab.chatgpt.com 204.12.192.222
auth.openai.com 204.12.192.222
auth0.openai.com 204.12.192.222
platform.openai.com 204.12.192.222
cdn.oaistatic.com 204.12.192.222
files.oaiusercontent.com 204.12.192.222
cdn.auth0.com 204.12.192.222
tcr9i.chat.openai.com 204.12.192.222
webrtc.chatgpt.com 204.12.192.222
android.chat.openai.com 204.12.192.219
api.openai.com 204.12.192.222
operator.chatgpt.com 204.12.192.221
sora.com 204.12.192.222
gemini.google.com 204.12.192.222
aistudio.google.com 204.12.192.222
generativelanguage.googleapis.com 204.12.192.222
aitestkitchen.withgoogle.com 204.12.192.222
aisandbox-pa.googleapis.com 204.12.192.219
webchannel-alkalimakersuite-pa.clients6.google.com 204.12.192.222
alkalimakersuite-pa.clients6.google.com 204.12.192.221
assistant-s3-pa.googleapis.com 204.12.192.221
proactivebackend-pa.googleapis.com 204.12.192.222
o.pki.goog 204.12.192.222
labs.google 204.12.192.222
notebooklm.google 204.12.192.222
notebooklm.google.com 204.12.192.222
copilot.microsoft.com 204.12.192.222
sydney.bing.com 204.12.192.222
edgeservices.bing.com 204.12.192.222
xsts.auth.xboxlive.com 50.7.85.221
codeium.com 50.7.87.85
inference.codeium.com 50.7.85.219
api.github.com 50.7.87.84
api.individual.githubcopilot.com 50.7.85.221
proxy.individual.githubcopilot.com 50.7.87.83
datalore.jetbrains.com 50.7.85.221
plugins.jetbrains.com 107.150.34.100
download.jetbrains.com 204.12.192.222
truthsocial.com 204.12.192.221
static-assets-1.truthsocial.com 204.12.192.221
api.tidal.com 204.12.192.222
listen.tidal.com 204.12.192.222
login.tidal.com 204.12.192.222
auth.tidal.com 204.12.192.222
link.tidal.com 204.12.192.222
dd.tidal.com 204.12.192.222
resources.tidal.com 204.12.192.222
images.tidal.com 204.12.192.221
fsu.fa.tidal.com 204.12.192.222
geolocation.onetrust.com 204.12.192.222
api.squareup.com 204.12.192.222
api-global.squareup.com 204.12.192.222
claude.ai 204.12.192.222
www.notion.so 204.12.192.222
www.canva.com 50.7.85.222
www.intel.com 204.12.192.222
www.dell.com 204.12.192.219
developer.nvidia.com 204.12.192.220
builds.parsec.app 107.150.34.99
"

main_menu() {
    while true; do
        echo
        echo -e "### ${RED}!!!ВНИМАНИЕ!!!${RESET}"
        echo -e "### ${YELLOW}Обход геоблока через hosts Keenetic/Netcraze для таких ресурсов как: <<ChatGPT, Gemini, Copilot, Codeium, JetBrains, Tidal, claude.ai, Сanva, Intel>>.${RESET}"
        echo -e "### ${YELLOW}Информация взята из открытых источников, если включен IPv6, то отключаем, так как работает только с IPv4.${RESET}"
        echo -e "### ${YELLOW}Если по прежнему ничего не работает, использовать VPN.${RESET}"
        echo
        echo "1. Заменить IP для обхода геоблока"
        echo "2. Удалить измененные IP"
        echo "3. Перезагрузить роутер"
        echo
        echo -n ">>> Выберите вариант: "
        
        read choice
        case $choice in
            1)
                echo -e "${YELLOW}Добавляю маршруты...${RESET}"
                echo "$DOMAINS_IPS" | while read -r domain ip; do
                    [ -n "$domain" ] && [ -n "$ip" ] && ndmc -c "ip host $domain $ip"
                done
                ndmc -c "system configuration save"
                echo
                echo -e "${GREEN}Готово!!!${RESET} Проверяю доступность..."
                
                echo "$DOMAINS_IPS" | while read -r domain ip; do
                    if [ -n "$domain" ]; then
                        if curl -4 -SLs --max-time 3 "https://$domain" -o /dev/null; then
                            echo -e "${GREEN}Доступен!!!${RESET} домен ${YELLOW}$domain${RESET}"
                        else
                            echo -e "${RED}Недоступен!${RESET} домен ${YELLOW}$domain${RESET}"
                        fi
                    fi
                done
                ;;
            2)
                echo -e "${YELLOW}Удаляю маршруты...${RESET}"
                echo "$DOMAINS_IPS" | while read -r domain ip; do
                    [ -n "$domain" ] && ndmc -c "no ip host $domain"
                done
                ndmc -c "system configuration save"
                echo
                echo -e "${GREEN}Готово!!!${RESET}"
                ;;
            3)
                echo -e "${YELLOW}Перезагрузка...${RESET}"
                reboot
                ;;
            *)
                echo -e "${RED}Неверный выбор!${RESET}"
                ;;
        esac
    done
}

main_menu
