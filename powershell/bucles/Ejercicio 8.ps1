[int]$num = read-host "escriba un número"
for($i=1;$i -le $num;$i++){
    for($x=(2*$i);$x -ge 1;$x--){
        if($x % 2 -eq 1){
            write-host "$x " -NoNewline
        }
    }
    write-host ""
}