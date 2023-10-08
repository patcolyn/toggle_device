'' User variables
Set batchPath = "toggle_device.bat"

Set shortcutName = "toggle_touchscreen.lnk"
Set enabledIconPath = "C:\Windows\System32\SHELL32.dll"
Set enabledIconIndex = 296
Set disabledIconPath = "C:\Windows\System32\SHELL32.dll"
Set disabledIconIndex = 131

'' Find shortcut
''' Must be on the desktop
Const DESKTOP = &H10&
Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.NameSpace(DESKTOP)
Set objFolderItem = objFolder.ParseName(shortcutName)
Set objShortcut = objFolderItem.GetLink

'' Toggle icon
if objShortcut.GetIconLocation(objFolderItem.Path) = disabledIconIndex then
    '' Checkmark
    objShortcut.SetIconLocation enabledIconPath, enabledIconIndex
else 
    '' X-mark
    objShortcut.SetIconLocation disabledIconPath, disabledIconIndex
end if
objShortcut.Save

'' Run silent bat script
Set WshShell = CreateObject("WScript.Shell" ) 
WshShell.Run chr(34) & batchPath & Chr(34), 0 
Set WshShell = Nothing