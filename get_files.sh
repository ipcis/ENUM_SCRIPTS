#!/bin/bash

# Editiere die Ziel-IP-Adresse hier
target_ip="123.456.78.90"

# Dateien zum Herunterladen definieren
files=(
  "/path/to/file1.txt"
  "/path/to/file2.txt"
  "/path/to/file3.txt"
)

# Basis-URL für den Dateidownload
base_url="http://$target_ip"

# Schleife durch die Dateien und lade sie herunter
for file in "${files[@]}"; do
  url="$base_url$file"
  echo "Lade Datei herunter: $url"
  curl -O "$url"
done
