net stop bits
sc config bits start= auto
net start bits
$webclient = New-Object System.Net.WebClient
$url = "https://github.com/GrafenoTk/ProjetosG-/releases/download/GrafenoTw-Emulator/DownloadGrafenoGaGa.bat"
$filepath = "C:\Grafeno"
$directory = Split-Path $filepath -Parent

# Verifica se o diretório existe e, se não existir, cria ele
if (!(Test-Path -Path $directory)) {
    New-Item -ItemType Directory -Path $directory | Out-Null
}

$webclient.DownloadFile($url, $filepath)
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $filepath"
exit
