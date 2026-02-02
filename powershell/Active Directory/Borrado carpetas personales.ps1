Remove-SmbShare -Name "Empresa_users$" -Force
Remove-Item -Path "C:\Empresa_users" -Recurse -Confirm:$false -Force:$true