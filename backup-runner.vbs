Set ws = CreateObject("Wscript.Shell") 
Set FSO = CreateObject("Scripting.FileSystemObject")
current_dir = FSO.getParentFolderName(WScript.ScriptFullName)

bat_path = current_dir & "\backup.bat"
ws.Run "cmd /c """ & bat_path & """", 0, true
