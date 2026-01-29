#Definir el dominio al cual se realizará la creación de objetos. Cambie el dn del dominio de la variable '$dc' en base a su dominio.
$dc = "dc=empresa,dc=local"
#Importar el fichero departamentos.csv, debe estar en el mismo directorio que el archivo a la hora de ejecutar el script.
#Ojo, especificar la ruta de ejecución en el script no vale para que el fichero a importar sea el que se encuentra dentro de la ruta del script, debes estar en el mismo directorio que el fichero departamentos.csv, sino no lo importará.
$departamentos = Import-Csv departamentos.csv -Delimiter ';'
#Crear la UO "EMPRESA" donde se añadirán todos los objetos del script
New-ADOrganizationalUnit -Name "EMPRESA" -Path $dc -Description "UO de la Empresa"
#Recorrer el fichero csv y crear una UO dentro de empresa por cada línea del csv y un grupo global por departamento
foreach ($linea in $departamentos){
  New-ADOrganizationalUnit -name $linea.departamento -Path "ou=EMPRESA,$dc" -Description $linea.descripcion
  #Definir variables para facilitar la creación del grupo
  $departamento = $linea.departamento
  $nombreGrupo = "GG-$departamento"
  #Crear el grupo global del departamento
  New-ADGroup -Name $nombreGrupo -GroupCategory Security -GroupScope Global -Path "ou=$departamento,ou=EMPRESA,$dc"
}
#Importar el fichero empleados.csv (tener en cuenta las mismas precauciones que departamentos.csv)
$usuarios = Import-Csv empleados.csv -Delimiter ';'
#Recorrer el CSV empleados
foreach ($linea in $usuarios){
    #Se ha defido variables con los valores necesarios para crear cada usuario para evitar crear un comando muy largo.
    #Establecer el nombre que verá el usuario al iniciar sesión
    $nombreVisual = $linea.nombre + ' ' + $linea.apellido
    #Establecer el DN donde se creará el objeto de AD. La variable OU servirá para almacenar el nombre del departamento, ya que si se escribe directamente la variable $linea.departamento
    #dentro de $dn, que es una string creada con comillas da errores inesperados (se muestra la variable $linea, que es un diccionario y luego escribe '.departamento').
    $ou = $linea.departamento
    $dn = "ou=$ou,ou=EMPRESA,$dc" #Opcionalmente se podría escribir todo en una variable de la siguiente forma: $dn = "ou=$($linea.departamento),ou=EMPRESA,$dc"
    #Establecer el usuario de inicio de sesión, se aprovechará también esta variable para definir el parámetro -UserPrincipalName
    $SamAccountName = ($linea.nombre+'.'+$linea.apellido).ToLower()
    #Contraseña por defecto para todos los usuarios
    $password = ConvertTo-SecureString "aso2025." -AsPlainText -Force
    #Establecer el nombre del usuario
    $givenName = $linea.nombre
    #Establecer el apellido del usuario
    $Surname = $linea.apellido
    #Definir el nombre del grupo del departamento
    $departamento = $linea.departamento
    $nombreGrupo = "GG-$departamento"
    #Crear el usuario con las variables definidas, se configuran los usuarios para que deban cambiar su contraseña al iniciar sesión por primera vez y que estén habilitados.
    New-ADUser -name $nombreVisual -Path $dn -SamAccountName $SamAccountName -UserPrincipalName "$SamAccountName@empresa.local" `
        -accountpassword $password -GivenName $givenName -Surname $Surname -ChangePasswordAtLogon:$true -enabled:$true
    #Añadir el usuario al grupo del departamento
    Add-ADGroupMember -Identity $nombreGrupo -Members $SamAccountName

}

