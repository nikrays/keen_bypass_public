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
sora.chatgpt.com 204.12.192.222
sora.com 204.12.192.222
videos.openai.com 204.12.192.222
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
jules.google.com 204.12.192.222
stitch.withgoogle.com 204.12.192.222
copilot.microsoft.com 204.12.192.222
sydney.bing.com 204.12.192.222
edgeservices.bing.com 204.12.192.222
rewards.bing.com 204.12.192.221
xsts.auth.xboxlive.com 204.12.192.222
xgpuwebf2p.gssv-play-prod.xboxlive.com 204.12.192.222
xgpuweb.gssv-play-prod.xboxlive.com 204.12.192.222
api.spotify.com 204.12.192.222
xpui.app.spotify.com 204.12.192.222
appresolve.spotify.com 204.12.192.222
login5.spotify.com 204.12.192.222
login.app.spotify.com 204.12.192.222
encore.scdn.co 204.12.192.222
ap-gew1.spotify.com 204.12.192.222
gew1-spclient.spotify.com 204.12.192.222
spclient.wg.spotify.com 204.12.192.222
api-partner.spotify.com 204.12.192.222
aet.spotify.com 204.12.192.222
www.spotify.com 204.12.192.222
accounts.spotify.com 204.12.192.222
open.spotify.com 204.12.192.221
api.github.com 50.7.87.84
api.individual.githubcopilot.com 204.12.192.222
proxy.individual.githubcopilot.com 204.12.192.222
datalore.jetbrains.com 50.7.85.221
plugins.jetbrains.com 107.150.34.100
download.jetbrains.com 204.12.192.222
elevenlabs.io 204.12.192.222
api.us.elevenlabs.io 204.12.192.222
elevenreader.io 204.12.192.222
api.elevenlabs.io 204.12.192.222
help.elevenlabs.io 204.12.192.222
truthsocial.com 204.12.192.221
static-assets-1.truthsocial.com 204.12.192.221
grok.com 204.12.192.222
accounts.x.ai 204.12.192.222
assets.grok.com 204.12.192.222
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
cdn.id.supercell.com 3.160.212.81
security.id.supercell.com 18.172.112.81
accounts.supercell.com 45.95.233.23
game-assets.clashroyaleapp.com 18.66.195.96
game.clashroyaleapp.com 51.158.190.98
game-assets.clashofclans.com 3.162.38.39
gamea.clashofclans.com 70.34.251.56
clashofclans.inbox.supercell.com 108.157.194.81
game.brawlstarsgame.com 179.43.168.109
game-assets.brawlstarsgame.com 18.239.69.129
store.supercell.com 204.12.192.222
deepl.com 204.12.192.222
www.deepl.com 204.12.192.222
www2.deepl.com 204.12.192.222
login-wall.deepl.com 204.12.192.222
w.deepl.com 204.12.192.219
s.deepl.com 204.12.192.222
dict.deepl.com 204.12.192.222
ita-free.www.deepl.com 204.12.192.222
write-free.www.deepl.com 204.12.192.222
experimentation.deepl.com 204.12.192.222
deezer.com 204.12.192.220
www.deezer.com 204.12.192.220
dzcdn.net 204.12.192.220
payment.deezer.com 204.12.192.220
weather.com 204.12.192.220
upsx.weather.com 204.12.192.220
guilded.gg 204.12.192.219
www.guilded.gg 204.12.192.219
api.fitbit.com 204.12.192.219
fitbit-pa.googleapis.com 204.12.192.219
fitbitvestibuleshim-pa.googleapis.com 204.12.192.219
fitbit.google.com 204.12.192.219
claude.ai 204.12.192.222
console.anthropic.com 204.12.192.220
www.notion.so 204.12.192.222
www.canva.com 50.7.85.222
www.intel.com 204.12.192.222
www.dell.com 204.12.192.219
www.tiktok.com 50.7.85.219
web.archive.org 142.54.189.106
developer.nvidia.com 204.12.192.220
builds.parsec.app 107.150.34.99
tria.ge 204.12.192.220
api.imgur.com 204.12.192.220
www.dyson.com 45.95.233.23
www.dyson.fr 45.95.233.23
usher.ttvnw.net 45.95.233.23
api.manus.im 64.188.98.242
4pda.to 185.246.223.127
usher.ttvnw.net 45.95.233.23
"

main_menu() {
    while true; do
        echo
        echo -e "### ${RED}!!!ВНИМАНИЕ!!!${RESET}"
        echo -e "### ${YELLOW}Обход геоблока через hosts Keenetic/Netcraze для таких ресурсов как: <<ChatGPT, Gemini, Copilot, Codeium, JetBrains, Tidal, claude.ai, Сanva, Intel>>.${RESET}"
        echo -e "### ${YELLOW}Информация взята из открытых источников, если включен IPv6, отключаем, так как работает только с IPv4.${RESET}"
        echo -e "### ${YELLOW}Если по прежнему ничего не работает, использовать VPN.${RESET}"
        echo
        echo "1. Заменить все IP адреса для обхода геоблока некоторых ресурсов (Только IPv4)"
        echo "2. Удалить ранее измененные IP адреса для обхода геоблока"
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
