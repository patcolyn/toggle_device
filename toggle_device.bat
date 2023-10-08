@echo off
set HARDWARE_ID="HID\VEN_WCOM&DEV_4841&Col01"

rem :: Get device status
devcon status %HARDWARE_ID% > STATUS.txt
for /f "delims=" %%i in ('findstr "running disabled" STATUS.txt') do (set STATUS=%%i)
del STATUS.txt
set STATUS=%STATUS:~14,7%

rem :: Toggle device
if %STATUS%==running (
    devcon disable %HARDWARE_ID%
    msg %USERNAME% Device disabled
)
if %STATUS%==disable (
    devcon enable %HARDWARE_ID%
    msg %USERNAME% Device enabled
)