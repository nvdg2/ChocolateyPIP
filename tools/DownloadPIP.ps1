$release = Invoke-RestMethod -Uri 'https://api.github.com/repos/LionelJouin/PIP-tool/releases/latest'
$downloadUrl = ($release.assets | Where-Object { $_.browser_download_url.EndsWith('.msi') }).browser_download_url

if (-not [string]::IsNullOrEmpty($downloadUrl)) {
    Invoke-WebRequest -Uri $downloadUrl -OutFile 'PIP-tool.msi'
} else {
    Write-Error 'Geen asset gevonden met de gewenste extensie in de nieuwste release.'
}