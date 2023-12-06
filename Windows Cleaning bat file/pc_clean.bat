@ECHO OFF

REM Remove all temporary files
DEL /S /Q "%TMP%\*.*"
DEL /S /Q "%TEMP%\*.*"
DEL /S /Q "%WINDIR%\Temp\*.*"
DEL /S /Q "%USERPROFILE%\Local Settings\Temp\*.*"
DEL /S /Q "%LOCALAPPDATA%\Temp\*.*"

REM Remove files in the Recycle Bin
RD /S /Q "%SYSTEMDRIVE%\RECYCLER"

REM Remove files in the Recents folder that are older than 30 days
FORFILES /P "%APPDATA%\Microsoft\Windows\Recent" /S /D -30 /C "cmd /c del /q @path"

REM Remove files in the Temp folder that are older than 7 days
FORFILES /P "%TEMP%" /S /D -7 /C "cmd /c del /q @path"

REM Remove files in the Prefetch folder
RD /S /Q "%WINDIR%\Prefetch"

REM Remove Windows Error Reporting files
RD /S /Q "%LOCALAPPDATA%\Microsoft\Windows\WER"

REM Remove Windows Log files
RD /S /Q "%WINDIR%\Logs"

REM Remove Windows Update cache files
net stop wuauserv
RD /S /Q "%WINDIR%\SoftwareDistribution"
net start wuauserv

REM Notify user that cleaning is complete
echo Clean up complete.

REM Pause to allow the user to see the output
PAUSE