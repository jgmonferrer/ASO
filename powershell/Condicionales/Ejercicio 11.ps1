[int]$edad = read-host "Dime tu edad para calcular el precio de la entrada"
switch ($edad){
    {$edad -lt 4}{
        write-host "La entrada esgratuita"
    }
    {$edad -ge 4 -and $edad -lt 18}{
        write-host "Debe pagar 5€"
    }
    {$edad -ge 18}{
        write-host "Debe pagar 10€"
    }
}