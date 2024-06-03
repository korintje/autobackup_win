@echo off
setlocal enabledelayedexpansion

REM Move to administrator mode
openfiles > NUL 2>&1 
if not %ERRORLEVEL% == 0 (
  echo Re-execute with administrator privileges because it was executed with a normal privilege.
  powershell start-process \"%~f0\" -Verb runas
  goto exit
)

REM Move to the current directory
cd /d %~dp0
set CURRENT_DIR=%~dp0

REM Interactively input directory path
set /p "SRC_DIR=Source folder fullpath: "
set /p "DST_DIR=Destination folder fullpath: "
set /p "SERVER_USERNAME=Destination server username (optional): "
set /p "SERVER_PASSWORD=Destination server password (optional): "

REM Output directory paths into config.ini
echo.>config.ini
echo SRC_DIR=!SRC_DIR!>>config.ini
echo DST_DIR=!DST_DIR!>>config.ini
echo SERVER_USERNAME=!SERVER_USERNAME!>>config.ini
echo SERVER_PASSWORD=!SERVER_PASSWORD!>>config.ini

REM Run set_scheduller.bat
REM set "command=C:\Windows\System32\wscript.exe"
set "command=wscript"
set "arguments=\"%CURRENT_DIR%backup-runner.wsf""
SCHTASKS /Create /RU "%USERNAME%" /TN "AutoBackup" /SC minute /MO 10 /TR "%command% %arguments%" /RL HIGHEST

REM Check for any errors during the previous command execution
if %errorlevel% equ 0 (
    echo Task created successfully. Press ENTER to close the window.
) else (
    echo Failed to create the task. Please check for any errors.
    echo Make sure that the installer.bat must be run as Administrator.
)

pause
