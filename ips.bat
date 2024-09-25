@echo off
setlocal enabledelayedexpansion

set "base_ip=192.168.241."

for /L %%i in (1,1,255) do (
    set "ip=!base_ip!%%i"
    ping -n 1 !ip! | find "Reply" > nul
    if !errorlevel! equ 0 (
        echo Host !ip! is reachable.
    ) else (
        echo Host !ip! is not reachable.
    )
)

endlocal
