#!/bin/bash
comprobacion=0
for ((i=2;i<=$(( $1 / 2 ));i++)); do
	is_primo=$(( $1%$i ))
	if [ $is_primo == 0 ]; then
		echo "El número no es primo"
		comprobacion=1
		break
	fi
done
if [ $comprobacion -eq 0 ]; then
	echo "El número es primo"
fi
