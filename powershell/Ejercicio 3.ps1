[int]$horas = read-host "Escribe la cantidad de horas trabajadas"
[double]$precio_hora = read-host "Escribe el precio por hora de trabajo"
$salario = $horas * $precio_hora
write-host "El salario a pagar es de $salario€"