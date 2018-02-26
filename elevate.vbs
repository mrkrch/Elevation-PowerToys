' //***************************************************************************
' // ***** Script Header *****
' // =======================================================
' // Elevation PowerToys for Windows Vista v1.1 (04/29/2008)
' // =======================================================
' //
' // File:      Elevate.vbs
' //
' // Additional files required:  Elevate.cmd
' //
' // Purpose:   To provide a command line method of launching applications that
' //            prompt for elevation (Run as Administrator) on Windows Vista.
' //
' // Usage:     (Not used directly.  Launched from Elevate.cmd.)
' //
' // Version:   1.0.1ab
' // Date :     01/28/2009
' //
' // History:
' // 1.0.0   01/02/2007  Created initial version.
' // 1.0.1   01/03/2007  Added detailed usage output.
' // 1.0.1a  01/20/2009  Special version to work around Windows 7 Beta bug in
' //                     ShellExecute where vArguments is not passed when stored
' //                     in a variable.  Used VBScript Execute statement to pass
' //                     all ShellExecute paramaters as literal strings.
' // 1.0.1b  01/28/2009  New special version to work around Windows 7 Beta bug in
' //                     ShellExecute where vArguments is not passed when stored
' //                     in a variable.  Could not predict incoming command
' //                     quoting in 1.0.1a.  Using a new workaround - appending
' //                     a blank string to the strArguments variable in the
' //                     ShellExecute parameter list (i.e. passing an expression
' //                     as vArguments).
' //
' // ***** End Header *****
' //***************************************************************************


Set objShell = CreateObject("Shell.Application")
Set objWshShell = WScript.CreateObject("WScript.Shell")
Set objWshProcessEnv = objWshShell.Environment("PROCESS")

' Get raw command line agruments and first argument from Elevate.cmd passed
' in through environment variables.
strCommandLine = objWshProcessEnv("ELEVATE_CMDLINE")
strApplication = objWshProcessEnv("ELEVATE_APP")
strArguments = Trim(Right(strCommandLine, (Len(strCommandLine) - Len(strApplication))))

If (WScript.Arguments.Count >= 1) Then
    strFlag = WScript.Arguments(0)
    If (strFlag = "") OR (strFlag="help") OR (strFlag="/h") OR (strFlag="\h") OR (strFlag="-h") _
        OR (strFlag = "\?") OR (strFlag = "/?") OR (strFlag = "-?") OR (strFlag="h") _
        OR (strFlag = "?") Then
        DisplayUsage
        WScript.Quit
    Else
        objShell.ShellExecute strApplication, "" & strArguments, "", "runas"
    End If
Else
    DisplayUsage
    WScript.Quit
End If


Sub DisplayUsage

    WScript.Echo "Elevate - Elevation Command Line Tool for Windows Vista" & vbCrLf & _
                 "" & vbCrLf & _
                 "Purpose:" & vbCrLf & _
                 "--------" & vbCrLf & _
                 "To launch applications that prompt for elevation (i.e. Run as Administrator)" & vbCrLf & _
                 "from the command line, a script, or the Run box." & vbCrLf & _
                 "" & vbCrLf & _
                 "Usage:   " & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate application <arguments>" & vbCrLf & _
                 "" & vbCrLf & _
                 "" & vbCrLf & _
                 "Sample usage:" & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate notepad ""C:\Windows\win.ini""" & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate cmd /k cd ""C:\Program Files""" & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate powershell -NoExit -Command Set-Location 'C:\Windows'" & vbCrLf & _
                 "" & vbCrLf & _
                 "" & vbCrLf & _
                 "Usage with scripts: When using the elevate command with scripts such as" & vbCrLf & _
                 "Windows Script Host or Windows PowerShell scripts, you should specify" & vbCrLf & _
                 "the script host executable (i.e., wscript, cscript, powershell) as the " & vbCrLf & _
                 "application." & vbCrLf & _
                 "" & vbCrLf & _
                 "Sample usage with scripts:" & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate wscript ""C:\windows\system32\slmgr.vbs"" –dli" & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate powershell -NoExit -Command & 'C:\Temp\Test.ps1'" & vbCrLf & _
                 "" & vbCrLf & _
                 "" & vbCrLf & _
                 "The elevate command consists of the following files:" & vbCrLf & _
                 "" & vbCrLf & _
                 "    elevate.cmd" & vbCrLf & _
                 "    elevate.vbs" & vbCrLf

End Sub
