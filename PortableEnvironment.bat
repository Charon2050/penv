@echo off
:: chcp 65001
setlocal

::if not defined PortableEnvironment (
::    set PortableEnvironment=1
::    echo Requesting Administrator Privileges...
::    echo 正在请求管理员权限...
::    PowerShell -Command "Start-Process '%~dpnx0' -Verb RunAs -ArgumentList '%* '"
::    exit /b
::)

set penvVersion=0.1

set data=%cd%\data
set PUBLIC=%data%\Public
set ALLUSERSPROFILE=%data%\ProgramData
set ProgramData=%data%\ProgramData
set ProgramFiles=%data%\Program Files
set CommonProgramFiles=%ProgramFiles%\Common Files
set ProgramW6432=%data%\Program Files
set CommonProgramW6432=%ProgramFiles%\Common Files
set ProgramFiles(x86)=%data%\Program Files (x86)
set CommonProgramFiles(x86)=%ProgramFiles(x86)%\Common Files
set HOMEPATH=%data%
set USERPROFILE=%data%
set APPDATA=%USERPROFILE%\AppData\Roaming
set LOCALAPPDATA=%USERPROFILE%\AppData\Local

mkdir "%PUBLIC%" >nul 2>&1
mkdir "%ProgramData%" >nul 2>&1
mkdir "%ProgramFiles%" >nul 2>&1
mkdir "%CommonProgramFiles%" >nul 2>&1
mkdir "%ProgramFiles(x86)%" >nul 2>&1
mkdir "%CommonProgramFiles(x86)%" >nul 2>&1
mkdir "%APPDATA%" >nul 2>&1
mkdir "%LOCALAPPDATA%" >nul 2>&1

cd %data%
if "%~1"=="/?" (
    goto HelpStart
) ^
else if "%~1"=="/h" (
    goto HelpStart
) ^
else if "%~1"=="/help" (
    goto HelpStart
) ^
else if "%~1"=="-?" (
    goto HelpStart
) ^
else if "%~1"=="-h" (
    goto HelpStart
) ^
else if "%~1"=="-help" (
    goto HelpStart
) ^
else if "%~1"=="--?" (
    goto HelpStart
) ^
else if "%~1"=="--h" (
    goto HelpStart
) ^
else if "%~1"=="--help" (
    goto HelpStart
) ^
else if "%~1"=="" (
    cmd /k %*
) ^
else (
    %*
)

goto HelpEnd
:HelpStart
echo.
echo   penv-%penvVersion%
echo.
echo Usage:
echo   penv              to enter penv
echo   penv ^<commands^>   to temporarily executes a single command in the penv
echo   penv -help        to show this help message
echo.
echo Examples:
echo   penv C:/path/to/msedge.exe
echo   open Microsoft Edge in portable mode
echo.
echo.
:HelpEnd