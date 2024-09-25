@echo off
setlocal enabledelayedexpansion

REM Function to connect to IP using adb
:adb_connect
    set "ip=%1"
    echo Connecting to %ip%...
    adb connect %ip% > temp_output.txt 2>&1

    REM Read the output and display it
    for /f "delims=" %%A in (temp_output.txt) do (
        echo %%A
    )

    del temp_output.txt
    goto :eof

REM Function to connect to a range of IPs
:connect_to_ip_range
    set "ip_prefix=%1"
    for /L %%i in (1,1,255) do (
        call :adb_connect %ip_prefix%.%%i
    )
    goto :eof

REM Main
echo Connecting to IP range 192.168.241.1 to 192.168.241.255...
call :connect_to_ip_range 192.168.241

echo Connecting to IP range 192.168.100.1 to 192.168.100.255...
call :connect_to_ip_range 192.168.100

echo Done.
pause
