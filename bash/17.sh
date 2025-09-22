#!/bin/bash
echo "Escriba un número, el script sumará todos los números que vaya introduciendo. Escriba '0' para terminar."
until [[ $numero == 0 ]]; do
	read -p "Escriba un número: " numero
	total=$(( $total + $numero ))
	echo $total
done
echo "Resultado final: $total"
