[int]$num = read-host "Escriba un número para conocer su tabla de multiplicar"
for($i=0;$i -le 10;$i++){
    $mult = $i * $num
    write-host "$num * $i = $mult"
}