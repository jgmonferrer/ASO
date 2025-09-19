#!/bin/bash
if [ $# -ne 2 ]; then
echo "Error, debe escribir 2 argumentos"
exit 0
fi
if [ -f $1 ]; then
	if [ -e $2 ] || [ -d $2 ]; then
		echo "Error, el nombre del archivo destino ya existe"
		exit 1
	else
		cp $1 $2
	fi
else
	echo "Error, el archivo origen no existe"
	exit 1
fi
