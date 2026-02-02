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
#Crear una nueva carpeta en C: llamada Empresa_users
New-Item -Name "Empresa_users" -Path "C:\" -ItemType Directory
#Definir nuevas ACL para los administradores (control total, extendido a subcarpetas y archivos) y usuarios del dominio (lectura y ejecución, solo carpeta actual)
$aclAdministradores = @('Administradores', 'FullControl', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$aclUsuariosDominio = @('Usuarios del dominio', 'ReadAndExecute', 'None, None', 'None', 'Allow')
#Aplicar las ACL a la carpeta Empresa_users
nuevaACL "C:\Empresa_users" $aclAdministradores
nuevaACL "C:\Empresa_users" $aclUsuariosDominio
#Eliminar la herencia de la carpeta
borrarHerencia "C:\Empresa_users"
#Importar el fichero empleados.csv para iterar sobre el y crear las carpetas en base al nombre y apellido de cada usuario
$usuarios = Import-Csv empleados.csv -Delimiter ";"
foreach ($linea in $usuarios) {
    $nombreCuenta = ($linea.nombre + '.' + $linea.apellido).ToLower()
    #Crear la carpeta del usuario
    New-Item -name $nombreCuenta -path "C:\Empresa_users" -ItemType Directory
    #Crear la ACL de la carpeta peronsla del usuario (control total, se extiende a subcarpetas y archivos) y aplicarla sobre la carpeta personal del usuario
    $aclPropietarioCarpeta = @($nombreCuenta, 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'allow')
    nuevaAcl "C:\Empresa_users\$nombreCuenta" $aclPropietarioCarpeta
    #Modificar el usuario para añadir el script de inicio de sesión a ejecutar y montar de forma automática la carpeta personal como un recurso compartido
    Set-ADUser -identity $nombreCuenta -ScriptPath "carpetas.bat" -HomeDrive "Z:" `
    -HomeDirectory "\\SRV-EMPRESA\Empresa_users$\$nombreCuenta"
}
#Compartir la carpeta Empresa_users mediante SMB
New-SmbShare -name "Empresa_users$" -Path "C:\Empresa_users" -FullAccess Administradores -ChangeAccess "Usuarios del dominio"