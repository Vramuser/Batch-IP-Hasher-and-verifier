@echo off
REM 
curl -s https://checkip.amazonaws.com/ > %TMP%\ip.txt

REM 
set /p ip=<%TMP%\ip.txt
echo %ip% > %TMP%\ip_clean.txt

REM
certutil -hashfile %TMP%\ip_clean.txt SHA256 | findstr /v "hash" > %TMP%\ip_hash.txt

REM 
type %TMP%\ip_hash.txt | clip

REM 
del %TMP%\ip.txt
del %TMP%\ip_clean.txt

REM 
echo IP grabbed (SHA256) and been sent to clipboard.
pause
