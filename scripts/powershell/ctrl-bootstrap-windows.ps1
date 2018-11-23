$desktop = [System.Environment]::GetFolderPath('Desktop')
$newDir = $desktop+'\ctrl'
New-Item -Path $newDir -ItemType Directory -Force

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'
Invoke-WebRequest -UseBasicParsing -Uri https://github.com/Massdrop/mdloader/releases/download/0.0.1/mdloader_windows.exe -OutFile $newdir"\mdloader_windows.exe"
Invoke-WebRequest -UseBasicParsing -Uri https://github.com/Massdrop/mdloader/releases/download/0.0.1/applet-flash-samd51j18a.bin -OutFile $newdir"\applet-flash-samd51j18a.bin"
Invoke-WebRequest -UseBasicParsing -Uri https://gist.githubusercontent.com/LastContinue/5f8fb23b41b1611e49d4aced8a44101e/raw/986083d1020f8b1d8ac50e6e822bb0872f96734e/pwr-ldr.ps1 -OutFile $newdir"\pwr-ldr.ps1"

$w = New-Object -ComObject WScript.Shell
$link = $w.CreateShortcut("$desktop\pwr-ldr.lnk")
$link.TargetPath = "powershell.exe"
$link.arguments = '-ExecutionPolicy Bypass -NoExit -File '+"`"$newDir\pwr-ldr.ps1`""
$link.WorkingDirectory = $newDir
$link.save()
