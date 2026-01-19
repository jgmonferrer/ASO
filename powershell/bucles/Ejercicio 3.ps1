[int]$num = read-host "Escriba un número positivo"
for($i=$num;$i -ge 0;$i--){
    if ($i -eq 0){
        write-host "$i" -NoNewline
    } else{
        write-host "$i, " -NoNewline
    }
}