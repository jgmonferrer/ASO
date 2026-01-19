$usuarios = Import-Csv usuarios.csv -Delimiter ","
foreach ($usuario in $usuarios){
    write-host "Nombre usuario: $($usuario.nombre), apellidos: $($usuario.apellidos), grupo: $($usuario.grupo)"
}