$vegetarianos = @("pimiento", "tofu")
$noVegetarianos = @("Peperoni", "jamón", "Salmón")
$pizza = @("tomate", "mozzarella")
$tipoPizza = read-host "¿Quiere una pizza vegetariana? (S/N)"

switch ($tipoPizza){
    {$tipoPizza -ieq "S"}{
        write-host "Lista de ingredientes disponibles: $vegetarianos"
        $ingrediente = read-host "¿Que ingrediente quiere añadir?"
        if ($ingrediente -iin $vegetarianos) {
            $pizza += "$ingrediente"
            write-host "Ha creado una pizza vegetariana con los siguientes ingredientes:"
            write-host $pizza
        } else {
            write-host "No tenemos ese ingrediente"
        }
    }
    {$tipoPizza -ieq "N"}{
        write-host "Lista de ingredientes disponibles: $noVegetarianos"
        $ingrediente = read-host "¿Que ingrediente quiere añadir?"
        if ($ingrediente -iin $noVegetarianos) {
            $pizza += "$ingrediente"
            write-host "Ha creado una pizza no vegetariana con los siguientes ingredientes:"
            write-host $pizza
        } else {
            write-host "No tenemos ese ingrediente"
        }
    }
    default {
        write-host "Opción no válida"
    }
}