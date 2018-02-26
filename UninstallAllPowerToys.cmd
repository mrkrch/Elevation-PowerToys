:: //***************************************************************************
:: // ***** Script Header *****
:: // =======================================================
:: // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
:: // =======================================================
:: //
:: // File:      UninstallAllPowerToys.cmd
:: //
:: // Additional files required:  Elevate.cmd, Elevate.vbs
:: //
:: // Purpose:   To provide a method uninstall all Elevation PowerToys
:: //            in a scripted manner.
:: //
:: // Usage:     UninstallAllPowerToys.cmd
:: //
:: // Version:   1.0.0
:: // Date :     04/29/2008
:: //
:: // History:
:: // 1.0.0   04/29/2008  Created initial version.
:: //
:: // ***** End Header *****
:: //***************************************************************************


@echo off

if {%*}=={%~dp0} goto CONTINUE_SCRIPT
echo Re-Launching script as administrator, Please click allow or continue button from the following prompt to elevate
call elevate.cmd "%~dpnx0" %~dp0
pause
goto :EOF


:CONTINUE_SCRIPT
cd \
cd "%*"
echo Continuing UninstallAllPowerToys.cmd....

:: *************************************************************
:: *** Section I - Uninstall Elevate Command PowerToy
:: *************************************************************
:: I-A: "Elevate Command" PowerToy
if exist %SystemRoot%\inf\ElevateCommand.inf (
    echo Uninstalling "Elevate Command" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateCommand.inf
)


:: *************************************************************
:: *** Section II - Uninstall CMD Prompt PowerToys
:: *************************************************************
:: II-A: "CMD Prompt Here" PowerToy
if exist %SystemRoot%\inf\CmdHere.inf (
    echo Uninstalling "CMD Prompt Here" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\CmdHere.inf
)

:: II-B: "CMD Prompt Here as Administrator" PowerToy
if exist %SystemRoot%\inf\CmdHereAsAdmin.inf (
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\CmdHereAsAdmin.inf
    echo Uninstalling "CMD Prompt Here as Administrator" PowerToy
)

:: II-C: "CMD Prompt Here as System" PowerToy
if exist %SystemRoot%\inf\CmdHereAsSystem.inf (
    echo Uninstalling "CMD Prompt Here as System" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\CmdHereAsSystem.inf
)


:: *************************************************************
:: *** Section III - Uninstall Windows PowerShell Prompt PowerToys
:: *************************************************************
:: III-A: "PowerShell Prompt Here" PowerToy
if exist %SystemRoot%\inf\PowerShellHere.inf (
    echo Uninstalling "PowerShell Prompt Here" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\PowerShellHere.inf
)

:: III-B: "PowerShell Prompt Here as Administrator" PowerToy
if exist %SystemRoot%\inf\PowerShellHereAsAdmin.inf (
    echo Uninstalling "PowerShell Prompt Here as Administrator" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\PowerShellHereAsAdmin.inf
)

:: III-C: "PowerShell Prompt Here as System" PowerToy
if exist %SystemRoot%\inf\PowerShellHereAsSystem.inf (
    echo Uninstalling "PowerShell Prompt Here as System" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\PowerShellHereAsSystem.inf
)


:: *************************************************************
:: *** Section IV - Uninstall Windows Script PowerToys
:: *************************************************************
:: IV-A: "Elevate WSH Script" PowerToy
if exist %SystemRoot%\inf\ElevateWSHScript.inf (
    echo Uninstalling "Elevate WSH Script" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateWSHScript.inf
)

:: IV-B: "Elevate PowerShell v1.0 Script" PowerToy
if exist %SystemRoot%\inf\ElevatePowerShellScript.inf (
    echo Uninstalling "Elevate PowerShell v1.0 Script" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevatePowerShellScript.inf
)

:: IV-C: "Elevate HTML Application" PowerToy
if exist %SystemRoot%\inf\ElevateHTA.inf (
    echo Uninstalling "Elevate HTML Application" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateHTA.inf
)


:: *************************************************************
:: *** Section V - Uninstall Windows Installer PowerToy
:: *************************************************************
:: V-A: "Elevate Windows Installer Package" PowerToy
if exist %SystemRoot%\inf\ElevateMSI.inf (
    echo Uninstalling "Elevate Windows Installer Package" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateMSI.inf
)


:: *************************************************************
:: *** Section VI - Uninstall Third Party Script PowerToy
:: *************************************************************
:: VI-A: "Elevate AutoIt v3 Script" PowerToy
if exist %SystemRoot%\inf\ElevateAutoIt3.inf (
    echo Uninstalling "Elevate AutoIt v3 Script" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateAutoIt3.inf
)

:: VI-A: "Elevate AutoHotkey Script" PowerToy
if exist %SystemRoot%\inf\ElevateAutoHotkey.inf (
    echo Uninstalling "Elevate AutoHotkey Script" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateAutoHotkey.inf
)

:: VI-A: "Elevate Perl Script" PowerToy
if exist %SystemRoot%\inf\ElevatePerlScript.inf (
    echo Uninstalling "Elevate Perl Script" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevatePerlScript.inf
)

:: VI-A: "Elevate KiXtart Script" PowerToy
if exist %SystemRoot%\inf\ElevateKiXtart.inf (
    echo Uninstalling "Elevate KiXtart Script" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\ElevateKiXtart.inf
)


:: *************************************************************
:: *** Section VII - Uninstall Run As Another User PowerToy
:: *************************************************************
:: VII-A: "Run As Another User" PowerToy
if exist %SystemRoot%\inf\RunAs.inf (
    echo Uninstalling "Run As Another User" PowerToy
    "%SystemRoot%\System32\rundll32.exe" %SystemRoot%\System32\syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %SystemRoot%\inf\RunAs.inf
)


:: *************************************************************
:: *** Section VIII - Uninstall Elevation Gadget
:: *************************************************************
:: VIII-A: Elevation Gadget
echo The Elevation Gadget should be uninstalled by right clicking on the Windows
echo Sidebar, selecting Add Gadgets..., right clicking on the Elevation Gadget
echo icon in the Gadget Gallery and selecting Uninstall.


pause