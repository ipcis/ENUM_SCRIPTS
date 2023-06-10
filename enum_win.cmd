@echo off

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
