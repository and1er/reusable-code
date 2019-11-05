@echo off
    setlocal

    call :IfWindowsXP && ( echo Windows XP action ) || ( echo Other Windows version action )

    exit /b 0

:IfWindowsXP
    REM Checks does the current OS is Windows XP or not
    
    REM Exit code "0" - Windows XP
    REM Exit code "1" - other windows version

    ver | findstr /i "5\.1\." > nul
    if %ERRORLEVEL% EQU 0 exit /b 0
    exit /b 1
