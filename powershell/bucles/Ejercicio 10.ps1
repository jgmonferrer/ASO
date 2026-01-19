do {
    write-host "=======Menu principal======="
    write-host "a) Crear una carpeta"
    write-host "b) Crear un fichero nuevo"
    write-host "c) Cambiar el nombre de un fichero o carpeta"
    write-host "d) Borrar un archivo o carpeta"
    write-host "e) Verificar si existe un fichero o carpeta"
    write-host "f) Mostrar el contenido de un directorio"
    write-host "g) Mostrar la fecha y hora actuales"
    write-host "x) Salir"
    $opcion = read-host "Escribe una opción"
    switch ($opcion){
        "a"{
            $nombreCarpeta = read-host "Escribe el nombre de la carpeta a crear"
            if (Test-Path $nombreCarpeta -PathType Container) {
                write-host "El directorio ya existe"
            } else {
                New-Item $nombreCarpeta -ItemType directory
                write-host "Creado el directorio $nombreCarpeta"
                write-host ""
            }
        }
        "b"{
            $nombreFichero = read-host "Escribe el nombre del fichero a crear"
            if (Test-Path $nombreFichero) {
                write-host "El fichero ya existe"
            } else {
                New-Item $nombreFichero -ItemType file
                write-host "Creado el fichero $nombreFichero"
                write-host ""
            }
        }
        "c"{
            $cambioItem = read-host "Escribe el nombre del fichero o carpeta a cambiar el nombre"
            if (Test-Path $cambioItem) {
                $nuevoNombreItem = read-host "Escribe el nuevo nombre del fichero o carpeta"
                if (Test-Path $nuevoNombreItem){
                    write-host "El nombre que ha proporcionado ya existe dentro del directorio actual"
                } else {
                    Move-Item -path $cambioItem -destination $nuevoNombreItem
                    write-host "Item $cambioItem movido a $nuevoNombreItem"
                    write-host ""
                }
            }
        }
        "d"{
            $borrarItem = read-host "Escribe el nombre del fichero o carpeta a borrar"
            if (Test-Path $borrarItem){
                remove-item $borrarItem
                write-host "Borrado el item $borrarItem"
                write-host ""
            } else {
                write-host "el fichero o carpeta no existe"
                write-host ""
            }
        }
        "e"{
            $comprobarItem = read-host "Escribe el nombre del fichero o directorio para comprobar si existe"
            if (test-path $comprobarItem){
                write-host "El fichero o carpeta existe"
                write-host ""
            } else {
                write-host "El fichero o carpeta no existe en el directorio"
                write-host ""
            }
        }
        "f"{
            $listarDirectorio = read-host "Escribe el directorio a listar su contenido"
            if (test-path $listarDirectorio){
                Get-ChildItem $listarDirectorio
                write-host ""
            } else {
                write-host "El directorio no existe en esta carpeta"
                write-host ""
            }
        }
        "g"{
            write-host "Mostrando fecha y hora actual..."
            Get-Date -displayhint date
            write-host ""
        }
        "x"{
            write-host "Saliendo..."
        }
        default {
            write-host "Opción no reconocida"
            write-host ""
        }
    }
} until ($opcion -eq "x")