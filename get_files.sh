#!/bin/bash

# Editiere die Quell-IP-Adresse hier
source_ip="123.456.78.90"

# Dateien zum Herunterladen definieren
files=(
  "http://example.com/file1.txt"
  "http://example.com/file2.txt"
  "http://example.com/file3.txt"
)

# Schleife durch die Dateien und lade sie herunter
for file in "${files[@]}"; do
  echo "Lade Datei herunter: $file"
  curl --remote-header-name --remote-name --header "X-Forwarded-For: $source_ip" "$file"
done
