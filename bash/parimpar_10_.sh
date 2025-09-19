#!/bin/bash
read -p "Escriba un numero: " num1
modulo=$(( $num1%2 ))
if [ $modulo -eq 0 ]; then
echo "par"
else
echo "impar"
fi
