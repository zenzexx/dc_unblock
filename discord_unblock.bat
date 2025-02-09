@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

if "%~1"=="silent" goto silent

>"%temp%\silent.vbs" echo Set WshShell = CreateObject("WScript.Shell")
>>"%temp%\silent.vbs" echo WshShell.Run """%~f0"" silent", 0, False
cscript //nologo "%temp%\silent.vbs"
del "%temp%\silent.vbs"
exit

:silent

"%~dp0winws.exe" zapret: http,https,quic ^
--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-tcp=443 --dpi-desync=fake,multidisorder --dpi-desync-split-pos=midsld --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,md5sig --new ^
--filter-udp=50000-50099 --ipset="%~dp0ipset-discord.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-any-protocol --dpi-desync-cutoff=n4