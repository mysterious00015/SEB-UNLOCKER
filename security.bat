
@echo off
title Alt Tab Controller

:: Request administrator access
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: Hide BAT console
powershell -NoProfile -Command "Add-Type '[DllImport(\"kernel32.dll\")] public static extern IntPtr GetConsoleWindow(); [DllImport(\"user32.dll\")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);' -Name Win -Namespace Native; [Native.Win]::ShowWindow([Native.Win]::GetConsoleWindow(),0)" 

set "URL=https://github.com/AutoHotkey/AutoHotkey/releases/download/v2.0.31/AutoHotkey_2.0.31_setup.exe"
set "INSTALLER=%TEMP%\AutoHotkey_Setup.exe"
set "AHK=C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"

:: Download and install if missing
if not exist "%AHK%" (
    powershell -NoProfile -Command "Invoke-WebRequest '%URL%' -OutFile '%INSTALLER%'"
    if errorlevel 1 exit /b 1

    :: Verify official installer hash
    powershell -NoProfile -Command "if ((Get-FileHash '%INSTALLER%' -Algorithm SHA256).Hash -ne '9224A3BD1757088320BF04C51EFA43511160766BFEE8D6555168293CD54B4C16') { exit 1 }"
    if errorlevel 1 exit /b 1

    start /wait "" "%INSTALLER%" /silent
)

:: Check files
if not exist "%AHK%" exit /b 1
if not exist "%~dp0AltTabControl.ahk" exit /b 1

:: Start AHK in background
start "" "%AHK%" "%~dp0AltTabControl.ahk"

:: Admin success notification
powershell -NoProfile -Command "[System.Windows.Forms.MessageBox]::Show('Administrator access granted. Alt Tab Controller is running.','Alt Tab Controller')"

F7:: {
    ToolTip "Alt Tab Controller stopped!"
    Sleep 300
    ExitApp
}

exit
