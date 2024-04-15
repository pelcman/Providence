# Providence
Screenshot taker for work monitoring for Windows.


### Specify "output" Directory

Open Providence.ps1 in Code Editor and replace the Path in the following line with the desired Path.

> **$path = "C:\providence\SS_log\$dateFolder"**


### execution method

Register "exec1_hidden.vbs" in the task scheduler for execution at any interval.

To suppress window drawing, check the "Execute with top level privilege" checkbox and below that, also check the "Do not show" checkbox to enable it.
