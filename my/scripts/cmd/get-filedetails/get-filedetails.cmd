@echo off
SET WMICCommand="WMIC Path CIM_DataFile WHERE Name='%ProgramFiles:\=\\%\\7-Zip\\7z.exe' Get Version"
FOR /F "skip=1" %%X IN ('%WMICCommand%') DO (IF %%X==16.4.0.0 echo Correct version)
