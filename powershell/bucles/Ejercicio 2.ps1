[int]$edad = read-host "Escribe tu edad"
for ($i=1;$i -le $edad;$i++){
    write-host "Has cumplido $i años"
}