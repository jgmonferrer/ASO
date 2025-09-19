#!/bin/bash
fecha=$(date +%H)
shopt -s extglob
case $fecha in 
	[8-9]|[1][0-5])
		echo "Buenos días"
		;;
	[1][0-6]|[2][0])
		echo "Buenas tardes"
		;;
	[2][1-3]|[0-8])
		echo "Buenas noches"
		;;
	*)
		echo "nada"
		;;
esac

