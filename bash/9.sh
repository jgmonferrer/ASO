#!/bin/bash
echo "-------- MENU PRINCIPAL --------"
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"
read -p "Elija una opción: " opcion
read -p "Escriba el primer número: " num1
read -p "Escriba el segundo número: " num2

case $opcion in
	1)
		resultado=$(( $num1 + $num2 ))
		echo "$num1 + $num2 equivale a $resultado"
		;;
	2)
		resultado=$(( $num1 - $num2 ))
		echo "$num1 - $num2 equivale a $resultado"
		;;
	3)
		resultado=$(( $num1 * $num2 ))
                echo "$num1 * $num2 equivale a $resultado"
                ;;
	4)
		resultado=$(( $num1 / $num2 ))
                echo "$num1 / $num2 equivale a $resultado (redondeado)"
                ;;
	*)
		echo "opcion no reconocida"
		exit 0
esac
