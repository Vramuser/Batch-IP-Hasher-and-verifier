@echo off
REM 
curl -s https://checkip.amazonaws.com/ > %TMP%\ip.txt

REM
set /p ip=<%TMP%\ip.txt
echo %ip% > %TMP%\ip_clean.txt

REM
certutil -hashfile %TMP%\ip_clean.txt SHA256 | findstr /v "hash" > %TMP%\ip_hash.txt

REM 
echo Paste the hash IP (SHA256):
set /p original_hash=

REM 
set /p new_hash=<%TMP%\ip_hash.txt

REM 
if "%new_hash%"=="%original_hash%" (
    echo Matches!
) else (
    echo Doesn't match.
)

REM 
del %TMP%\ip.txt
del %TMP%\ip_clean.txt
del %TMP%\ip_hash.txt

pause
