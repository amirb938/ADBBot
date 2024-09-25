@echo off

set PACKAGE_NAME=ir.huma.android.launcher

for /f "tokens=2 delims==" %%v in ('adb shell dumpsys package %PACKAGE_NAME% ^| findstr "versionName"') do set VERSION_NAME=%%v

if "%VERSION_NAME%"=="" (
    echo Failed to retrieve the version name of %PACKAGE_NAME%.
) else (
    echo Version Name: %VERSION_NAME%
)

pause