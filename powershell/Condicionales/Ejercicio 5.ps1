$fichero = read-host "Escribe el nombre de un fichero o carpeta"
if (Test-Path $fichero) {
    write-host "El fichero o carpeta existe"
} else {
    write-host "El fichero o carpeta no existe"
}