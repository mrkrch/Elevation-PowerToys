:: //***************************************************************************
:: // ***** Script Header *****
:: // =======================================================
:: // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
:: // =======================================================
:: //
:: // File:      PSAsAdmin.cmd
:: //
:: // Purpose:   To provide a command to start a Windows Power Shell prompt "As 
:: //            Administrator" on Windows Vista.  
:: //
:: // Additional requirement:  "Elevate Command" PowerToy for Windows Vista
:: //                          must be installed
:: //
:: // Usage:     PSAsAdmin.cmd "<optional folder path>"
:: //
:: // Version:   1.0.0
:: // Date :     04/29/2008
:: //
:: // History:
:: // 1.0.0   04/29/2008  Created initial version.
:: //
:: // ***** End Header *****
:: //***************************************************************************

@echo Off

if {%1}=={} (
    Elevate.cmd "%SystemRoot%\system32\windowspowershell\v1.0\powershell.exe" -NoExit -Command $host.ui.rawui.windowtitle = 'Administrator: ' + $host.ui.rawui.windowtitle
) else (
    Elevate.cmd "%SystemRoot%\system32\windowspowershell\v1.0\powershell.exe" -NoExit -Command Set-Location -LiteralPath '%~1'; $host.ui.rawui.windowtitle = 'Administrator: ' + $host.ui.rawui.windowtitle
)
