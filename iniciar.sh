clear

if [ ! -d "bot" ]; then
	mkdir bot
fi

cd bot

if [ -e "dadosBot.ini" ] ; then

	screen -X -S bot quit > /dev/null
	screen -dmS bot php bot.php
	echo "Bot foi reiniciado e está executano em segundo plano"

else

echo "Instalando dependencias, aguarde..."

#add-apt-repository ppa:ondrej/php > /dev/null 2>&1
echo "00%"
apt-get update > /dev/null 2>&1
echo "05%"
apt-get upgrade -y > /dev/null 2>&1
echo "10%"
apt-get install php -y > /dev/null 2>&1
echo "15%"
apt-get install php-redis -y > /dev/null 2>&1
echo "20%"
apt-get install php-curl -y > /dev/null 2>&1
echo "30%"
apt-get install php5 -y > /dev/null 2>&1
echo "40%"
apt-get install php5-redis -y > /dev/null 2>&1
echo "50%"
apt-get install php5-curl -y > /dev/null 2>&1
echo "60%"
apt-get install redis-server -y > /dev/null 2>&1
echo "70%"
apt-get install redis -y > /dev/null 2>&1
echo "80%"
apt-get install screen -y > /dev/null 2>&1
echo "90%"
apt-get install zip -y > /dev/null 2>&1
echo "100%"
sleep3
echo "Baixando arquivos do BOT"
wget https://www.dropbox.com/s/6rcn9ak7ec8nrh9/gerarusuario-sshplus.sh?dl=0 -O gerarusuario.sh; chmod +x gerarusuario.sh > /dev/null
sleep3
wget https://github.com/fabricio94b/botfree/raw/main/bot.zip -O bot.zip && unzip bot.zip > /dev/null
sleep3
rm dadosBot.ini > /dev/null

clear

ip=$(wget -qO- ipv4.icanhazip.com/)

echo "Digite o TOKE do seu Bot:"
read token
clear
echo "ip=$ip
token=$token
limite=50" >> dadosBot.ini

screen -dmS bot php bot.php

rm bot.zip

echo "Bot ativado"

fi
