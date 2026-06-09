@echo off
Rem This file prints a welcome message to the user. It displays username, date & time, and OS version to the console.
cls
Rem Capture the output of 'ver' in a variable to display the current OS version.
for /f "delims=" %%i in ('ver') do (
    set "os_version=%%i"
)
echo Welcome, %USERNAME%! It's currently %TIME% on %DATE%. You are currently running %os_version%.