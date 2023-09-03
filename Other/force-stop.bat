@echo off
setlocal enabledelayedexpansion

adb devices
adb shell "pm list packages" | %SystemRoot%\System32\findstr.exe /R /C:"package:" > packages.txt

for /f "tokens=2 delims=:" %%a in (packages.txt) do (
    set package=%%a
	echo !package!
    adb shell am force-stop !package!
)

del packages.txt

echo All applications have been force-stopped.

pause
