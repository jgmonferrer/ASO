$nombre = read-host "Escribe tu nombre"
[int]$repeticiones = read-host "Escribe el numero de veces que quiere repetir tu nombre"
for ($i=1;$i -le $repeticiones;$i++){
    write-host $nombre
}