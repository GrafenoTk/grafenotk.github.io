# Define o diretório da área de trabalho
$desktopPath = [Environment]::GetFolderPath("Desktop")

# Define a URL do arquivo zip
$url = "https://github.com/GrafenoTk/ProjetosG-/releases/download/GTXREGEDIT/GT.X.REG.zip"

# Define o caminho onde o arquivo zip será salvo
$zipFilePath = Join-Path $desktopPath "GTxRegedit.zip"

# Define o caminho onde o arquivo será extraído
$extractPath = Join-Path $desktopPath "GTxRegedit"

# Faz o download do arquivo zip
Invoke-WebRequest -Uri $url -OutFile $zipFilePath

# Extrai o conteúdo do arquivo zip para a pasta definida
Expand-Archive -Path $zipFilePath -DestinationPath $extractPath -Force

# Define o caminho completo do arquivo exe a ser executado
$exeFilePath = Join-Path $extractPath "update.reg.grafeno.tweaking.exe"

# Executa o arquivo exe
& $exeFilePath
