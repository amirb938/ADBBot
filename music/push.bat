@echo off


REM Make sure the target directory exists on the device
adb shell "mkdir -p /sdcard/"

REM Push each MP3 file individually with logging
echo "Pushing MP3 files to /sdcard/..."
for %%F in (*.mp3) do (
    echo "Pushing %%F..."
    adb push "%%F" /sdcard/bot/%%F.mp3 >> push_log.txt 2>&1
    IF %ERRORLEVEL% NEQ 0 (
        echo "Failed to push %%F" >> push_log.txt
    ) ELSE (
        echo "Successfully pushed %%F" >> push_log.txt
    )
)

echo "Push operation complete. Check push_log.txt for details."
pause
