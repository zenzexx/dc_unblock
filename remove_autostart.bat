@echo off

taskkill /f /im "winws.exe" 2>nul

timeout /t 1 >nul

del /f /q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\discord_unblock.lnk"

echo Autostart stopped.
timeout /t 2
