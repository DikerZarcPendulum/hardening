#!/bin/bash
#Diego Ibarra Coronado
#Matrícula 1945924
#Seguridad en Sistemas Operativos

CENTOS=$(cat /etc/centos-release)
echo "La versión de CentOS de la maquina es $CENTOS"
sleep 2
clear

UBUNTU=$(cat /etc/lsd-release)
echo "La versión de Ubuntu de la maquina es $UBUNTU"
sleep 2
clear

echo "Se debe comprobar el estado del antivirus ClamAV"
rpm -q clamav
if  yum -q list installed *clamav*; then
        echo "Se debe reemplazar esta versión del antivirus"
        sleep 2
        sudo systemctl stop clamd@scan && sudo systemctl disable clamd@scan
        sudo systemctl status clamd@scan
        sudo freshclam
        sudo systemctl enable clamd@scan
        sudo systemctl start clamd@scan
        sudo systemctl status clamd@scan
        echo "El reemplazo de la versión del antivirus fue exitoso"
else
        echo "Se instalará el antivirus ClamAV"
        sleep 3
        sudo yum -y install epel-release
        sudo yum clean all
        sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
        sudo freshclam
        sudo setsebool -P antivirus_can_scan_system 1
        sudo setsebool -P clamd_use_jit 0
        sudo systemctl enable clamd@scan
        sudo systemctl start clamd@scan
        sudo yum remove epel-release
        sudo yum update
        echo "La instalación del antivirus fue exitosa"
fi
clear

if [[ $CENTOS = *7* ]]; then

    echo "Se instalaran los paquetes de EPEL en el sistema CentOS 7"
    sleep 2
    sudo wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo rpm -ivh epel-release-latest-7.noarch.rpm
    echo "Se verificara que aparezcan los paquetes en la lista de repositorios"
    sudo yum -y repolist
fi


echo "Se debe verificar las actualizaciones pendientes"
sleep 2
sudo yum list updates

echo "Se realizarán las actualizaciones necesarias"
sleep 2
sudo yum -y update
echo "Se recomienda que reinicie la maquina"

clear