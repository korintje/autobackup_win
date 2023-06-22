@echo off

set CONFIG=config.ini
REM set SERVER_CONFIG=server_config.ini
cd /d %~dp0

REM Load config.ini
for /f "tokens=1,* delims==" %%a in (%CONFIG%) do (
    set %%a=%%b
)

REM Load server_config.ini
REM for /f "tokens=1,* delims==" %%a in (%SERVER_CONFIG%) do (
REM     set %%a=%%b
REM )

REM Connect to NAS
net use "%DST_DIR%" /user:%SERVER_USERNAME% %SERVER_PASSWORD%

REM Run robocopy
robocopy "%SRC_DIR%" "%DST_DIR%" /s /e /mir /DCOPY:T /r:1 /w:1 /LOG:"backup.log"

REM Remove hidden and system attributes
attrib -s -h "%DST_DIR%"