@echo off
    setlocal

    set "existFile=C:\Windows\System32\cmd.exe"
    echo Existing File "%existFile%"
    call :IfFileExist "%existFile%" && ( echo EXIST action ) || ( echo NOT EXIST action )
    
    echo.

    set "notExistFile=C:\Atlantida.txt"
    echo Not existing File "%notExistFile%"
    call :IfFileExist "%notExistFile%" && ( echo EXIST action ) || ( echo NOT EXIST action )

    exit  /b 0


:IfFileExist
    REM Checks does the file exists.
    REM %1 - [IN] relative or absolute path to a file
    REM Exit code "1" - NOT exists
    REM Exit code "0" - exists
    if exist "%~1" exit /b 0
    exit /b 1
