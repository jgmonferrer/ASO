[int]$num1 = read-host "Escribe el primer número"
[int]$num2 = read-host "Escribe el segundo número"
if ($num1 -gt $num2) {
    write-host "El primer número es mayor"
} elseif ($num1 -eq $num2) {
    write-host "Los 2 números son iguales"
} else {
    write-host "El segundo número es mayor"
}