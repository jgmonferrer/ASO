#Función para crear una ACL en una carpeta en base a una ACL
function nuevaACL {
    param (
        $ruta,
        $newAcl
    )
    #Obtener todas las ACL de la carpeta
    $acl = Get-Acl -Path $ruta
    #Crear una nueva ACE en base a la ACL obtenida del parametro $newAcl
    $newAce = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $newAcl
    #Aplicar la regla de acceso creada a la lista de cambios a realizar en la ACL
    $acl.SetAccessRule($newAce)
    $acl | Set-Acl -Path $ruta
}
#Función para borrar herencias de una carpeta introducida en el primer parámetro
function borrarHerencia {
    param (
        $ruta 
    )
    #Obtener todas las ACL de la carpeta
    $acl = Get-Acl -Path $ruta
    #Deshabilitar herencia y borrar todos los permisos heredados
    $acl.SetAccessRuleProtection($true,$false)
    $acl | Set-Acl -Path $ruta
}
New-Item -name "Empresa" -Path "C:\" -ItemType Directory
#Definir una ACL para el grupo de administradores (control total, extendida a subcarpeta y archivos) y los usuarios del dominio (solo lectura, no se extiende el permiso)
$aclAdministradores = @('Administradores', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$aclDomainUsers = @('Usuarios del dominio', 'ReadAndExecute', 'None, None', 'None', 'Allow')
#Aplicar las ACL creadas en la carpeta "Empresa"
nuevaAcl "C:\Empresa" $aclAdministradores
nuevaACl "C:\Empresa" $aclDomainUsers
#Deshabilitar y borrar permisos heredados
borrarHerencia "C:\Empresa"
$departamentos = Import-Csv departamentos.csv -Delimiter ";"
foreach ($linea in $departamentos){
    #Guardar el nombre del departamento y del grupo del departamento en una variable 
    $departamento = $linea.departamento
    $nombreGrupo = "GG-$departamento"
    #Crear una carpeta con el nombre del departamento dentro de la carpeta Empresa
    New-Item -name $departamento -Path "C:\Empresa" -ItemType Directory
    #Array con la ACL de permisos de lectura y escritura para el grupo del departamento, esta ACL se extiende a subcarpeta y archivos
    $aclGrupo = @($nombreGrupo, 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
    #Añadir la ACL en la carpeta del departamento
    nuevaACL "C:\Empresa\$departamento" $aclGrupo
    #Volver a iterar sobre el fichero de departamentos para aplicar los permisos de solo lectura
        foreach ($nombredep in $departamentos) {
        #Creamos el nombre del grupo en base a la línea del departamento obtenido
        $grupoDep = "GG-$($nombredep.departamento)"
        #Comprobar si el nombre del grupo del departamento que se tiene actualmente en el bucle anidado no es el mismo que el que se tiene en el bucle original.
        #Si es así, añadir una ACL para el grupo de solo lectura en la carpeta en la que se encuentra el bucle de crear las carpetas.
        if ($grupoDep -ne $nombreGrupo){
            $aclOtrosGrupos = @($grupoDep, 'read', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
            nuevaACL "C:\Empresa\$departamento" $aclOtrosGrupos
        }
    }

}
#Crear el recurso compartido con permisos de lectura y escritura para los usuarios del dominio y control total para los administradores
New-SmbShare -Path "C:\Empresa" -name Empresa -ChangeAccess "Usuarios del dominio" -FullAccess "Administradores"