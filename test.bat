@REM Requires:
@REM  wfreerdp.exe

@echo off
setlocal enableDelayedExpansion

if [%1]==[/?] goto :help
if [%1]==[] goto :help
goto :main

:help
echo Usage:
echo    test.bat ^<hostname^> ^<total of connections^> ^<base username^> ^<password^>
echo Example:
echo    test.bat a-rdp 10 user password
goto :end

:main
set host=%1
set count=%2
set user=%3
set password=%4
set port=3389

powershell -command "& { $x = New-Object -ComObject Shell.Application; $x.minimizeall() }"
call :strlen "%count%", len
set base=0
if %len% gtr 2 (set base=%base%0)
for /L %%C IN (1,1,%count%) do (
    set z=%base%%%C
    for %%D in (!len!) do set pz=!z:~-%%D!
    start wfreerdp.exe -grab-keyboard /v:%host%:%port% /u:%user%!pz! /p:%password% /t:%user%!pz! /size:480x270
    echo %user%!pz!
    timeout 8
)
timeout 15
@REM cscript show-side-by-side.vbs
echo %host%
goto :end

:strlen string len
:: string   The string to be measured.
:: len      The variable to be used to return the string length.
:: can only count up to 8 characters. If need more, adjust the loop and increase it count. (default: 3 [2^3])
set token=#%~1
set len=0
for /L %%A in (3,-1,0) do (
   set /A "len|=1<<%%A"
   for %%B in (!len!) do if "!token:~%%B,1!"=="" set /A "len&=~1<<%%A"
)
set %~2=%len%
goto :end

:end