@echo off

echo %path% | findstr %cd%; >nul && (
    echo You have already installed penv! For help info, use `penv -help`
    pause
) || (
    echo installing penv ...
    powershell -Command "[Environment]::SetEnvironmentVariable('Path', \"$PWD;\" + [Environment]::GetEnvironmentVariable('Path','User'), 'User')"
    echo penv install completed! For help info, use `penv -help`
    pause
)

