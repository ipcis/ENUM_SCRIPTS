@echo off

echo Search flags:

set "userdir=%USERPROFILE%"
set "searchfiles=local.txt proof.txt"

cd "%userdir%"

for %%F in (%searchfiles%) do (
    if exist "%%F" (
        echo Die Datei "%%F" wurde im Benutzerverzeichnis gefunden.
    ) else (
        echo Die Datei "%%F" wurde NICHT im Benutzerverzeichnis gefunden.
    )
)

echo.

echo Operating System Information:
systeminfo

echo.

echo Installed Programs:
wmic product get name, version

echo.

echo Network Information:
ipconfig /all

echo.

echo Running Processes:
tasklist

echo.

echo Opened Ports:
netstat -ano

echo.

echo Scheduled Tasks:
schtasks /query /fo list

echo.

echo Registry Information:
reg query HKLM\Software

echo.

echo User Information:
net user

pause
