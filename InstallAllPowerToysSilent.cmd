:: Command Shell Sample Script
:: ------------------------------------------------------------------------
:: Copyright (C) 2008 Microsoft Corporation
::
:: You have a royalty-free right to use, modify, reproduce and distribute
:: the Sample Application Files (and/or any modified version) in any way
:: you find useful, provided that you agree that Microsoft and the author
:: have no warranty, obligations or liability for any Sample Application
:: Files.
:: ------------------------------------------------------------------------
:: //***************************************************************************
:: // ***** Script Header *****
:: // =======================================================
:: // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
:: // =======================================================
:: //
:: // File:      InstallAllPowerToysSilent.cmd
:: //
:: // Additional files required:  Elevate.cmd, Elevate.vbs
:: //
:: // Purpose:   To provide a method installing all Elevation PowerToys
:: //            in a silent scripted manner.
:: //
:: // Usage:     InstallAllPowerToysSilent.cmd
:: //
:: // Version:   1.0.1
:: // Date :     12/22/2008
:: //
:: // History:
:: // 1.0.0   11/18/2008  Created initial version.
:: // 1.0.1   12/22/2008  Added xcopy command for Elevation Gadget.
:: //
:: // ***** End Header *****
:: //***************************************************************************


@echo off

set CmdDir=%~dp0
set CmdDir=%CmdDir:~0,-1%

:: *************************************************************
:: *** Section 0 - Variables to control installation
:: *************************************************************
:: Set this variable to 1 to install PowerShell-related PowerToys
set INSTALL_POWERSHELL_TOYS=1

:: Set this variable to 1 to install "Prompt Here as System" PowerToys
:: These require that the Sysinternals Suite has been installed using
:: Install_SysinternalsSuite.inf
set INSTALL_SYSTEM_TOYS=0

:: Set this variable to 1 to install Third Party Script PowerToys
set INSTALL_THIRD_PARTY_TOYS=0

:: Set this variable to 1 to install the Elevation Gadget for all users
set INSTALL_ELEVATION_GADGET=0


:: *************************************************************
:: *** Section I - Install Elevate Command PowerToy
:: *************************************************************
:: I-A: "Elevate Command" PowerToy
echo Installing "Elevate Command" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateCommand.inf"


:: *************************************************************
:: *** Section II - Install CMD Prompt PowerToys
:: *************************************************************
:: II-A: "CMD Prompt Here" PowerToy
echo Installing "CMD Prompt Here" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\CmdHere.inf"

:: II-B: "CMD Prompt Here as Administrator" PowerToy
echo Installing "CMD Prompt Here as Administrator" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\CmdHereAsAdmin.inf"

if {%INSTALL_SYSTEM_TOYS%}=={1} (
    :: II-C: "CMD Prompt Here as System" PowerToy
    echo Installing "CMD Prompt Here as System" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\CmdHereAsSystem.inf"
)


:: *************************************************************
:: *** Section III - Install Windows PowerShell Prompt PowerToys
:: *************************************************************
if {%INSTALL_POWERSHELL_TOYS%}=={1} (
    :: III-A: "PowerShell Prompt Here" PowerToy
    echo Installing "PowerShell Prompt Here" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\PowerShellHere.inf"

    :: III-B: "PowerShell Prompt Here as Administrator" PowerToy
    echo Installing "PowerShell Prompt Here as Administrator" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\PowerShellHereAsAdmin.inf"

    if {%INSTALL_SYSTEM_TOYS%}=={1} (
        :: III-C: "PowerShell Prompt Here as System" PowerToy
        echo Installing "PowerShell Prompt Here as System" PowerToy
        "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\PowerShellHereAsSystem.inf"
    )
)


:: *************************************************************
:: *** Section IV - Install Windows Script PowerToys
:: *************************************************************
:: IV-A: "Elevate WSH Script" PowerToy
echo Installing "Elevate WSH Script" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateWSHScript.inf"

if {%INSTALL_POWERSHELL_TOYS%}=={1} (
    :: IV-B: "Elevate PowerShell v1.0 Script" PowerToy
    echo Installing "Elevate PowerShell v1.0 Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevatePowerShellScript.inf"
)

:: IV-C: "Elevate HTML Application" PowerToy
echo Installing "Elevate HTML Application" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateHTA.inf"


:: *************************************************************
:: *** Section V - Install Windows Installer PowerToy
:: *************************************************************
:: V-A: "Elevate Windows Installer Package" PowerToy
echo Installing "Elevate Windows Installer Package" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateMSI.inf"


:: *************************************************************
:: *** Section VI - Install Third Party Script PowerToys
:: *************************************************************
if {%INSTALL_THIRD_PARTY_TOYS%}=={1} (
    :: VI-A: "Elevate AutoIt v3 Script" PowerToy
    echo Installing "Elevate AutoIt v3 Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateAutoIt3.inf"

    :: VI-A: "Elevate AutoHotkey Script" PowerToy
    echo Installing "Elevate AutoHotkey Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateAutoHotkey.inf"

    :: VI-A: "Elevate Perl Script" PowerToy
    echo Installing "Elevate Perl Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevatePerlScript.inf"

    :: VI-A: "Elevate KiXtart Script" PowerToy
    echo Installing "Elevate KiXtart Script" PowerToy
    "%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\ElevateKiXtart.inf"
)


:: *************************************************************
:: *** Section VII - Install Run As Another User PowerToy
:: *************************************************************
:: VII-A: "Run As Another User" PowerToy
echo Installing "Run As Another User" PowerToy
"%SystemRoot%\System32\InfDefaultInstall.exe" "%CmdDir%\RunAs.inf"


:: *************************************************************
:: *** Section VIII - Install Elevation Gadget
:: *************************************************************
if {%INSTALL_ELEVATION_GADGET%}=={1} (
    :: VIII-A: Elevation Gadget
    echo Installing Elevation Gadget for all users
    xcopy "%CmdDir%\Elevation.gadget" "%ProgramFiles%\Windows Sidebar\shared gadgets\Elevation.gadget\" /s /e
)
