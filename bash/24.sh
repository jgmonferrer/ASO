#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Error. El uso del comando es 24.sh ruta_absoluta"
	exit 0
fi
if [[ -d $1 ]]; then
	num_ficheros=0
	num_subdirectorios=0
	for fichero in `ls $1`; do
		linea=$1/$fichero
		if [[ -d $linea ]]; then
			((num_subdirectorios++))
		elif [[ -f $linea ]]; then
			((num_ficheros++))
		fi
	done
else
	echo "El directorio especificado no existe"
	exit 0
fi
echo "Ficheros encontrados: $num_ficheros. Subdirectorios encontrados: $num_subdirectorios"
