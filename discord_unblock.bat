if "%~1"=="silent" goto silent

>"%temp%\silent.vbs" echo Set WshShell = CreateObject("WScript.Shell")
>>"%temp%\silent.vbs" echo WshShell.Run """%~f0"" silent", 0, False
cscript //nologo "%temp%\silent.vbs"
del "%temp%\silent.vbs"
exit

:silent

winws.exe zapret: http,https,quic ^
--wf-tcp=80,443 --wf-udp=443,50000-50099 ^
--filter-tcp=80,443 --dpi-desync=fake,disorder2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new ^
--filter-udp=50000-50099 --ipset="%~dp0list-discord.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-any-protocol --dpi-desync-cutoff=n4 --new ^
--filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=11