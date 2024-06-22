$myDrive = (Get-CimInstance Win32_Volume | Where DeviceID -eq "\\?\Volume{245d9bef-6298-4269-af05-a614944bc3db}\").DriveLetter

for ($i = 1 ; $i -le 6 ; $i++){ #7-times cuz of 8 Cores

echo "============================================Starting scriptomatik.ps1 $($i)/$(7)============================================"

start-process powershell.exe -argument "$($myDrive)\Programme\p\yt_dlp\#script-o-matik.ps1"

sleep 6

}

