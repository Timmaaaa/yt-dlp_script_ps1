Little scripts by me
---

This PowerShell script: 
  retrieves the drive letter for a specific volume, 
  imports a CSV file containing playlist links into an array, 
  shuffles the array to ensure random playlists are downloaded (minimizing collisions on multiple script runs), 
  and then iterates over the array to download audio files from YouTube playlists using yt-dlp, 
  ensuring each file is less than 29 minutes long and 
  saving them with metadata in a specified location.

>Uses: https://github.com/yt-dlp/yt-dlp
>
>Dependencies: ffmpeg
