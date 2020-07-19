#Windows version of the ctrl-ldr script.
#Updated to target mdloader 1.0.4
#You may get permission prompts if this is the first time you've ran this
#If you keep getting these notifications, try running
#Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
#in Powershell before running this.
param(
    [Parameter(ValueFromRemainingArguments=$true)]$fileName
)
echo "Starting Flashing Procedure with File $fileName"
.\mdloader_windows.exe --first --download $fileName --restart
