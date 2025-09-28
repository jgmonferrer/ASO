#!/bin/bash
function existe() {

	if [[ -e $1 ]]; then
		chmod u+x $1
	else
		echo "El archivo no existe"
		exit 1
	fi

}

if [[ $# -ne 1 ]]; then
	echo "Error. Uso del script: ./27.sh fichero"
else
	existe $1
fi
