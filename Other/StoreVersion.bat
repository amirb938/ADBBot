@echo off

set PACKAGE_NAME=ir.huma.humastore

for /f "tokens=2 delims==" %%v in ('adb shell dumpsys package %PACKAGE_NAME% ^| findstr "versionName"') do set VERSION_NAME=%%v

echo Version Name: %VERSION_NAME%
pause
