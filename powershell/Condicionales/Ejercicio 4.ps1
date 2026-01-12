[int]$num1 = read-host "Escribe el primer número"
[int]$num2 = read-host "Escribe el segundo número"
write-host "=====Calculadora====="
write-host "1. Sumar"
write-host "2. Restar"
write-host "3. Multiplicar"
write-host "4. Dividir"
[int]$opcion = read-host "¿Que desea hacer? Elige una opción"
switch($opcion) {
    1{
        write-host "$num1 + $num2 = $($num1 + $num2)"
    }
    2{
        write-host "$num1 - $num2 = $($num1 - $num2)"
    }
    3{
        write-host "$num1 * $num2 = $($num1 * $num2)"
    }
    4{
        write-host "$num1 / $num2 = $($num1 / $num2)"
    }
    default {
        write-host "Opción no reconocida"
    }
}