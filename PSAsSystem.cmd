:: //***************************************************************************
:: // ***** Script Header *****
:: // =======================================================
:: // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
:: // =======================================================
:: //
:: // File:      PSAsSystem.cmd
:: //
:: // Purpose:   To provide a command to start a Windows Power Shell prompt running 
:: //            under the System context on Windows Vista.  
:: //
:: // Additional requirement:  "Elevate Command" PowerToy for Windows Vista
:: //                          must be installed and Sysinternals Suite must
:: //                          be installed in %ProgramFiles%\Sysinternals Suite
:: //
:: // Usage:     PSAsSystem.cmd "<optional folder path>"
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

if exist "%ProgramFiles%\Sysinternals Suite\psexec.exe" (
    if {%1}=={} (
        Elevate.cmd "%ProgramFiles%\Sysinternals Suite\psexec.exe" -i -s -d "%SystemRoot%\system32\windowspowershell\v1.0\powershell.exe" -NoExit $host.ui.rawui.windowtitle = 'Windows PowerShell as SYSTEM'; $host.ui.rawui.ForegroundColor = 'Red'; $host.ui.rawui.BackgroundColor = 'Yellow'; Clear-Host
    ) else (
        Elevate.cmd "%ProgramFiles%\Sysinternals Suite\psexec.exe" -i -s -d "%SystemRoot%\system32\windowspowershell\v1.0\powershell.exe" -NoExit Set-Location -LiteralPath '%~1'; $host.ui.rawui.windowtitle = 'Windows PowerShell as SYSTEM - %~1'; $host.ui.rawui.ForegroundColor = 'Red'; $host.ui.rawui.BackgroundColor = 'Yellow'; Clear-Host
    )
) else (
    echo "Please install the Sysinternals Suite to "%ProgramFiles%\Sysinternals Suite".
    pause
)
