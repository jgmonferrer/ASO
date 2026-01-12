[int]$num = read-host "escribe un número"
if ($num % 2 -eq 0) {
    write-host "Numero par"
} else {
    write-host "Numero impar"
}