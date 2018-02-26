#########################################################################################
#   MICROSOFT LEGAL STATEMENT FOR SAMPLE SCRIPTS/CODE
#########################################################################################
#   This Sample Code is provided for the purpose of illustration only and is not 
#   intended to be used in a production environment.
#
#   THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY 
#   OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
#   WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
#
#   We grant You a nonexclusive, royalty-free right to use and modify the Sample Code 
#   and to reproduce and distribute the object code form of the Sample Code, provided 
#   that You agree: 
#   (i)      to not use Our name, logo, or trademarks to market Your software product 
#            in which the Sample Code is embedded; 
#   (ii)     to include a valid copyright notice on Your software product in which 
#            the Sample Code is embedded; and 
#   (iii)    to indemnify, hold harmless, and defend Us and Our suppliers from and 
#            against any claims or lawsuits, including attorneys’ fees, that arise 
#            or result from the use or distribution of the Sample Code.
#########################################################################################
# //***************************************************************************
# // ===============================
# // Elevation PowerToys for Windows 
# // ===============================
# //
# // Sysinternals Suite INF Installer Creation Script
# //
# // File:      New-SysinternalsSuiteInstaller.ps1
# //
# // Purpose:   PowerShell Script to generate an INF file that installs the 
# //            Sysinternals Suite.
# //
# // Version:   1.0.1
# //
# // Revisions:
# // ----------
# // 1.0.0   10/27/2010   Created script.
# // 1.0.1   06/20/2012   Patched script to work with current webpage
# //***************************************************************************

$scriptVersion = "1.0.1"


function Extract-Zip
{
	param([string]$zipfilename, [string] $destination)

	if(test-path($zipfilename))
	{	
		$shellApplication = new-object -com shell.application
		$zipPackage = $shellApplication.NameSpace($zipfilename)
		$destinationFolder = $shellApplication.NameSpace($destination)
		$destinationFolder.CopyHere($zipPackage.Items())
	}
}


$invocation = (Get-Variable MyInvocation -Scope 0).Value
$scriptPath = Split-Path $Invocation.MyCommand.Path

$uriZipFile = "http://download.sysinternals.com/files/SysinternalsSuite.zip"
$uriWebPage = "http://technet.microsoft.com/en-us/sysinternals/bb842062.aspx"
$regexPattern = "<p>Updated: (.+?)<\/p>"
$userAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)"


# Template content of INF file
$infContent = @'
; #########################################################################################
; #   MICROSOFT LEGAL STATEMENT FOR SAMPLE SCRIPTS/CODE
; #########################################################################################
; #   This Sample Code is provided for the purpose of illustration only and is not 
; #   intended to be used in a production environment.
; #
; #   THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY 
; #   OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
; #   WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
; #
; #   We grant You a nonexclusive, royalty-free right to use and modify the Sample Code 
; #   and to reproduce and distribute the object code form of the Sample Code, provided 
; #   that You agree: 
; #   (i)      to not use Our name, logo, or trademarks to market Your software product 
; #            in which the Sample Code is embedded; 
; #   (ii)     to include a valid copyright notice on Your software product in which 
; #            the Sample Code is embedded; and 
; #   (iii)    to indemnify, hold harmless, and defend Us and Our suppliers from and 
; #            against any claims or lawsuits, including attorneys’ fees, that arise 
; #            or result from the use or distribution of the Sample Code.
; #########################################################################################
; //***************************************************************************
; // ===============================
; // Elevation PowerToys for Windows 
; // ===============================
; //
; // Sysinternals Suite INF Installer
; //
; // File:      Install_SysinternalsSuite.inf
; //
; // Purpose:   Installs the Sysinternals Suite
; //
; // Updated:   <Updated>
; //
; // INF File Generation Script version:  <Scriptversion>
; //
; //***************************************************************************


[Version]
Signature="$Windows NT$"

[SysinternalsSuiteInstall]
CopyFiles = SysinternalsSuite.Files.Inf
CopyFiles = SysinternalsSuite.Files.ProgramFiles
AddReg    = SysinternalsSuite.AddReg
UpdateInis = SysinternalsSuite.Links

[DefaultInstall]
CopyFiles = SysinternalsSuite.Files.Inf
CopyFiles = SysinternalsSuite.Files.ProgramFiles
AddReg    = SysinternalsSuite.AddReg
UpdateInis = SysinternalsSuite.Links


[DefaultUnInstall]
DelFiles = SysinternalsSuite.Files.Inf
DelFiles = SysinternalsSuite.Files.ProgramFiles
DelReg   = SysinternalsSuite.DelReg
AddReg   = SysinternalsSuite.Once.UnInst.Reg
UpdateInis = SysinternalsSuite.Links.Remove

[SourceDisksNames]
55="Windows Sysinternals Suite","",1

[SourceDisksFiles]
Install_SysinternalsSuite.inf=55

[DestinationDirs]
SysinternalsSuite.Files.Inf = 17
SysinternalsSuite.Files.ProgramFiles = 16422,Sysinternals Suite
SysinternalsSuite.Files.ProgramFiles.ShellRunas = 16422,Sysinternals Suite

[SysinternalsSuite.Files.Inf]
Install_SysinternalsSuite.inf

[SysinternalsSuite.Files.ProgramFiles]
<ProgramFiles>

[SysinternalsSuite.Once.UnInst.Reg]
HKLM,Software\Microsoft\Windows\CurrentVersion\RunOnce\Setup,SysinternalsSuite,,"%11%\cmd.exe /c rd /s /q ""%16422%\Sysinternals Suite"""

[SysinternalsSuite.AddReg]
HKLM,%UDHERE%,DisplayName,,"%DisplayName%"
HKLM,%UDHERE%,DisplayVersion,,"%DisplayVersion%"
HKLM,%UDHERE%,UninstallString,,"rundll32.exe syssetup.dll,SetupInfObjectInstallAction DefaultUninstall 132 %17%\Install_SysinternalsSuite.inf"

[SysinternalsSuite.DelReg]
HKLM,%UDHERE%

[SysinternalsSuite.Links]
setup.ini, progman.groups,,""group1="%16407%\%SysinternalsSuiteGroup%\"""
setup.ini, group1,,"""%SysinternalsSuiteCmdPrompt%"",""""""%11%\cmd.exe"""" /k cd /d """"%16422%\%SysinternalsSuiteGroup%"""""",,,,""%16422%\%SysinternalsSuiteGroup%"",""%SysinternalsSuiteCmdPrompt%"""
setup.ini, group1,,"""%SysinternalsSuiteURL%"",""""""%16422%\Internet Explorer\iexplore.exe"""" """"http://www.microsoft.com/technet/sysinternals/utilities/sysinternalssuite.mspx"""""",""%16422%\Internet Explorer\iexplore.exe"",1,,""%HOMEDRIVE%%HOMEPATH%"",""%SysinternalsSuiteURL%"""
<AddProgramShortcuts>

setup.ini, progman.groups,,""group2="%16407%\%SysinternalsSuiteGroup%\%SysinternalsSuiteDocs%\"""
<AddHelpShortcuts>


[SysinternalsSuite.Links.Remove]
setup.ini, progman.groups,,""group1="%16407%\%SysinternalsSuiteGroup%"""
setup.ini, group1,,"""%SysinternalsSuiteCmdPrompt%"""
setup.ini, group1,,"""%SysinternalsSuiteURL%""
<RemoveProgramShortcuts>

setup.ini, progman.groups,,""group2="%16407%\%SysinternalsSuiteGroup%\%SysinternalsSuiteDocs%\"""
<RemoveHelpShortcuts>


[Strings]
DisplayName = "Sysinternals Suite (Uninstall only)"
DisplayVersion = "<Updated>"

SysinternalsSuiteGroup = "Sysinternals Suite"
SysinternalsSuiteCmdPrompt = "Sysinternals Suite Command Prompt"
SysinternalsSuiteURL = "Sysinternals Suite Web Page"
<ProgramStrings>

SysinternalsSuiteDocs = "Documentation"
<HelpStrings>

UDHERE = "Software\Microsoft\Windows\CurrentVersion\Uninstall\SysinternalsSuite"
'@


# Hash table for graphical programs that should have a Start Menu shortcut
# Entries are "<executable name>" = "<start menu shortcut name>"
$hashStartMenuPrograms = @{
    "AccessEnum.exe" = "AccessEnum";
    "AdExplorer.exe" = "Active Directory Explorer";
    "Autologon.exe" = "Autologon for Windows";
    "ADInsight.exe" = "Insight for Active Directory";
    "Autoruns.exe" = "AutoRuns for Windows";
    "Bginfo.exe" = "Bginfo";
    "Dbgview.exe" = "DebugView for Windows";
    "Diskmon.exe" = "DiskMon for Windows";
    "DiskView.exe" = "DiskView";
    "LoadOrd.exe" = "LoadOrder";
    "procexp.exe" = "Process Explorer";
    "Procmon.exe" = "Process Monitor";
    "RamMap.exe" = "RamMap";
    "RootkitRevealer.exe" = "RootkitRevealer";
    "Tcpview.exe" = "TCPView for Windows";
    "VMMap.exe" = "VMMap";
    "Winobj.exe" = "WinObj";
    "ZoomIt.exe" = "ZoomIt"
}

# Hash table for help files that should have a Start Menu shortcut
# Entries are "<help file name>" = "<start menu shortcut name>"
$hashStartMenuHelp = @{
    "PsTools.chm" = "PsTools Help";
    "AdExplorer.chm" = "Active Directory Explorer Help";
    "ADInsight.chm" = "Insight for Active Directory Help";
    "Autoruns.chm" = "AutoRuns for Windows Help";
    "Dbgview.chm" = "DebugView for Windows Help";
    "Disk2vhd.chm" = "Disk2vhd Help";
    "Diskmon.hlp" = "DiskMon for Windows Help";
    "Procexp.chm" = "Process Explorer Help";
    "procmon.chm" = "Process Monitor Help";
    "RootkitRevealer.chm" = "RootkitRevealer Help";
    "Tcpview.chm" = "TCPView for Windows Help";
    "VMMap.chm" = "VMMap Help";
    "Winobj.hlp" = "WinObj Help";
}

$wc = new-object System.Net.WebClient 
$wc.Headers.Add("user-agent", $userAgent)

write-host "Downloading web page `"$($uriWebPage)`""
$webPage = $wc.DownloadString($uriWebPage)

$updatedDateString = (select-string -pattern $regexPattern -InputObject $webPage | Select -Expand Matches | Foreach { $_.Groups[1] }).Value
write-host "Suite Updated: $($updatedDateString)"

$downloadFolder = "$($scriptPath)\$($updatedDateString)"
$extractFolder = "$($downloadFolder)\Extracted"
$filename = "$($downloadFolder)\SysinternalsSuite.zip"

if ((Test-Path $downloadFolder) -eq $false)
{
    write-host "Creating download folder `"$($downloadFolder)`""
    New-Item -path "$($scriptPath)\" -name $updatedDateString -type directory > $null
}

if ((Test-Path $extractFolder) -eq $false)
{
    write-host "Creating zip extraction folder `"$($extractFolder)`""
    New-Item -path "$($downloadFolder)\" -name "Extracted" -type directory > $null
}
else
{
    write-host "Deleting and recreating zip extraction folder `"$($extractFolder)`""
    Remove-Item -path $extractFolder -recurse
    New-Item -path "$($downloadFolder)\" -name "Extracted" -type directory > $null
}

write-host "Downloading Sysinternal Suite Zip file `"$($uriZipFile)`""
$wc.DownloadFile($uriZipFile, $filename)

write-host "Extracting Sysinternal Suite Zip file content"
extract-zip $filename $extractFolder

write-host "Creating INF installer `"$($extractFolder)\Install_SysinternalsSuite.inf`""
$infContent = $infContent | %{$_.replace("<Updated>", $updatedDateString)}

$extractedFiles = Get-ChildItem "$($extractFolder)\*.*"

write-host " -- Update script version"
$infContent = $infContent | %{$_.replace("<Scriptversion>", $scriptVersion)}

write-host " -- Update file list"
[string] $fileList = ""
foreach ($file in $extractedFiles)
{
    $fileList = $fileList + $file.Name + "`n"
}
$infContent = $infContent | %{$_.replace("<ProgramFiles>", $fileList)}


write-host " -- Update entries related to program shortcuts"
[string] $AddProgramShortcuts = ""
[string] $RemoveProgramShortcuts = ""
[string] $ProgramStrings = ""
foreach ($programName in $hashStartMenuPrograms.Keys)
{
    if (Test-Path "$($extractFolder)\$($programName)")
    {
        [string]$fileExt = (Get-Item "$($extractFolder)\$($programName)").extension
        [string]$fileBaseName = $programName -replace($fileExt ,"")

        $AddLine = 'setup.ini, group1,,"""' + "%$($fileBaseName)Desc%" + '"",""""""%16422%\%SysinternalsSuiteGroup%\' + $programName + '"""""",,,,""""%16422%\%SysinternalsSuiteGroup%"""",""' + "%$($fileBaseName)Desc%" + '"""'
        $AddProgramShortcuts = $AddProgramShortcuts + $AddLine + "`n"

        $RemoveLine = 'setup.ini, group1,,"""' + "%$($fileBaseName)Desc%" + '""'
        $RemoveProgramShortcuts = $RemoveProgramShortcuts + $RemoveLine + "`n"

        $StringsLine = "$($fileBaseName)Desc = " + '"' + "$($hashStartMenuPrograms[$programName])" + '"'
        $ProgramStrings = $ProgramStrings + $StringsLine + "`n"
    }
    else
    {
        write-host "$($programName) not found"
    }
}
$infContent = $infContent | %{$_.replace("<AddProgramShortcuts>", $AddProgramShortcuts)}
$infContent = $infContent | %{$_.replace("<RemoveProgramShortcuts>", $RemoveProgramShortcuts)}
$infContent = $infContent | %{$_.replace("<ProgramStrings>", $ProgramStrings)}


write-host " -- Update entries related to help file shortcuts"
[string] $AddHelpShortcuts = ""
[string] $RemoveHelpShortcuts = ""
[string] $HelpStrings = ""
foreach ($helpName in $hashStartMenuHelp.Keys)
{
    if (Test-Path "$($extractFolder)\$($helpName)")
    {
        [string]$fileExt = (Get-Item "$($extractFolder)\$($helpName)").extension
        [string]$fileBaseName = $helpName -replace($fileExt ,"")
        #$fileBaseName

        $AddLine = 'setup.ini, group2,,"""' + "%$($fileBaseName)Desc%" + '"",""""""%16422%\%SysinternalsSuiteGroup%\' + $helpName + '"""""""'
        $AddHelpShortcuts = $AddHelpShortcuts + $AddLine + "`n"

        $RemoveLine = 'setup.ini, group2,,"""' + "%$($fileBaseName)Desc%" + '""'
        $RemoveHelpShortcuts = $RemoveHelpShortcuts + $RemoveLine + "`n"

        $StringsLine = "$($fileBaseName)Desc = " + '"' + "$($hashStartMenuHelp[$helpName])" + '"'
        $HelpStrings = $HelpStrings + $StringsLine + "`n"
    }
    else
    {
        write-host "$($helpName) not found"
    }
}
$infContent = $infContent | %{$_.replace("<AddHelpShortcuts>", $AddHelpShortcuts)}
$infContent = $infContent | %{$_.replace("<RemoveHelpShortcuts>", $RemoveHelpShortcuts)}
$infContent = $infContent | %{$_.replace("<HelpStrings>", $HelpStrings)}

write-host " -- Saving file to disk"
$infContent | Set-Content "$($extractFolder)\Install_SysinternalsSuite.inf"

write-host ""

