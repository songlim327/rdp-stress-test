@REM References:
@REM  https://stackoverflow.com/questions/41179376/getting-length-of-a-variable-in-batch
@REM  https://www.dostips.com/forum/viewtopic.php?p=5537#p5537
@REM  https://ss64.com/nt/syntax-strlen.html

@echo off
setlocal enableDelayedExpansion

if [%1]==[/?] goto :help
if [%1]==[] goto :help
goto :main

:help
echo Usage:
echo    create-win-users.bat ^<total of connections^> ^<username base^>
echo Example:
echo    create-win-users.bat 50 user
goto :end

:main
set count=%1
set user=%2
set password=password

call :strlen "%count%", len
set base=0
if %len% gtr 2 (set base=%base%0)

for /L %%C IN (1,1,%count%) do (
   set z=%base%%%C
   for %%D in (!len!) do set pz=!z:~-%%D!
   net user %user%!pz! %password% /add
   net localgroup "remote desktop users" /add %user%!pz!
)
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