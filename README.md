# autobackup_win
Script and installer to periodically clone a directory to another directory with robocopy and task manager in MS Windows

# Installation
1. Download the repository and unzip.
2. Move the `autobackup_win-main` directory to a convenient place.
3. Run `installer.bat`. You will be asked for the following info.
  - Source folder fullpath
  - Destination folder fullpath
  - Destination server username (optional)
  - Destination server password (optional)

# Note 
- Default backup interval is 10 min. Currently, you can change the interval time by changing `10` to another value in the line `SCHTASKS /Create /RU "%USERNAME%" /TN "AutoBackup" /SC minute /MO 10 /TR "%command% %arguments%" /RL HIGHEST` in the `installer.bat` before the installation. It will be more convenient in future.
