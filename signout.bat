@REM Place this in the remote host
@REM run qwinsta to get the range of user session ID you wish to logoff

@echo off

set start=%1
set end=%2

for /L %%A in (%start%,1,%end%) do (
    rwinsta %%A
)