#!/bin/bash
case $1 in
	1)
		#Estructura for
		for ((i=1;i<=1000;i++)); do
			sumatorio=$(( $sumatorio + $i ))
		done
		echo "$sumatorio"
		;;
	2)
		#Estructura while
		iteracion=1
		while [[ $iteracion -lt 1001 ]]; do
			sumatorio=$(( $sumatorio + $iteracion ))
			((iteracion++))
		done
		echo "$sumatorio"
		;;
	3)
		#Estructura until
		iteracion=0
		until [[ $iteracion -gt 1000 ]]; do
			sumatorio=$(( $sumatorio + $iteracion ))
			((iteracion++))
		done
		echo "$sumatorio"
		;;
	*)
		echo "Porfavor, ejecuta este comando con un parámetro. Utilice 1 si quiere ejecutar la estructura for, 2 para la estructura while y 3 para la estructura until"
		;;
esac
