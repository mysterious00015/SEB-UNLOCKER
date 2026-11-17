
@echo off
setlocal EnableExtensions
title MYSTERIOUS - PREMIUM SETUP
cd /d "%~dp0"

:WELCOME
cls
echo.
echo ======================================================
echo              M Y S T E R I O U S
echo                  SETUP WIZARD
echo ======================================================
echo.
echo GITHUB REPOSITORY:
echo https://github.com/mysterious00015/SEB-UNLOCKER
echo.
echo Hold CTRL + LEFT CLICK to open the link.
echo.
echo DOWNLOAD REQUIRED FILES FROM README.md:
echo.
echo [1] SEB.exe
echo [2] patch.exe
echo.
echo Copy both files into this folder:
echo %~dp0
echo.
echo ======================================================
echo.

choice /C YN /N /M "Have you copied both files? [Y/N]: "

if errorlevel 2 goto EXIT
if errorlevel 1 goto VERIFY

:VERIFY
cls
echo.
echo ======================================================
echo                 FILE VERIFICATION
echo ======================================================
echo.

if not exist "%~dp0SEB.exe" (
    echo [MISSING] SEB.exe
    echo Please download it from README.md.
    pause
    goto WELCOME
)

echo [FOUND] SEB.exe

if not exist "%~dp0patch.exe" (
    echo [MISSING] patch.exe
    echo Please download it from README.md.
    pause
    goto WELCOME
)

echo [FOUND] patch.exe

echo.
echo Both files are present!
echo.
echo Opening code.txt...

if not exist "%~dp0code.txt" (
    echo ERROR: code.txt is missing!
    pause
    goto EXIT
)

start "" notepad.exe "%~dp0code.txt"

echo.
echo Please copy the contents of code.txt.
echo.
echo File location:
echo %~dp0code.txt
echo.
echo Closing in 5 seconds...
timeout /t 5 /nobreak >nul

:EXIT
exit /b
