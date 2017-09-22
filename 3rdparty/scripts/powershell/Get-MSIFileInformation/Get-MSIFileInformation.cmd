@echo off

:: Copyright (c) 2000-2017 Michal Zobec, ZOBEC Consulting. All Rights Reserved.
:: Article: http://www.michalzobec.cz/
:: This script require Get-MSIFileInformation.ps1.
::
:: Example 1
:: Get-MSIFileInformation.cmd "D:\packages\7-zip\7z920-x64.msi"
:: will show all package properties and will exit.
::
:: Example 1
:: Get-MSIFileInformation.cmd "D:\packages\7-zip\7z920-x64.msi" pause
:: will show all package properties and waiting for hit of any key.
::

if "%1"=="" echo ERROR: Input parameter missing. Use: Get-MSIFileInformation.cmd MsiPackageFullPath && exit
if not exist "%1" echo ERROR: File path not exist. && exit
echo please wait, working ...
title please wait, working ...
powershell -ExecutionPolicy Bypass -File "%~d0%~p0%~n0.ps1" -Path "%1" -Property Manufacturer
powershell -ExecutionPolicy Bypass -File "%~d0%~p0%~n0.ps1" -Path "%1" -Property ProductName
powershell -ExecutionPolicy Bypass -File "%~d0%~p0%~n0.ps1" -Path "%1" -Property ProductVersion
powershell -ExecutionPolicy Bypass -File "%~d0%~p0%~n0.ps1" -Path "%1" -Property ProductLanguage
powershell -ExecutionPolicy Bypass -File "%~d0%~p0%~n0.ps1" -Path "%1" -Property ProductCode
if "%2"=="pause" pause
exit /B %errorlevel%