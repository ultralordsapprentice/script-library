whoami /all > "%~d0%~p0%~n0.log"
powershell -ExecutionPolicy Bypass -File "%~d0%~p0%~n0.ps1" > "%~d0%~p0%~n0.log"
exit /B %errorlevel%