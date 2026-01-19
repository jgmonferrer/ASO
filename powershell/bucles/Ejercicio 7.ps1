[int]$num = read-host "escriba un número para crear un triangulo de dicha altura"
for($i=1;$i -le $num;$i++){
    for($x=1;$x -le $i;$x++){
        write-host "*" -NoNewline
    }
    write-host ""
}