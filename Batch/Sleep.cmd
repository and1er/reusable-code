@echo off
    setlocal

    echo Wait for 3 seconds
    call :Sleep 3
    
    echo Done
    exit /b 0

:Sleep
    REM Pauses execution for %1 seconds and returns 0
    setlocal & set /a n=%1+1
    ping -n %n% 127.0.0.1 >nul
    endlocal & exit /b 0
