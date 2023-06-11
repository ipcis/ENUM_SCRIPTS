@echo off

:: Editiere die Ziel-IP-Adresse hier
set target_ip=123.456.78.90

:: Dateien zum Herunterladen definieren
set files=(
  "/path/to/file1.txt"
  "/path/to/file2.txt"
  "/path/to/file3.txt"
)

:: Basis-URL für den Dateidownload
set base_url=http://%target_ip%

:: Schleife durch die Dateien und lade sie herunter
for %%i in %files% do (
  set url=%base_url%%%i
  echo Lade Datei herunter: %url%
  curl -O %url%
)
