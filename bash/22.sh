#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Error. El uso del comando es 22.sh ruta_absoluta"
	exit 0
fi
contador=0
for fichero in `ls $1`; do
linea=$1/$fichero
if [[ -d $linea ]]; then
	echo "$linea es un directorio"
elif [[ -f $linea ]]; then
	echo "$linea es un fichero"
fi
((contador++))
done
echo "Lineas procesadas: $contador"
