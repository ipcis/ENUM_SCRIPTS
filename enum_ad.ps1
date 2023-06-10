# Active Directory-Enumerationstestskript
# powershell -ExecutionPolicy Bypass -File enum_ad.ps1

# Importieren des ActiveDirectory-Moduls
Import-Module ActiveDirectory

# Verbinden mit dem Active Directory
$domain = "dein_domain_name"
$cred = Get-Credential
$rootDSE = Get-ADRootDSE -Server $domain -Credential $cred

# Abfrage aller Benutzerkonten
$users = Get-ADUser -Filter * -Server $domain -Credential $cred

Write-Host "Gefundene Benutzerkonten:"
foreach ($user in $users) {
    Write-Host $user.Name
}

# Abfrage aller Gruppenkonten
$groups = Get-ADGroup -Filter * -Server $domain -Credential $cred

Write-Host "Gefundene Gruppenkonten:"
foreach ($group in $groups) {
    Write-Host $group.Name
}

# Abfrage aller Computerkonten
$computers = Get-ADComputer -Filter * -Server $domain -Credential $cred

Write-Host "Gefundene Computerkonten:"
foreach ($computer in $computers) {
    Write-Host $computer.Name
}

# Abfrage aller Organizational Units (OU)
$ous = Get-ADOrganizationalUnit -Filter * -Server $domain -Credential $cred

Write-Host "Gefundene Organizational Units:"
foreach ($ou in $ous) {
    Write-Host $ou.Name
}

# Abfrage aller Domain Controllers
$domainControllers = Get-ADDomainController -Filter * -Server $domain -Credential $cred

Write-Host "Gefundene Domain Controller:"
foreach ($dc in $domainControllers) {
    Write-Host $dc.Name
}

# Abfrage aller vertrauenswürdigen Domänen
$trusts = Get-ADTrust -Filter * -Server $domain -Credential $cred

Write-Host "Gefundene vertrauenswürdige Domänen:"
foreach ($trust in $trusts) {
    Write-Host $trust.Name
}
