@echo off

REM Get the device ID
setlocal enabledelayedexpansion
for /f "skip=1" %%G in ('adb devices') do (
  set "device_id=%%G"
  goto :break
)
:break
endlocal & set "device_id=%device_id%"

REM Get the package list
for /f "tokens=2 delims=:" %%P in ('adb -s %device_id% shell pm list packages') do (
  call :uninstall_package %%P
)

pause
exit /b

:uninstall_package
echo Uninstalling package: %1
adb -s %device_id% uninstall %1

exit /b