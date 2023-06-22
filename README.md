# autobackup_win
Script and installer to periodically backup a directory using robocopy and task manager under MS Windows

# Available environment
- Microsoft Windows newer than Win98.

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
- Q. Why `attrib -s -h` after robocopy? A. Robocopy automatically sets the hidden attribute if the source directory is the drive root (e.g. `D:\`). You can omit it if you do not set the drive root in the source directory.
