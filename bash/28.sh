#!/bin/bash
#Para ejecutar el script, necesita los paquetes net-tools, nmap y network-manager
function informacion_red() {
	read -p "escriba la interfaz: " interfaz
	broadcast=$(ip address show $interfaz | egrep 'inet.*.brd' | awk -F 'brd ' '{print$2}' | cut -d " " -f 1)
	echo "Broadcast de la red: $broadcast"
	cidr="/$(ip address show $interfaz | egrep 'inet.*.brd' | cut -d " " -f 6 | cut -d '/' -f 2)"
	echo "Tipo de red: $cidr"
	subnet_mask=$(ifconfig $interfaz | egrep 'inet.*.broadcast' | awk -F "netmask " '{print$2}' | cut -d " " -f 1)
	echo "Máscara de subred: $subnet_mask"
	network=$(nmcli dev show $interfaz | grep 'IP4.ROUTE\[1\]' | cut -d " " -f30 | sed 's/,//')
	echo "Red del equipo: $network"
}
function escaneo_ips() {
	echo "Escaneando la red, por favor espere..."
	nmap -v $network | grep 'Nmap scan report for' | cut -d " " -f 5,6,7
	echo "Todas las IPs disponibles estan marcadas con [host down], el resto de IPs están activamente en uso"
}
informacion_red
escaneo_ips
