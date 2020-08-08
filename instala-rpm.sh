#/bin/bash

#PROCEDIMENTOS PARA UBUNTU/MINT/ELEMENTARY E VARIANTES

if [ $LOGNAME != root ]; then
	echo "execute instalador como root"
else
	echo "Instalando dependências"
	sleep 2
	# ZENITY
	echo "Instalando Zenity"
	yum install zenity -y
	ZEN=$?		

	# PYTHON PIP
	echo "Instalando Python PIP"
	yum install python-pip python-dev build-essential -y
	pip install --upgrade pip 
	pip install --upgrade virtualenv 
	PIP=$?
	
	# YOUTUBE-DL
	echo "Instalando Youtube-dl"
	wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
	chmod a+rx /usr/local/bin/youtube-dl
	DL=$?
fi

# TESTES NAS DEPENDÊNCIAS
echo "Testando Dependências"

if [ $ZEN -ne 0 ];then
	echo "Houve Problemas na instalação da dependência Zenity. Resintale Manualmente e aproveite o youDown"

else if [ $PIP -ne 0 ];then
	echo "Houve Problemas na instalação da dependência PYTHON PIP. Resintale Manualmente e aproveite o youDown"

if [ $DL -ne 0 ];then
	echo "Houve Problemas na instalação da dependência youtube-dl. Resintale Manualmente e aproveite o youDown"
else
	echo "As dependências foram instaladas com sucesso!"
fi

echo "Copiando Arquivos Necessários"
cp -rp .youDown /opt/

echo "Criando Link Simbólicos"
ln -s /opt/youDown/youdown /usr/bin/
ln -s /opt/youDown/youdown.desktop /usr/share/applications/

echo "Entregando Permissões"
chmod +x /opt/youDown/* -R

echo "Finalizando Instalação"
sleep 2

echo "Instalado com sucesso!"

