#!/bin/sh
. ./TurnL.sh

stty sane

echo ------------------------------------------------------------------------------
echo
echo "                            自动环境准备脚本"
echo "                                                         By SF2005"
echo ------------------------------------------------------------------------------
echo "\33[41m注意：\33[0m\33[31m询问\"继续 [yN]  详细信息[d]\"请输入y.\33[0m"
echo "\33[31m询问\"dpkg (Y/I/N/O/D/Z) [默认选项=N]\"请直接回车\33[0m"
echo "\33[31m显示\"=== Command terminated normally (Xxx Xxx  XX XX:XX:XX XXXX) ===\"时请按x\33[0m"
get_char()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}
echo 
echo "请按任意键继续安装..."
echo "按 CTRL+C 退出."

char=`get_char`

printf "\033c"

#MBDS依赖解决-更新LTS
sudo apt update
sudo apt upgrade -y
sudo apt install -y update-manager-core
sudo screen -wipe
sudo do-release-upgrade
cd ~/workspace

wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.1.1.zip
sudo apt install unzip
unzip bedrock-server-1.12.1.1.zip
mv bedrock-server-1.12.1.1 Bedrock-MBDS
cd Java-Mohist 
#./Start.sh
cd ../Bedrock-MBDS
#./Start.sh
cd ../ && git clone https://github.com/Suwings/MCSManager.git
sudo apt -y install openjdk-8-jre
sudo apt -y install npm
sudo npm install -g n
sudo n stable
sudo apt -y install screen wget

#RDP

#sudo apt install -y xrdp
#sudo apt install -y vnc4server
#sudo apt install -y xfce4
#sudo apt install -y firefox
#sudo apt install -y firefox-locale-zh-hans
#sudo apt install -y language-pack-zh*
#sudo apt install -y fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming
#sudo echo "LANG="\zh_CN.UTF-8\" >/etc/environment
#sudo echo "LANGUAGE=\"zh_CN:zh:en_US:en\"" >/etc/environment
#sudo echo "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8\nzh_CN.GBK GBK\nzh_CN GB2312\n" >/var/lib/locales/supported.d/local
#sudo locale-gen
#echo "xfce4-session" >~/.xsession

#sudo apt -y install docker.io #Can not work nice.
cd MCSManager
npm install --production
node app.js &
sleep 5
killall node
cd ../
mkdir ./MCSManager/server
cp ./resources/*.json ./MCSManager/server/

wait

echo
echo 环境准备完成，请自行检查结果启动./Start.sh
echo
