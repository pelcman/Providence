# Providence
Screenshot taker for work monitoring for Windows.


### Specify "output" Directory

Open output_path.txt in Text Editor and replace the Path in the following line with the desired Path.

```txt
C:\providence\SS_log
```

The following line in Providence.ps1 will properly register that path as the base directory and create subdirectories for each date within it.

```ps1
$baseOutput = Get-Content "output_path.txt" -Raw
$path = "$baseOutput\$dateFolder" 
```

### execution method

Register "exec1_hidden.vbs" in the task scheduler for execution at any interval.

To suppress window drawing, check the "Execute with top level privilege" checkbox and below that, also check the "Do not show" checkbox to enable it.


### known defects

Depending on the execution environment, when exec1_hidden.vbs is executed, it may fail to reference the .bat file if the path is relative.

```vbs
WshShell.Run ".\exec2_core.bat", 0, True
```