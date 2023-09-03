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

REM Delete non-system files
echo Deleting non-system files...
adb -s %device_id% shell "find /sdcard/ -type f -not -name '*.apk' -not -name '*.odex' -delete"

pause
exit /b
