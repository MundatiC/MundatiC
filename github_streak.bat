@echo off

REM Replace 'C:\Users\Caleb\Desktop\Projects\MundatiC\README.md' with the actual full path to your README.md file
REM Check if the README file contains "Hello, guys!"
findstr /C:"Hello, guys!" "C:\Users\Caleb\Desktop\Projects\MundatiC\README.md" >nul

REM If "Hello, guys!" is found, replace it with "Hello, folks!"
if %errorlevel% equ 0 (
    REM Replace 'C:\Users\Caleb\Desktop\Projects\MundatiC\README.md' with the actual full path to your README.md file
    powershell -Command "(gc 'C:\Users\Caleb\Desktop\Projects\MundatiC\README.md') -replace 'Hello, guys!', 'Hello, folks!' | Out-File -encoding UTF8 'C:\Users\Caleb\Desktop\Projects\MundatiC\README_temp.md'"
) else (
    REM If "Hello, guys!" is not found, search for "Hello, folks!" and replace it with "Hello, guys!"
    REM Replace 'C:\Users\Caleb\Desktop\Projects\MundatiC\README.md' with the actual full path to your README.md file
    powershell -Command "(gc 'C:\Users\Caleb\Desktop\Projects\MundatiC\README.md') -replace 'Hello, folks!', 'Hello, guys!' | Out-File -encoding UTF8 'C:\Users\Caleb\Desktop\Projects\MundatiC\README_temp.md'"
)

REM Overwrite the original README file with the modified content
REM Replace 'C:\Users\Caleb\Desktop\Projects\MundatiC\README.md' and 'C:\Users\Caleb\Desktop\Projects\MundatiC\README_temp.md' with the actual full paths to your README.md and README_temp.md files, respectively
move /y "C:\Users\Caleb\Desktop\Projects\MundatiC\README_temp.md" "C:\Users\Caleb\Desktop\Projects\MundatiC\README.md"

REM Add and commit changes
git add "C:\Users\Caleb\Desktop\Projects\MundatiC\README.md"
git commit -m "Update README"

REM Push changes to GitHub
git push origin main
