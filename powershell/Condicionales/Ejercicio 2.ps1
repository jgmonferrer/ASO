[int]$edad = read-host "escribe tu edad"
if ($edad -ge 18) {
    write-host "Mayor de edad"
} else {
    write-host "Menor de edad"
}