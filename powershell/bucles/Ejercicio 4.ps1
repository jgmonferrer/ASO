[int]$num = read-host "Escriba un número positivo"
if ($num -ge 0){
    for ($i=1;$i -le $num;$i++){
        if ($i % 2 -eq 1){
            write-host "$i, " -NoNewline
        }
    }
} else{
    write-host "Debe escribir un número positivo"
}