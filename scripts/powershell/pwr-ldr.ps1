#Windows version of the ctrl-ldr script.
#this will all you to flash the board without having to have two keyboards
#and only running one command 
#Make sure you can run PS scripts by running 
#Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force 
#beforehand 
#or use companion .bat file
param(
    [Parameter(ValueFromRemainingArguments=$true)]$fileName
)
echo "Starting Flashing Procedure with File $fileName"
echo "Starting in 10 seconds (push the button)"
Start-Sleep 12
$device=.\mdloader_windows.exe --list | findstr -i COM | %{ $_.Split(' ')[2]; }
echo "Found device on $DEVICE"
.\mdloader_windows.exe --port $device --download $fileName --restart