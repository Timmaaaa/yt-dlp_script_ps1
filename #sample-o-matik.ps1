#take csv n put in variable. Turns out as array
$MyList= Import-Csv "C:\Users\-\p\040623SamplesToDownloads.csv" 

#Shuffle your array content but keep them in the same array
$MyList = $MyList 

$MyList | ForEach-Object {

echo "============================================Starting $($_.link)============================================"

sleep 1

#Keine Videos länger als 29 Minuten (in Sekunden 1740)
.\yt-dlp --audio-format wav --ffmpeg-location `
"C:\Users\-\p\ffmpeg\ffmpeg-5.1-full_build\bin" `
--output "D:/Musik/Samples/%(title)s.%(ext)s" `
--retries 13 --buffer-size 32K `
--ignore-errors --fragment-retries 13 `
--add-metadata $($_.link) --cookies-from-browser firefox #!

echo "=============================================$($_.link) finished============================================"

}