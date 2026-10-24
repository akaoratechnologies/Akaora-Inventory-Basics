@echo off
setlocal
cd /d "%~dp0"
echo.
echo    Akaora Inventory Basics - Website Edition
 echo    Starting a local website for Firebase Email Login...
echo.
where py >nul 2>&1
if %errorlevel%==0 (
    start "" "http://localhost:8767/"
    py -3 -m http.server 8767 --bind 127.0.0.1
    goto :end
)
where python >nul 2>&1
if %errorlevel%==0 (
    start "" "http://localhost:8767/"
    python -m http.server 8767 --bind 127.0.0.1
    goto :end
)
echo Python not found. Using bundled PowerShell local server...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0START_WEBSITE.ps1"
:end
if errorlevel 1 (
    echo.
    echo Local server did not start. Check whether port 8767 is already in use.
    pause
)
