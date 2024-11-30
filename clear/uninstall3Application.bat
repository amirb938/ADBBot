@echo off

echo Getting list of connected devices...
for /f "tokens=1" %%i in ('adb devices ^| findstr /r "^[0-9]"') do (
    echo Uninstalling ir.huma.voiceassistant on device %%i
    adb -s %%i uninstall ir.huma.voiceassistant
    if %errorlevel% neq 0 echo Failed to uninstall ir.huma.voiceassistant on device %%i

    echo Uninstalling ir.huma.humaplay on device %%i
    adb -s %%i uninstall ir.huma.humaplay
    if %errorlevel% neq 0 echo Failed to uninstall ir.huma.humaplay on device %%i

    echo Uninstalling ir.huma.android.launcher on device %%i
    adb -s %%i uninstall ir.huma.android.launcher
    if %errorlevel% neq 0 echo Failed to uninstall ir.huma.android.launcher on device %%i
)

echo Uninstallation process completed.
pause
