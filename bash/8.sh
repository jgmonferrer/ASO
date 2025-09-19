#!/bin/bash
read -p "Escriba un numero: " num1
read -p "Escriba otro numero: " num2
if [ $num1 -gt $num2 ]; then
echo "El primer número es mayor"
elif [ $num1 -eq $num2 ]; then
echo "Los 2 números son iguales"
else
echo "El segundo número es mayor"
fi
