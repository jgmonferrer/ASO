#!/bin/bash
if [ $(id -u) -ne 0 ]; then
	echo "Por razones del sistema operativo, ficheros como /etc/passwd o copias del mismo no pueden ser modificados con el comando sed a menos de que sea root"
	exit 0
elif [ -e backpasswd ]; then
	sed -i 's/daemon/servicio/g' backpasswd # Para no utilizar el fichero /etc/passwd, se utilizará una copia creada en la misma carpeta que el script
else
	echo "el archivo backpasswd no existe en la ruta del script"
	exit 0
fi

