@echo off

REM Set the package name
set "package_name=ir.huma.humaplay"

REM Get the device ID
setlocal enabledelayedexpansion
for /f "skip=1 tokens=1 delims= " %%G in ('adb devices') do (
  set "device_id=%%G"
  goto :break
)
:break
endlocal & set "device_id=%device_id%"

REM Uninstall the package
echo Uninstalling package: %package_name% from device: %device_id%
adb shell pm uninstall -k --user 0 %package_name%

pause
exit /b
