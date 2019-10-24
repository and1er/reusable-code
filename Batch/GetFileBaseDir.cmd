@echo off
REM https://stackoverflow.com/a/54346165/7444782
setlocal enabledelayedexpansion
 
REM Initial file path

for %%F in (
C:\SecondParent\FirstParent\testfile.ini
testfile.ini
.\testfile.ini
..\testfile.ini
..\..\testfile.ini
) do (
    echo Current Workdir:           "%CD%"
    echo pathTestFile:              "%%~F"

    REM First level parent (base dir)
    REM with ending backslash
    call :GetFileBaseDir dirFileBase "%%~F"
    echo dirFileBase:               "!dirFileBase!"

    REM Same but without ending backslash
    call :GetFileBaseDirWithoutEndSlash dirFileBaseWithBackSlash "%%F"
    echo dirFileBaseWithBackSlash:  "!dirFileBaseWithBackSlash!"

    echo.

    REM Using subroutine
    set "dirFileParent="
    call :GetDirParentN dirFileParent "%%F"
    echo Current level:            "!dirFileParent!"

    set "dirFileParent="
    call :GetDirParentN dirFileParent "%%F" ".."
    echo One level up:             "!dirFileParent!"

    set "dirFileParent="
    call :GetDirParentN dirFileParent "%%F" "..\.."
    echo Two levels up:            "!dirFileParent!"

    set "dirFileParent="
    call :GetDirParentN dirFileParent "%%F" "..\..\.."
    echo Three levels up:          "!dirFileParent!"

    echo.
    echo ====================================================
    echo.
    )


exit /b 0


:GetFileBaseDir
    REM Subroutine calculates the base dir for a file path (absolute or relative)
    REM     ending with a backslash "\"
    REM %1 - [OUT] var name
    REM %2 - [IN] relative or absolute path to a file
    set "%~1=%~dp2"
    exit /b 0


:GetFileBaseDirWithoutEndSlash
    REM Subroutine calculates the base dir for a file path (absolute or relative)
    REM     WITHOUT the ending backslash "\"
    REM %1 - [OUT] var name
    REM %2 - [IN] relative or absolute path to a file
    set "dirWithBackSlash=%~dp2"
    REM substring from the start to the end minus 1 char from the end
    set "%~1=%dirWithBackSlash:~0,-1%"
    exit /b 0


:GetDirParentN
    REM Subroutine calculates the base dir for a file path (absolute or relative)
    REM     and could go up N times
    REM %1 - [OUT] var name
    REM %2 - [IN] relative or absolute path to a file
    REM %3 - [IN] relative "dir up" path, e.g. 
    REM      ".."
    REM      "..\.."
    REM      "..\..\.."
    REM     %3 should be used carefully

    for %%I in ("%~2\%~3") do set "%~1=%%~fI"
    exit /b 0
