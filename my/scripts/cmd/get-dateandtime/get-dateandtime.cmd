@echo off

set packname=ZOBEC Consulting Script Tools 2014
set prodname=Get Date and Time
set ver=version 170416.1
set comment1=Get Date and Time (command line tool).
set comment2=(c) 2010-2017 ZOBEC Consulting. All Rights Reserved.
set comment3=web: www.michalzobec.cz
:: Online documentation http://www.michalzobec.cz/doclib/2010/xx/xx/lightning-script-library-online-dokumentace/
::
:: vstupni parametry:
:: zadne
::
:: VERSION HISTORY
:: 100102.1 vytvoreni skriptu.
:: 130602.1 oprava problemu pri volani z task scheduleru.
:: 140805.1 small modifications for SolarWinds.
:: 170416.1 small update, public version.
::

if not "%1"=="-call" setlocal enabledelayedexpansion
if "%2"=="-hidelogo" goto checkdateexe

echo.
echo %packname% %prodname%
echo %ver%
echo %comment1%
echo %comment2%
echo %comment3%
echo.

:checkdateexe
:: kontrola date.exe
if not exist %~dp0date.exe goto goto erdate
if not exist %~dp0libiconv2.dll goto erdate
if not exist %~dp0libintl3.dll goto erdate
%~dp0date.exe --version | find "date (GNU coreutils) 5.3.0" >nul && goto getdate
echo %errorlevel%
goto erdate


:getdate
:: zpracovani vsech variant promennych
for /f "tokens=*" %%a in ('%~dp0date.exe +%%Y%%m%%d') do set MyDate=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%H%%M%%S') do set MyTime=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%Y') do set MyYear=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%y') do set MyYearShort=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%m') do set MyMonth=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%d') do set MyDay=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%H') do set MyHour=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%M') do set MyMinute=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%S') do set MySecond=%%a
for /f "tokens=*" %%a in ('%~dp0date.exe +%%u') do set MyDayOfWeek=%%a
if "%1"=="-call" exit /b 0

echo MyDate %MyDate%
echo MyTime %MyTime%
echo logfile-%MyDate%-%MyTime%.txt
echo MyYear %MyYear%
echo MyYearShort %MyYearShort%
echo MyMonth %MyMonth%
echo MyDay %MyDay%
echo MyHour %MyHour%
echo MyMinute %MyMinute%
echo MySecond %MySecond%
echo MyDayOfWeek %MyDayOfWeek%
goto eof

:erdate
echo Chybi cast skriptu, nebo neni funkcni.
exit /b 99

:eof
if not "%1"=="-call" endlocal
