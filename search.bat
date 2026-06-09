@echo off
Rem This file allows a user to search for files in a specific directory by using keywords and file extensions.
cls
echo Please enter a valid file path to search. Example: C:\Users\%USERNAME%\Documents
set /p search_dir=
Rem Check if file path is valid.
if exist "%search_dir%" (
    echo %search_dir% is a valid path. Please enter a keyword to search.
) else (
    echo %search_dir% is not a valid path. Try again.
    exit /b
)
set /p keyword=
echo Searching %search_dir% for files containing "%keyword%" in their title...
Rem Recursive search using directory and keyword.
dir "%search_dir%" /a-d /b /s | find /i "%keyword%"
echo No more results.