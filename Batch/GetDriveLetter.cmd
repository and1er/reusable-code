@echo off
    setlocal

    echo Good Examples
    set "testPath=Q:\ParentDir\ChildDir"
    call :GetDriveLetter "driveLetter" "%testPath%"
    echo    driveLetter = "%driveLetter%" from "%testPath%"

    set "testPath=Q:\ParentDir\ChildDir\System.ini"
    call :GetDriveLetter "driveLetter" "%testPath%"
    echo    driveLetter = "%driveLetter%" from "%testPath%"

    echo.
    echo Bad Examples
    echo    Missed a letter in the path
    set "testPath=:\ParentDir\ChildDir"
    call :GetDriveLetter "driveLetter" "%testPath%"
    echo    driveLetter = "%driveLetter%" from "%testPath%"

    set "testPath=\ParentDir\ChildDir"
    call :GetDriveLetter "driveLetter" "%testPath%"
    echo    driveLetter = "%driveLetter%" from "%testPath%"

    echo    Relative path, returns current disk
    set "testPath=.\ParentDir\ChildDir"
    call :GetDriveLetter "driveLetter" "%testPath%"
    echo    driveLetter = "%driveLetter%" from "%testPath%"

    set "testPath=ParentDir\ChildDir"
    call :GetDriveLetter "driveLetter" "%testPath%"
    echo    driveLetter = "%driveLetter%" from "%testPath%"
    
    exit /b 0

:GetDriveLetter
    REM Extracts the drive letter from an ABSOLUTE path.
    REM In case of relative path the function probably returns the drive of %CD%
    REM  %1 - [OUT] var name
    REM  %2 - [IN] absolute path
    REM return example: "D:"

    set "%~1=%~d2"
    exit /b 0