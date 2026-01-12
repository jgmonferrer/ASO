[int]$renta = read-host "Escribe su renta anual"
switch ($renta) {
    {$renta -lt 10000} {
        $tipo = 5
    }
    {$renta -ge 10000 -and $renta -lt 20000} {
        $tipo = 15
    }
    {$renta -ge 20000 -and $renta -lt 35000} {
        $tipo = 20
    }
    {$renta -ge 35000 -and $renta -lt 60000} {
        $tipo = 30
    }
    {$renta -ge 60000} {
        $tipo = 45
    }
}
$impuesto = $renta * ($tipo / 100)
write-host "El tipo impositivo es de $tipo%, debe pagar $impuesto€ de impuestos"