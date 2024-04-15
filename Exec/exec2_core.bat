
@echo off
mode con: cols=1 lines=1
start /b /min powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "%~dp0Providence.ps1"
exit