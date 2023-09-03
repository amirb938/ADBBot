@echo off

for /f "tokens=*" %%p in ('adb shell pm list packages ^| findstr "huma"') do (
    
	set PACKAGE_NAME=%%p
	echo %PACKAGE_NAME%
	for /f "tokens=2 delims==" %%v in ('adb shell dumpsys package %PACKAGE_NAME% ^| findstr "versionName"') do set VERSION_CODE=%%v

	echo Version Name: %VERSION_NAME%
)

pause
