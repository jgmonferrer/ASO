$pass = "contraseña"
$pass_user = read-host "Escribe la contraseña"
if ($pass_user -ieq $pass) {
    write-host "Contraseña correcta"
} else {
    write-host "Contraseña incorrecta"
}
    