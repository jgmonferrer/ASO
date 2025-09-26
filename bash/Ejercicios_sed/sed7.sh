#!/bin/bash
if [ $(id -u) -ne 0 ]; then
	echo "Por razones del sistema operativo, ficheros sensibles o copias de los mismos no pueden ser modificados con el comando sed a menos de que sea root"
	exit 0
elif [ -e backservices ]; then
	sed -E -i '/(^#|^$)/d' backservices # Para no utilizar el fichero /etc/services, se utilizará una copia creada en la misma carpeta que el script
else
	echo "el archivo backservices no existe en la ruta del script"
	exit 0
fi

