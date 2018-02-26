//***************************************************************************
// ***** Script Header *****
// =======================================================
// Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
// =======================================================
//
// File:      Readme.txt
//
// Purpose:   Notes for the Elevation PowerToys
//
// Version:   1.1
// Date :     04/29/2008
//
// History:
// 1.1   04/29/2008  Created initial version.
//
// ***** End Header *****
//***************************************************************************

This document applies to the second web release of Elevation PowerToys for
Windows Vista.  All files in this release have a Date Modified of January
29, 2008.


I. Installation
---------------
The PowerToys may be installed individually by right clicking on the INF file,
selecting Install, and approving the elevation.  To uninstall them 
individually, use the Programs and Features Control Panel.

The only INF files in this download that do not install a PowerToy are
Install_KiXtart.inf and Install_SysinternalsSuite.inf which are used to
install the KiXtart 2010 scripting language and the Sysinternal Suite of
utilities respectively.  See the TechNet Magazine article for details.

This download also includes scripts to install or unistall all the Elevation
PowerToys at once (InstallAllPowerToys.cmd and UninstallAllPowerToys.cmd).
These command shell scripts can be modified to install/unistall only the
utilities desired.  InstallAllPowerToys.cmd does not install the PowerToys
for the third-party scripting tools by default.

InstallAllPowerToys.cmd has three environment variables for controlling the
installation of PowerToys that depend on the installation of either Windows
PowerShell, the Sysinternals Suite, or the third-party scripting tools.  See
the notes in Section 0 of InstallAllPowerToys.cmd.


II. Dependencies
----------------
Below are listed the PowerToys that depend on installation of other items
to function.  These dependencies are documented in the header block of
each INF file as well.

Depend on the "Elevate Command" PowerToy being installed:
- "CMD Prompt Here as Administrator" PowerToy (CmdHereAsAdmin.inf)
- "CMD Prompt Here as System" PowerToy (CmdHereAsSystem)
- "PowerShell Prompt Here as Administrator" PowerToy (PowerShellHereAsAdmin.inf)
- "PowerShell Prompt Here as System" PowerToy (PowerShellHereAsSystem.inf)
- "Elevate WSH Script" PowerToy (ElevateWSHScript.inf)
- "Run As Another User" PowerToy (RunAs.inf)

Depend on the Windows PowerShell 1.0 being installed:
- "PowerShell Prompt Here" PowerToy (PowerShellHere.inf)
- "PowerShell Prompt Here as Administrator" PowerToy (PowerShellHereAsAdmin.inf)
- "PowerShell Prompt Here as System" PowerToy (PowerShellHereAsSystem.inf)

Depend on the Sysinternals Suite being installed with Install_SysinternalsSuite.inf:
- "CMD Prompt Here as System" PowerToy (CmdHereAsSystem)
- "PowerShell Prompt Here as System" PowerToy (PowerShellHereAsSystem.inf)

Individually depend on a third-party scripting tool being installed:
- "Elevate AutoIt v3 Script" PowerToy (ElevateAutoIt3.inf)
- "Elevate AutoHotkey Script" PowerToy (ElevateAutoHotkey.inf)
- "Elevate Perl Script" PowerToy (ElevatePerlScript.inf)
- "Elevate KiXtart Script" PowerToy (ElevateKiXtart.inf)


III. Files Included
-------------------

The 04/29/2008 collection consists of the following files:

File name                          Version        New for this release
----------------------------------------------------------------------
CmdAsAdmin.cmd                      1.0.0                 X
----------------------------------------------------------------------
CmdAsSystem.cmd                     1.0.0                 X
----------------------------------------------------------------------
CmdHere.inf                         1.0.3
----------------------------------------------------------------------
CmdHereAsAdmin.inf                  1.0.2
----------------------------------------------------------------------
CmdHereAsSystem.inf                 1.0.0                 X
----------------------------------------------------------------------
elevate.cmd                         1.0.0
----------------------------------------------------------------------
elevate.vbs                         1.0.1
----------------------------------------------------------------------
ElevateAutoHotKey.inf               1.0.0                 X
----------------------------------------------------------------------
ElevateAutoIt3.inf                  1.0.0                 X
----------------------------------------------------------------------
ElevateCommand.inf                  1.0.1
----------------------------------------------------------------------
ElevateHTA.inf                      1.0.1
----------------------------------------------------------------------
ElevateKiXtart.inf                  1.0.0                 X
----------------------------------------------------------------------
ElevateMSI.inf                      1.0.0
----------------------------------------------------------------------
ElevatePerlScript.inf               1.0.0                 X
----------------------------------------------------------------------
ElevatePowerShellScript.inf         1.0.1
----------------------------------------------------------------------
ElevateWSHScript.inf                1.0.2
----------------------------------------------------------------------
Elevation.gadget                    1.0.0                 X
----------------------------------------------------------------------
ElevationPowertoys.ico              -----                 X
----------------------------------------------------------------------
Install_KiXtart.inf                 1.0.0                 X
----------------------------------------------------------------------
Install_SysinternalsSuite.inf       1.0.0                 X
----------------------------------------------------------------------
InstallAllPowerToys.cmd             1.0.0                 X
----------------------------------------------------------------------
PowerShellHere.inf                  1.0.2
----------------------------------------------------------------------
PowerShellHereAsAdmin.inf           1.0.1
----------------------------------------------------------------------
PowerShellHereAsSystem.inf          1.0.0                 X
----------------------------------------------------------------------
PSAsAdmin.cmd                       1.0.0                 X
----------------------------------------------------------------------
PSAsSystem.cmd                      1.0.0                 X
----------------------------------------------------------------------
Readme.txt                          -----                 X
----------------------------------------------------------------------
RunAs.hta                           1.0.0                 X
----------------------------------------------------------------------
RunAs.inf                           1.0.0                 X
----------------------------------------------------------------------
UninstallAllPowerToys.cmd           1.0.0                 X
