#!/bin/bash

echo "Procesos del sistema:"
ps -eo user,pid,ni,tty,%cpu,pmem,args
read -p "¿Desea modificar la prioridad de algún proceso? (s/n) " modificar
case $modificar in
	's')
		read -p "Escriba el PID del proceso: " pid
		read -p "Escriba la nueva prioridad del proceso: " prioridad
		renice --priority $prioridad -p $pid
		;;
	'n')
		echo "saliendo..."
		exit 0
		;;
	*)
		echo "Opción no reconocida, saliendo..."
		exit 1
		;;
esac
