:: //***************************************************************************
:: // ***** Script Header *****
:: // =======================================================
:: // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
:: // =======================================================
:: //
:: // File:      CmdAsSystem.cmd
:: //
:: // Purpose:   To provide a command to start a command prompt running under
:: //            the System context on Windows Vista.  
:: //
:: // Additional requirement:  "Elevate Command" PowerToy for Windows Vista
:: //                          must be installed and Sysinternals Suite must
:: //                          be installed in %ProgramFiles%\Sysinternals Suite
:: //
:: // Usage:     CmdAsSystem.cmd "<optional folder path>"
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
        Elevate.cmd "%ProgramFiles%\Sysinternals Suite\psexec.exe" -i -s -d "%SystemRoot%\system32\cmd.exe" /k "(color ec & title "CMD Prompt as SYSTEM")"
    ) else (
        Elevate.cmd "%ProgramFiles%\Sysinternals Suite\psexec.exe" -i -s -d "%SystemRoot%\system32\cmd.exe" /k "(cd /d "%~1" & color ec & title "CMD Prompt as SYSTEM")"
    )
) else (
    echo "Please install the Sysinternals Suite to "%ProgramFiles%\Sysinternals Suite".
    pause
)
