#!/bin/bash
respuesta=37
read -p "Escriba un número del 1 al 100, el programa le dirá si el número es mayor o menor al que debe resolver. Escriba '0' para rendirse: " input
until [ $input -eq $respuesta ]; do
	if [ $input -eq 0 ]; then
		echo "El usuario se ha rendido"
		exit 0
	elif [ $input -lt 0 ] || [ $input -gt 100 ]; then
		echo "El número escrito no está en los límites del juego, su valor no se ha tomado en cuenta"
	elif [ $input -gt $respuesta ]; then
		echo "El número a adivinar es menor al que ha escrito"
	elif [ $input -lt $respuesta ]; then
		echo "El número a adivinar es mayor al que ha escrito"
	fi
	read -p "Introduzca otro número: " input
done
echo "Enhorabuena, ha acertado el número"
