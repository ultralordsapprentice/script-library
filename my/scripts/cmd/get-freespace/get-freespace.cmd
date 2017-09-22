@echo off
:: get-freespace.cmd
::
echo Get Free Disk Space
echo version 13.04.21.1 ALPHA
:: (c) 2010-2017 ZOBEC Consulting. All Rights Reserved.
:: web: www.michalzobec.cz
:: Online documentation http://www.michalzobec.cz/doclib/2010/xx/xx/lightning-script-library-online-dokumentace/
::
setlocal enabledelayedexpansion

:: *****************************************
:: * CUSTOMIZE IT
:: *****************************************
:: disk letter
set drive=c:
:: size in MB
set limit=93510
:: *****************************************
:: * !!DO NOT EDIT!!
:: *****************************************

for /f "usebackq" %%i in (`wmic /namespace:\\root\cimv2 path Win32_PerfFormattedData_PerfDisk_LogicalDisk where name^="%drive%" get FreeMegabytes^|findstr /r "[0123456789]"`) do set freebytes=%%i
echo On disk %drive% is %freebytes% MB free space.
if %FreeBytes% LEQ %limit% echo ALERT: Disk has lower space than required.

rem wmic /namespace:\\root\cimv2 path Win32_PerfFormattedData_PerfDisk_LogicalDisk where name="%drive%" get FreeMegabytes
rem wmic logicaldisk where "DeviceID='%drive%'" get FreeSpace