#!/bin/bash
read -p "Escriba un numero: " num1
read -p "Escriba otro numero: " num2
resultado=$(( (num1 + num2) / 2))
echo "La media de los 2 números es $resultado"
