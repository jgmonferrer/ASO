Remove-SmbShare -Name Empresa -Force
Remove-Item -Path "C:\Empresa" -Confirm:$false -Force:$true -Recurse
