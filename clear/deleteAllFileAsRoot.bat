@echo off

adb root

REM Wait for the device to be ready
adb wait-for-device

REM Remove all files except init.rc
adb shell "find / -type f ! -name 'init.rc' -delete"

echo All files, except init.rc, have been cleared from the Android device.
