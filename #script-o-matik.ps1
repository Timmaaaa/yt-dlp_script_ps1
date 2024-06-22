$myDrive = (Get-CimInstance Win32_Volume | Where DeviceID -eq "\\?\Volume{245d9bef-6298-4269-af05-a614944bc3db}\").DriveLetter

#take csv n put in variable. Turns out as array
$MyList= Import-Csv "$($myDrive)\Programme\p\pls.csv"

echo ""

#Shuffle your array content but keep them in the same array
$MyList = $MyList | Sort-Object {Get-Random}

cd "$($myDrive)\Programme\p\yt_dlp\"

$MyList | ForEach-Object {

    echo ""
    echo "============================================ Starte $($_.Playlistname) ========================================="

    sleep 1

    #Keine Videos länger als 29 Minuten (in Sekunden 1740)
    .\yt-dlp.exe --extract-audio --audio-format flac --audio-quality 0 --ffmpeg-location `
    "$($myDrive)\Programme\p\ffmpeg\ffmpeg-5.1-full_build\bin" --match-filter "duration <= 1640" `
    --output "$($myDrive)/Musik/Playlists_neu/%(playlist)s/%(title)s.%(ext)s" `
    --retries 13 --download-archive "$($myDrive)\Programme\p\_HQ_NeuDownloads.txt" `
    --ignore-errors --fragment-retries 13 --no-overwrites `
    --add-metadata --playlist-random $($_.link)


    echo "============================================= $($_.Playlistname) Ende ========================================="

}

#--age-limit 18