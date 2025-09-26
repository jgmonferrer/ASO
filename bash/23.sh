#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Error. El uso del comando es 23.sh ruta_absoluta"
	exit 0
fi
contador=0
for fichero in `ls $1`; do
linea=$1/$fichero
if [[ -d $linea ]]; then
	echo "$linea es un directorio"
elif [[ -f $linea ]]; then
	echo "$linea es un fichero"
elif [[ -L $linea ]]; then
	echo "$linea es un enlace simbolico"
elif [[ -c $linea ]]; then
	echo "$linea es un archivo especial de caracter"
elif [[ -b $linea ]]; then
	echo "$linea es un archivo especial de bloque"
fi
((contador++))
done
echo "Lineas procesadas: $contador"
