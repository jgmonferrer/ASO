function sumar {
    param (
        [int]$x,
        [int]$y
    )
    $suma = $x + $y
    Write-Host "$x + $y = $suma"
    write-host ""
}
function restar {
    param (
        [int]$x,
        [int]$y
    )
    $resta = $x - $y
    Write-Host "$x - $y = $resta"
    write-host ""
}

function multiplicar {
    param (
        [int]$x,
        [int]$y
    )
    $mult = $x * $y
    Write-Host "$x * $y = $mult"
    write-host ""
}

function dividir {
    param (
        [int]$x,
        [int]$y
    )
    $division = $x / $y
    Write-Host "$x / $y = $division"
    write-host ""
}
do{
    write-host "=====Calculadora====="
    write-host "1. Sumar"
    write-host "2. Restar"
    write-host "3. Multiplicar"
    write-host "4. Dividir"
    write-host "5. Salir"
    [int]$opcion = read-host "¿Que desea hacer? Elige una opción"
    if ($opcion -lt 5 -and $opcion -gt 0){
    [int]$num1 = read-host "Escribe el primer número"
    [int]$num2 = read-host "Escribe el segundo número"
    }
    switch($opcion) {
        1{
            sumar $num1 $num2
        }
        2{
            restar $num1 $num2
        }
        3{
            multiplicar $num1 $num2
        }
        4{
            dividir $num1 $num2
        }
        5{
            "Saliendo..."
        }
        default {
            write-host "Opción no reconocida"
        }
    }
} until ($opcion -eq 5)