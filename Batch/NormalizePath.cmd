@echo off
    setlocal

    call :NormalizePath normalizedPath "C:\Temp\Alpha\..\Beta" || echo ERROR
    echo normalizedPath: "%normalizedPath%"
    
    call :NormalizePath normalizedPath "..\Gamma" || echo ERROR
    echo normalizedPath: "%normalizedPath%"

    call :NormalizePath normalizedPath "C:\\Temp\Delta" || echo ERROR
    echo normalizedPath: "%normalizedPath%"

    call :NormalizePath normalizedPath "C:/Temp/Epsilon" || echo ERROR
    echo normalizedPath: "%normalizedPath%"
    
    call :NormalizePath normalizedPath "C:\." || echo ERROR
    echo normalizedPath: "%normalizedPath%"
    
    call :NormalizePath normalizedPath "C:/" || echo ERROR
    echo normalizedPath: "%normalizedPath%"

    call :NormalizePath normalizedPath "..\..\..\..\..\..\" || echo ERROR
    echo normalizedPath: "%normalizedPath%"
    
    echo Done
    exit /b 0


:NormalizePath
    REM Function returns absolute normalized path.
    REM %1 - [OUT] var name
    REM %2 - [IN] relative or absolute path to a dir
    REM %3 - [option] ensure exist flag
    set "%~1="
    pushd "%~2" >nul 2>&1 || (
        if "%~3" NEQ "" exit /b 1
        mkdir "%~2" || exit /b 1
        pushd "%~2" || exit /b 1
    )
    set "%~1=%CD%"
    popd
    exit /b 0
