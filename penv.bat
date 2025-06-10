@echo off
:: chcp 65001
setlocal enabledelayedexpansion

set penvVersion=0.2
set penvName=default
set penvPath=%~dp0

shift

if "%0"=="?" (
    goto HelpStart
) else if "%0"=="h" (
    goto HelpStart
) else if "%0"=="help" (
    goto HelpStart
) else if "%0"=="/?" (
    goto HelpStart
) else if "%0"=="/h" (
    goto HelpStart
) else if "%0"=="/help" (
    goto HelpStart
) else if "%0"=="-?" (
    goto HelpStart
) else if "%0"=="-h" (
    goto HelpStart
) else if "%0"=="-help" (
    goto HelpStart
) else if "%0"=="--?" (
    goto HelpStart
) else if "%0"=="--h" (
    goto HelpStart
) else if "%0"=="--help" (
    goto HelpStart
) else if "%0"=="/u" (
    goto useStart
) else if "%0"=="/use" (
    goto useStart
) else if "%0"=="-u" (
    goto useStart
) else if "%0"=="-use" (
    goto useStart
) else if "%0"=="--u" (
    goto useStart
) else if "%0"=="--use" (
    goto useStart
)

goto HelpEnd
:HelpStart
shift
echo.
echo   penv-%penvVersion%
echo.
echo Usage:
echo   penv               to enter penv
echo   penv ^<commands^>    to temporarily executes a single command in the penv
echo   penv -u ^<env name^> to use a specific portable environment
echo   penv -h            to show this help message
echo   exit               to exit portable environment
echo.
echo Examples:
echo   penv C:/path/to/msedge.exe
echo     Open Microsoft Edge in portable mode
echo   penv -u alice C:/path/to/firefox.exe
echo     Open Firefox in portable environment named `alice`
echo.
echo More information at github.com/Charon2050/penv
echo.
echo.
goto end
:HelpEnd

goto useEnd
:useStart
if "%~1"=="" (
    echo Usage: penv -u ^<env name^>
    exit
) ^
else (
    set penvName=%~1
    shift
    shift
)
:useEnd

set data=%penvPath%\env\%penvName%
set PUBLIC=%data%\Public
set ALLUSERSPROFILE=%data%\ProgramData
set ProgramData=%data%\ProgramData
set ProgramFiles=%data%\Program Files
set CommonProgramFiles=%ProgramFiles%\Common Files
set ProgramW6432=%data%\Program Files
set CommonProgramW6432=%ProgramFiles%\Common Files
set ProgramFiles(x86)=%data%\Program Files (x86)
set CommonProgramFiles(x86)=%ProgramFiles(x86)%\Common Files
set USERPROFILE=%data%
set APPDATA=%USERPROFILE%\AppData\Roaming
set LOCALAPPDATA=%USERPROFILE%\AppData\Local
for %%A in ("%data%") do set "HOMEDRIVE=%%~dA"
for %%A in ("%data%") do set "HOMEPATH=%%~pA"

mkdir "%PUBLIC%" >nul 2>&1
mkdir "%ProgramData%" >nul 2>&1
mkdir "%ProgramFiles%" >nul 2>&1
mkdir "%CommonProgramFiles%" >nul 2>&1
mkdir "%ProgramFiles(x86)%" >nul 2>&1
mkdir "%CommonProgramFiles(x86)%" >nul 2>&1
mkdir "%APPDATA%" >nul 2>&1
mkdir "%LOCALAPPDATA%" >nul 2>&1

:: read path.txt
cd. >> %penvPath%/path.txt
set "customPath="
for /f "usebackq delims=" %%a in ("%penvPath%/path.txt") do (
    set "line=%%a"
    set "line=!line:%%cd%%=%penvPath%!"
    set "line=!line:/=\!"
    if defined customPath (
        set "customPath=!customPath!;!line!"
    ) else (
        set "customPath=!line!"
    )
)
set "PATH=!customPath!;%PATH%"

:: read path.txt in penv/env/<env name>
set "customPath="
cd. >> %data%/path.txt
for /f "usebackq delims=" %%a in ("%data%/path.txt") do (
    set "line=%%a"
    set "line=!line:%%cd%%=%penvPath%!"
    set "line=!line:/=\!"
    if defined customPath (
        set "customPath=!customPath!;!line!"
    ) else (
        set "customPath=!line!"
    )
)
set "PATH=!customPath!;%PATH%"

cd %data%
prompt [%penvName%] $P$G

set commands=
:commandsLoopStart
if "%0"=="" goto commandsLoopEnd
set commands=!commands! %0
shift
goto commandsLoopStart
:commandsLoopEnd

if "%commands%"=="" (
    cmd /k
) ^
else (
    cmd /c "%commands%"
)

:end
prompt $P$G