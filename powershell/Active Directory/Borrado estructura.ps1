$dc = "dc=empresa,dc=local"
Set-ADOrganizationalUnit -Identity "ou=EMPRESA,$dc" -ProtectedFromAccidentalDeletion:$false
Remove-ADOrganizationalUnit -Identity "ou=EMPRESA,$dc" -Recursive -Confirm:$false