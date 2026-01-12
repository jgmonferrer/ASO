[double]$puntuacion = read-host "Escribe la puntuación del usuario"
$dinero = 2400
switch ($puntuacion) {
    0.0 {
        $nivel = "inaceptable"
        $bonus = $dinero * 0.0
        write-host "El usuario tiene un nivel de rendimiento $nivel, y recibirá $bonus€ de bonus"
    }
    0.4 {
        $nivel = "aceptable"
        $bonus = $dinero * 0.4
        write-host "El usuario tiene un nivel de rendimiento $nivel, y recibirá $bonus€ de bonus"
    }
    {$puntuacion -ge 0.6} {
        $nivel = "meritorio"
        $bonus = $dinero * $puntuacion
        write-host "El usuario tiene un nivel de rendimiento $nivel, y recibirá $bonus€ de bonus"
    }
    default {
        write-host "No se admiten valores intermedios o ha especificado un numero negativo"
        
    }
}


