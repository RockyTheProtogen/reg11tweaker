@echo off

rem this is a base64 encoded shortcut.
echo TAAAAAEUAgAAAAAAwAAAAAAAAEabAAgAIAAAAKA/cO33r9gB2vT3k/2v2AEA0RkhVKzYAQA6BQAAAAAAAQAAAAAAAAAAAAAAAAAAAAcBFAAfUOBP0CDqOmkQotgIACswMJ0ZAC9DOlwAAAAAAAAAAAAAAAAAAAAAAAAAZgAxAAAAAAAOVeqAEABTWVNURU1+MgAATgAJAAQA774OVdSADlXqgC4AAACOWwEAAAAdAAAAAAAAAAAAAAAAAAAAYQz0AFMAeQBzAHQAZQBtAHQAcgBhAHkAbQBlAG4AdQAAABgAcgAyAAA6BQAKVScHIABTWVNURU1+MS5FWEUAAFYACQAEAO++DlXqgA5V6oAuAAAALVwCAAAAAwAAAAAAAAAAAAAAAAAAAAAAAABTAHkAcwB0AGUAbQBUAHIAYQB5AE0AZQBuAHUALgBlAHgAZQAAABwAAABTAAAAHAAAAAEAAAAcAAAALQAAAAAAAABSAAAAEQAAAAMAAADjZTwUEAAAAABDOlxTeXN0ZW10cmF5bWVudVxTeXN0ZW1UcmF5TWVudS5leGUAACoALgAuAFwALgAuAFwALgAuAFwAUwB5AHMAdABlAG0AdAByAGEAeQBtAGUAbgB1AFwAUwB5AHMAdABlAG0AVAByAGEAeQBNAGUAbgB1AC4AZQB4AGUAEQBDADoAXABTAHkAcwB0AGUAbQB0AHIAYQB5AG0AZQBuAHUAYAAAAAMAAKBYAAAAAAAAAGRlc2t0b3AtcmkycmFvNQDKDEyn1ZKaTpdodc4k0+5t7ThS0Nsb7RGEgrCkYF47GsoMTKfVkppOl2h1ziTT7m3tOFLQ2xvtEYSCsKRgXjsa0AEAAAkAAKBVAAAAMVNQU+0wvdpDAIlHp/jQE6RzZiI5AAAAZAAAAAAfAAAAFAAAAFMAeQBzAHQAZQBtAHQAcgBhAHkAbQBlAG4AdQAgACgAQwA6ACkAAAAAAAAAvQAAADFTUFMw8SW370caEKXxAmCMnuusOQAAAAoAAAAAHwAAABMAAABTAHkAcwB0AGUAbQBUAHIAYQB5AE0AZQBuAHUALgBlAHgAZQAAAAAAFQAAAA8AAAAAQAAAAAAsd+73r9gBFQAAAAwAAAAAFQAAAAA6BQAAAAAAKQAAAAQAAAAAHwAAAAwAAABBAHAAcABsAGkAYwBhAHQAaQBvAG4AAAAVAAAADgAAAABAAAAAANEZIVSs2AEAAAAAeQAAADFTUFOmamMoPZXSEbXWAMBP2RjQXQAAAB4AAAAAHwAAACUAAABDADoAXABTAHkAcwB0AGUAbQB0AHIAYQB5AG0AZQBuAHUAXABTAHkAcwB0AGUAbQBUAHIAYQB5AE0AZQBuAHUALgBlAHgAZQAAAAAAAAAAADkAAAAxU1BTsRZtRK2NcEinSEAupD14jB0AAABoAAAAAEgAAACCOSpi7n5GSKLymzvq4dOHAAAAAAAAAAAAAAAA>"%userprofile%\desktop\encshortcut.shortcutfileencodedbase64"
rem Decodes shortcut...
certutil -decode "%userprofile%\desktop\encshortcut.shortcutfileencodedbase64" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Systemtraymenu.lnk"
certutil -decode "%userprofile%\desktop\encshortcut.shortcutfileencodedbase64" "%userprofile%\desktop\System Tray Menu.lnk"
del "%userprofile%\desktop\encshortcut.shortcutfileencodedbase64"
rem downloads .NET 
echo Downloading .NET...
powershell Invoke-WebRequest -uri https://download.visualstudio.microsoft.com/download/pr/b4a17a47-2fe8-498d-b817-30ad2e23f413/00020402af25ba40990c6cc3db5cb270/windowsdesktop-runtime-6.0.8-win-x64.exe -outfile "%userprofile%\downloads\microsoftdotnet.exe"
echo Installing...
"%userprofile%\downloads\microsoftdotnet.exe" /install /quiet /norestart
cls


echo Continuing means that any damage caused to your systems registry, or any damage at all, you are resonsible for. Consider this a warning before continuing.
Echo in the case you agree, follow the prompt, else close this window now.
echo also note that UAC will be disabled, this is a attempt to fix the explorer search box.
choice /d Y /t 60 /m "Continue?"
cls
explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}
echo Find "turn icons on or off" in the menu, and turn on what you can. Close it when done.
powershell Invoke-WebRequest -uri https://github.com/Hofknecht/SystemTrayMenu/releases/download/v1.3.1.0/SystemTrayMenu-1.3.1.0.zip -outfile "%userprofile%\desktop\systemtraymenu.zip"
powershell expand-archive -path "%userprofile%\desktop\systemtraymenu.zip" -destinationpath C:\Systemtraymenu\
cls
echo creating registry file...
echo Windows Registry Editor Version 5.00>"%userprofile%\regtweak.reg"
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>"%userprofile%\regtweak.reg"
echo "HideFileExt"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "ServerAdminUI"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "Hidden"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "Start_SearchFiles"=dword:00000002>>"%userprofile%\regtweak.reg"
echo "HideIcons"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "MapNetDrvBtn"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "WebView"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "Filter"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "ShowSuperHidden"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "SeparateProcess"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "AutoCheckSelect"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "IconsOnly"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "ShowTypeOverlay"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "ShowStatusBar"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "ListviewAlphaSelect"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "ListviewShadow"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "TaskbarAnimations"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "TaskbarSizeMove"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "DisablePreviewDesktop"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "TaskbarSmallIcons"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "TaskbarGlomLevel"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "MMTaskbarGlomLevel"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "TaskbarAutoHideInTabletMode"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "MMTaskbarMode"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "MMTaskbarEnabled"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "ShellMigrationLevel"=dword:00000003>>"%userprofile%\regtweak.reg"
echo "StartMigratedBrowserPin"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "StartShownOnUpgrade"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "ReindexedProfile"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "StartMenuInit"=dword:0000000d>>"%userprofile%\regtweak.reg"
echo "TaskbarMn"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "TaskbarSi"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "Start_ShowClassicMode"=dword:00000001>>"%userprofile%\regtweak.reg"
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]>>"%userprofile%\regtweak.reg"
echo "WaitToKillServiceTimeout"="1000">>"%userprofile%\regtweak.reg"
echo [HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32]>>"%userprofile%\regtweak.reg"
echo @="">>"%userprofile%\regtweak.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization]>>"%userprofile%\regtweak.reg"
echo "NoLockScreen"=dword:00000001>>"%userprofile%\regtweak.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages]>>"%userprofile%\regtweak.reg"
echo "UndockingDisabled"=dword:00000001>>"%userprofile%\regtweak.reg"
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]>>"%userprofile%\regtweak.reg"
echo "SearchboxTaskbarMode"=dword:00000000>>"%userprofile%\regtweak.reg"
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>>"%userprofile%\regtweak.reg"
echo "ShowTaskViewButton"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "ShowCortanaButton"=dword:00000000>>"%userprofile%\regtweak.reg"
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]>>"%userprofile%\regtweak.reg"
echo "NoTaskGrouping"=dword:00000000>>"%userprofile%\regtweak.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]>>"%userprofile%\regtweak.reg"
echo "ConsentPromptBehaviorAdmin"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "EnableCursorSuppression"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "EnableInstallerDetection"=dword:00000001>>"%userprofile%\regtweak.reg"
echo "EnableLUA"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "shutdownwithoutlogon"=dword:00000000>>"%userprofile%\regtweak.reg"
echo "verbosestatus"=dword:00000001>>"%userprofile%\regtweak.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes]>>"%userprofile%\regtweak.reg"
echo "Drop Shadow"="TRUE">>"%userprofile%\regtweak.reg"
echo "Flat Menus"="FALSE">>"%userprofile%\regtweak.reg"
echo "InstallTheme"="C:\\Windows\\resources\\Themes\\dark.theme">>"%userprofile%\regtweak.reg"
echo "InstallThemeDark"="C:\\Windows\\resources\\Themes\\dark.theme">>"%userprofile%\regtweak.reg"
echo "InstallThemeLight"="C:\\Windows\\resources\\Themes\\dark.theme">>"%userprofile%\regtweak.reg"
echo "InstallVisualStyle"="%ResourceDir%\\themes\\Aero\\Aero.msstyles">>"%userprofile%\regtweak.reg"
cls
echo Registry file made...
echo.
echo If asked for administrator permissoins, click yes. follow the prompt to continue.
echo If you have changed your mind, and dont want to make these changes, close the window.
pause
cls
echo click yes to continue, no to cancel...
"%userprofile%\regtweak.reg"
echo Please save any work, script is scheduling a restart to apply changes. You can close this window.
echo Once you log in, you should be prompted by System Tray Menu, if not, there should be a shortcut on the desktop. (aka. This PC\%userprofile%\desktop\System Tray Menu.lnk)
shutdown -r -t 120
pause >nul