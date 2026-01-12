$nombre = read-host "Escribe tu nombre"
$sexo = read-host "Escribe tu sexo (H/M)"
if (($sexo -ieq "M" -and $nombre -like "[a-m]*") -or ($sexo -ieq "H" -and $nombre -like "[n-z]*")) {
    write-host "Perteneces al grupo A"
} else {
    write-host "Perteneces al grupo B"
}
