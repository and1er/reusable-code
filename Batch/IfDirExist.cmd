@echo off
    setlocal

    set "existDir=C:\Program Files"
    echo Existing dir "%existDir%"
    call :IfDirExist "%existDir%" && ( echo EXIST action ) || ( echo NOT EXIST action )
    
    echo.

    set "notExistDir=Q:\ParentDir\ChildDir"
    echo Not existing dir "%notExistDir%"
    call :IfDirExist "%notExistDir%" && ( echo EXIST action ) || ( echo NOT EXIST action )

    exit  /b 0


:IfDirExist
    REM Checks does the dir exists.
    REM %1 - [IN] relative or absolute dir
    REM Exit code "1" - NOT exists
    REM Exit code "0" - exists

    pushd "%~1" >nul 2>&1 || exit /b 1
    popd
    exit /b 0
