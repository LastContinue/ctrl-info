$desktop = [System.Environment]::GetFolderPath('Desktop')
$newDir = $desktop+'\ctrl'
New-Item -Path $newDir -ItemType Directory -Force

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
Invoke-WebRequest -UseBasicParsing -Uri https://github.com/Massdrop/mdloader/releases/download/1.0.4/mdloader_windows.exe -OutFile $newdir"\mdloader_windows.exe"
Invoke-WebRequest -UseBasicParsing -Uri https://github.com/Massdrop/mdloader/releases/download/1.0.4/applet-flash-samd51j18a.bin -OutFile $newdir"\applet-flash-samd51j18a.bin"
Invoke-WebRequest -UseBasicParsing -Uri https://raw.githubusercontent.com/LastContinue/ctrl-info/master/scripts/powershell/pwr-ldr.ps1 -OutFile $newdir"\pwr-ldr.ps1"

$w = New-Object -ComObject WScript.Shell
$link = $w.CreateShortcut("$desktop\pwr-ldr.lnk")
$link.TargetPath = "powershell.exe"
$link.arguments = '-ExecutionPolicy Bypass -NoExit -File '+"`"$newDir\pwr-ldr.ps1`""
$link.WorkingDirectory = $newDir
$link.save()
