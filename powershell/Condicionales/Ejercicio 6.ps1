$ruta = read-host "Escribe la ruta a un fichero o carpeta"
if (test-path $ruta -PathType Container) {
    Write-Host "La ruta es un fichero, listando contenido..."
    get-childitem $ruta -Recurse
} else {
    write-host "La ruta no existe o no es un fichero"
}
