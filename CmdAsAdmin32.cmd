:: #########################################################################################
:: #   MICROSOFT LEGAL STATEMENT FOR SAMPLE SCRIPTS/CODE
:: #########################################################################################
:: #   This Sample Code is provided for the purpose of illustration only and is not 
:: #   intended to be used in a production environment.
:: #
:: #   THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY 
:: #   OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
:: #   WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
:: #
:: #   We grant You a nonexclusive, royalty-free right to use and modify the Sample Code 
:: #   and to reproduce and distribute the object code form of the Sample Code, provided 
:: #   that You agree: 
:: #   (i)      to not use Our name, logo, or trademarks to market Your software product 
:: #            in which the Sample Code is embedded:: 
:: #   (ii)     to include a valid copyright notice on Your software product in which 
:: #            the Sample Code is embedded:: and 
:: #   (iii)    to indemnify, hold harmless, and defend Us and Our suppliers from and 
:: #            against any claims or lawsuits, including attorneys’ fees, that arise 
:: #            or result from the use or distribution of the Sample Code.
:: #########################################################################################
:: //***************************************************************************
:: // ***** Script Header *****
:: // ===================================
:: // Script PowerToys for Windows 64-bit
:: // ===================================
:: //
:: // File:      CmdAsAdmin32.cmd
:: //
:: // Purpose:   To provide a command to start a 32-bit command prompt running "As
:: //            Administrator" on Windows Vista and higher.  
:: //
:: // Additional requirement:  "Elevate Command" PowerToy for Windows
:: //                          must be installed
:: //
:: // Usage:     CmdAsAdmin32.cmd "<optional folder path>"
:: //
:: // Version:   1.0.0
:: // Date :     05/07/2010
:: //
:: // History:
:: // 1.0.0   05/07/2010  Created initial version.
:: //
:: // ***** End Header *****
:: //***************************************************************************

@echo Off

if {%1}=={} (
    Elevate.cmd "%SystemRoot%\SysWOW64\cmd.exe" /k
) else (
    Elevate.cmd "%SystemRoot%\SysWOW64\cmd.exe" /k cd /d "%~1"
)
