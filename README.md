![Windows](https://img.shields.io/badge/-windows-blue) ![CMD](https://img.shields.io/badge/-cmd-blue) ![Batch Scripts](https://img.shields.io/badge/-batch%20scripts-blue)

# Rdp Stress Test

Rdp stress test repository is keeping scripts used in testing the limits of a server handling rdp connections.

## Requirements
The scripts requires [wfreerdp](https://ci.freerdp.com/job/freerdp-nightly-windows/1325/arch=win64,label=vs2013/artifact/install/bin/wfreerdp.exe) to run. After download `wfreerdp`, extract and place the `.exe` in this folder.

## Scripts details
#### kill.cmd
- force kill `wfreerdp` process
- used after finish stress test

#### show-side-by-side.vbs
- arrange windows side by side automatically
- use by other scripts (called passively)

#### test.bat
- run `wfreerdp` instances and intiate rdp connections

#### test-range.bat
- similar function to `test.bat`, but with specific user range

#### signout.bat
- run in the remote host
- signoff users based on session ID

#### create-win-users.bat
- run in the remote host
- create new users