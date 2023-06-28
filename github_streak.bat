@echo off



REM Check if the README file contains "Hello, guys!"
findstr /C:"Hello, guys!" README.md >nul

REM If "Hello, guys!" is found, replace it with "Hello, folks!"
if %errorlevel% equ 0 (
    powershell -Command "(gc README.md) -replace 'Hello, guys!', 'Hello, folks!' | Out-File -encoding UTF8 README_temp.md"
) else (
    REM If "Hello, guys!" is not found, search for "Hello, folks!" and replace it with "Hello, guys!"
    powershell -Command "(gc README.md) -replace 'Hello, folks!', 'Hello, guys!' | Out-File -encoding UTF8 README_temp.md"
)

REM Overwrite the original README file with the modified content
move /y README_temp.md README.md

REM Add and commit changes
git add README.md
git commit -m "Update README"

REM Push changes to GitHub
git push origin main
