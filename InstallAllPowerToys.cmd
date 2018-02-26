:: //***************************************************************************
:: // ***** Script Header *****
:: // =======================================================
:: // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
:: // =======================================================
:: //
:: // File:      InstallAllPowerToys.cmd
:: //
:: // Additional files required:  Elevate.cmd, Elevate.vbs
:: //
:: // Purpose:   To provide a method installing all Elevation PowerToys
:: //            in a scripted manner.
:: //
:: // Usage:     InstallAllPowerToys.cmd
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
echo continuing InstallAllPowerToys.cmd

:: *************************************************************
:: *** Section 0 - Variables to control installation
:: *************************************************************
:: Set this variable to 1 to install PowerShell-related PowerToys
set INSTALL_POWERSHELL_TOYS=1

:: Set this variable to 1 to install "Prompt Here as System" PowerToys
:: These require that the Sysinternals Suite has been installed using
:: Install_SysinternalsSuite.inf
set INSTALL_SYSTEM_TOYS=1

:: Set this variable to 1 to install Third Party Script PowerToys
set INSTALL_THIRD_PARTY_TOYS=0


:: *************************************************************
:: *** Section I - Install Elevate Command PowerToy
:: *************************************************************
:: I-A: "Elevate Command" PowerToy
echo Installing "Elevate Command" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateCommand.inf"


:: *************************************************************
:: *** Section II - Install CMD Prompt PowerToys
:: *************************************************************
:: II-A: "CMD Prompt Here" PowerToy
echo Installing "CMD Prompt Here" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\CmdHere.inf"

:: II-B: "CMD Prompt Here as Administrator" PowerToy
echo Installing "CMD Prompt Here as Administrator" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\CmdHereAsAdmin.inf"

if {%INSTALL_SYSTEM_TOYS%}=={1} (
    :: II-C: "CMD Prompt Here as System" PowerToy
    echo Installing "CMD Prompt Here as System" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\CmdHereAsSystem.inf"
)


:: *************************************************************
:: *** Section III - Install Windows PowerShell Prompt PowerToys
:: *************************************************************
if {%INSTALL_POWERSHELL_TOYS%}=={1} (
    :: III-A: "PowerShell Prompt Here" PowerToy
    echo Installing "PowerShell Prompt Here" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\PowerShellHere.inf"

    :: III-B: "PowerShell Prompt Here as Administrator" PowerToy
    echo Installing "PowerShell Prompt Here as Administrator" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\PowerShellHereAsAdmin.inf"

    if {%INSTALL_SYSTEM_TOYS%}=={1} (
        :: III-C: "PowerShell Prompt Here as System" PowerToy
        echo Installing "PowerShell Prompt Here as System" PowerToy
        "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\PowerShellHereAsSystem.inf"
    )
)


:: *************************************************************
:: *** Section IV - Install Windows Script PowerToys
:: *************************************************************
:: IV-A: "Elevate WSH Script" PowerToy
echo Installing "Elevate WSH Script" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateWSHScript.inf"

if {%INSTALL_POWERSHELL_TOYS%}=={1} (
    :: IV-B: "Elevate PowerShell v1.0 Script" PowerToy
    echo Installing "Elevate PowerShell v1.0 Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevatePowerShellScript.inf"
)

:: IV-C: "Elevate HTML Application" PowerToy
echo Installing "Elevate HTML Application" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateHTA.inf"


:: *************************************************************
:: *** Section V - Install Windows Installer PowerToy
:: *************************************************************
:: V-A: "Elevate Windows Installer Package" PowerToy
echo Installing "Elevate Windows Installer Package" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateMSI.inf"


:: *************************************************************
:: *** Section VI - Install Third Party Script PowerToys
:: *************************************************************
if {%INSTALL_THIRD_PARTY_TOYS%}=={1} (
    :: VI-A: "Elevate AutoIt v3 Script" PowerToy
    echo Installing "Elevate AutoIt v3 Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateAutoIt3.inf"

    :: VI-A: "Elevate AutoHotkey Script" PowerToy
    echo Installing "Elevate AutoHotkey Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateAutoHotkey.inf"

    :: VI-A: "Elevate Perl Script" PowerToy
    echo Installing "Elevate Perl Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevatePerlScript.inf"

    :: VI-A: "Elevate KiXtart Script" PowerToy
    echo Installing "Elevate KiXtart Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\ElevateKiXtart.inf"
)


:: *************************************************************
:: *** Section VII - Install Run As Another User PowerToy
:: *************************************************************
:: VII-A: "Run As Another User" PowerToy
echo Installing "Run As Another User" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%cd%\RunAs.inf"


:: *************************************************************
:: *** Section VIII - Install Elevation Gadget
:: *************************************************************
:: VIII-A: Elevation Gadget
echo Installing Elevation Gadget
"%cd%\Elevation.gadget"


pause