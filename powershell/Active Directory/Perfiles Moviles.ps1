#Grupo el cual se obtendrá los usuarios para añadir la ruta de perfil móvil. En este caso, será el grupo global del departamento de personal
$grupo = "GG-PERSONAL"
#Obtener los datos sobre los usuarios pertenecientes al grupo de la variable $grupo
$usuariosGrupo = Get-ADGroupMember -Identity $grupo
#Iterar sobre los usuarios obtenidos mediante Get-ADGroupMember
foreach ($usuario in $usuariosGrupo){
    #El comando Get-ADGroupMember ofrece varios campos respecto a los datos de los usuarios.
    #Los campos son: disinguishedName, name, objectClass, objectGUID, SamAccountName y SID.
    #Si itera sobre Get-ADGroupMember, a comparación con la importación de un csv, powershell no mostrará el array completo, sino que solo mostrará el campo distinguishedName.
    #No obstante, podemos acceder al resto de campos si es necesario.
    $userSamAccountName = $usuario.SamAccountName
    #Configurar el perfil móvil del usuario para que se encuentre dentro de la carpeta personal del recurso compartido "Empresa_users$"
    Set-ADUser -Identity $userSamAccountName -ProfilePath "\\SRV-EMPRESA\Empresa_users$\$userSamAccountName\"
}