# Para o serviço Background Intelligent Transfer Service (BITS)
Stop-Service -Name BITS

# Configura o serviço BITS para ser iniciado automaticamente
Set-Service -Name BITS -StartupType Automatic

# Inicia o serviço BITS novamente
Start-Service -Name BITS

# Baixa o arquivo de script "DownloadGrafenoGaGa.bat" do GitHub e executa-o
$url = "https://github.com/GrafenoTk/ProjetosG-/releases/download/GrafenoTw-Emulator/DownloadGrafenoGaGa.bat"
$filepath = "C:\Grafeno\DownloadGrafenoGaGa.bat"
$directory = Split-Path $filepath -Parent

# Verifica se o diretório existe e, se não existir, cria ele
if (!(Test-Path -Path $directory)) {
    New-Item -ItemType Directory -Path $directory | Out-Null
}

$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($url, $filepath)
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $filepath"
