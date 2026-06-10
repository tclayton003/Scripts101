@echo off
Rem This file allows a user to search for files in a specific directory by using keywords and file extensions.
cls
echo Please enter a valid file path to search. Example: C:\Users\%USERNAME%\Documents
set /p search_dir=
Rem Check if file path is valid.
if exist "%search_dir%" (
    echo %search_dir% is a valid path. Please enter a keyword to search. Example: notes
) else (
    echo %search_dir% is not a valid path. Try again.
    exit /b
)
Rem Ensure keyword and file_type are clear by setting them explicitly. This prevents bugs if they are left blank.
set "keyword="
set /p keyword=
Rem Check for no keyword.
if "%keyword%" == "" (
    echo A keyword is required to search. Try again.
    exit /b
)
echo Please enter a file extension to search. Leave blank to search all file types. Example: .pdf
set "file_type="
set /p file_type=
if "%file_type%" == "" (
    echo Searching %search_dir% for files containing "%keyword%" in their title path...
    Rem Recursive search using directory and keyword.
    dir "%search_dir%" /a-d /s /b | find /i "%keyword%"
) else (
    echo Searching %search_dir% for %file_type% files containing "%keyword%" in their title path...
    Rem Recursive search using directory, keyword, and file type.
    dir "%search_dir%" /a-d /s /b | find /i "%keyword%" | find /i "%file_type%"
)
echo No more results.