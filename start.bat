
@echo off
setlocal EnableExtensions
title MYSTERIOUS - PREMIUM SETUP
cd /d "%~dp0"

if /i "%~1"=="--continue" goto INSTALL

:WELCOME
cls
echo.
echo ======================================================
echo.
echo              M Y S T E R I O U S
echo                  SETUP WIZARD
echo.
echo ======================================================
echo.
echo  WELCOME!
echo.
echo  Before continuing, you need two required files.
echo.
echo  [1] SEB.exe
echo  [2] patch.exe
echo.
echo ======================================================
echo                  DOWNLOAD GUIDE
echo ======================================================
echo.
echo  STEP 1: Open the GitHub repository.
echo.
echo.
echo  GITHUB REPOSITORY:
echo.
echo  https://github.com/mysterious00015/SEB-UNLOCKER
echo.
echo  HOW TO OPEN:
echo.
echo  Hold CTRL and LEFT CLICK the GitHub link.
echo.

echo  STEP 2: Open README.md.
echo.
echo  STEP 3: Click the download links for:
echo          - SEB.exe
echo          - patch.exe
echo.
echo  STEP 4: Copy both downloaded files into:
echo.
echo  %~dp0
echo.
echo ======================================================
echo.
echo  After copying both files, return here.
echo.
choice /C YN /N /M "Have you finished copying both files? [Y/N]: "

if errorlevel 2 goto EXIT
if errorlevel 1 goto VERIFY

:VERIFY
cls
echo.
echo ======================================================
echo                 FILE VERIFICATION
echo ======================================================
echo.

if not exist "SEB.exe" (
    echo [MISSING] SEB.exe
    echo.
    echo Please download and copy SEB.exe.
    pause
    goto WELCOME
)

echo [FOUND] SEB.exe

if not exist "patch.exe" (
    echo [MISSING] patch.exe
    echo.
    echo Please download and copy patch.exe.
    pause
    goto WELCOME
)

echo [FOUND] patch.exe

echo.
echo ======================================================
echo             ALL FILES FOUND SUCCESSFULLY
echo ======================================================
echo.
echo Restarting setup...
timeout /t 3 /nobreak >nul

start "" "%~f0" --continue
exit /b

:INSTALL
cls
echo.
echo ======================================================
echo                 MYSTERIOUS SETUP
echo ======================================================
echo.
echo Both files are available.
echo.
echo Ready for the next installation step.
echo.
echo ======================================================
echo.
pause
exit /b

:EXIT
echo.
echo Setup cancelled.
timeout /t 2 >nul
exit /b
