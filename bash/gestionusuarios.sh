#!/bin/bash
#Ejercicio 14
apellido1="${3:0:2}"
apellido2="${4:0:2}"
inicial="${2:0:1}"
usuariofinal=$(echo "alu$apellido1$apellido2$inicial" | tr '[:upper:]' '[:lower:]')



if [ $# = 4 ] && [ $1 == "alta" ]; then
	groupadd $usuariofinal
	useradd -g $usuariofinal -d /home/$usuariofinal -m -s /bin/bash $usuariofinal
	echo "Añadiendo el usuario $usuariofinal con el grupo $usuariofinal"
elif [ $# = 5 ] && [ $1 == "alta" ]; then
	groupadd $5
	useradd -g $5 -d /home/$usuariofinal -m -s /bin/bash $usuariofinal
	echo "Añadiendo el usuario $usuariofinal con el grupo $5"
elif [ $# = 4 ] || [ $# = 5 ] && [ $1 == "baja" ]; then
	userdel $usuariofinal
	echo "borrando el usuario $usuariofinal"
else
	echo "Error. La sintaxis correcta es ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
fi
