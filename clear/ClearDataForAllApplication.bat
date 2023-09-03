@echo off

REM Connect to the Android device
adb connect 192.168.241.27

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
  call :clear_data %%P
)

pause
exit /b

:clear_data
echo Clearing data for package: %1
adb -s %device_id% shell pm clear %1
exit /b
