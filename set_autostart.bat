@echo off

set "target=%~dp0discord_unblock.bat"  :: Replace MyFile.exe with the actual file name

set "shortcut=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\discord_unblock.lnk"

powershell -Command ^
"$shell=New-Object -COM WScript.Shell; ^
$shortcut=$shell.CreateShortcut('%shortcut%'); ^
$shortcut.TargetPath='%target%'; ^
$shortcut.WorkingDirectory='%~dp0'; ^
$shortcut.Save();"

start discord_unblock.bat
echo Autostart set, unblock running
timeout /t 2