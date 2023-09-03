@echo off

REM Connect to the Android device
adb connect 192.168.100.37

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
echo Checking package: %1

REM Exclude specific package names from data clearance
if "%1"=="ir.huma.humastore" (
  echo Skipping package: %1
) else if "%1"=="ir.huma.humaplay" (
  echo Skipping package: %1
) else if "%1"=="ir.huma.android.launcher" (
  echo Skipping package: %1
) else (
  echo Clearing data for package: %1
  adb -s %device_id% shell pm clear %1
)

exit /b
