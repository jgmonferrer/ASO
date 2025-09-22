#!/bin/bash
echo "-------- MENU PRINCIPAL --------"
echo "1) Añadir"
echo "2) Buscar"
echo "3) Listar"
echo "4) Ordernar"
echo "5) Borrar"
read -p "Elija una opción: " opcion
case $opcion in
	1)
		read -p "Introduce el nombre, dirección y teléfono de la persona: " registro
		echo "$registro" >> lista.txt
		;;
	2)
		read -p "Introduce el nombre, dirección o teléfono que quiera buscar: " entrada
		grep $entrada lista.txt
		;;
	3)
		cat lista.txt
                ;;
	4)
		sort lista.txt
                ;;
	5)
		rm lista.txt
		;;
	*)
		echo "Opción no reconocida"
esac
