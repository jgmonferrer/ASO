$numero = 40
$comprobacion = 0
while ($comprobacion -ne 1){
    [int]$respuesta = read-host "Escriba un número entre 0 y 100"
    if ($respuesta -lt 0 -or $respuesta -gt 100){
        write-host "Ha escrito un número fuera del rango"
    } elseif ($respuesta -gt $numero){
        write-host "El número a adivinar es menor al que ha esrito"
    } elseif ($respuesta -lt $numero){
        Write-Host "El número a adivinar es mayor al que ha esrito"
    } else {
        write-host "¡Ha ganado el juego!"
        $comprobacion++
    }
}
