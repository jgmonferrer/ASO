$passwd = "contraseña"
[int]$comprobacion = 0
do {
    $passwdUser = read-host "Introduce la contraseña"
    if ($passwdUser -ne $passwd) {
        write-host "contraseña incorrecta"
    }
} until ($passwdUser -eq $passwd)
write-host "Ha introducido correctamente la contraseña"