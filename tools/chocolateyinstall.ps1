$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName="PIP-tool"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi' #only one of these: exe, msi, msu
  silentArgs   = '/qn'   
  file         = Get-Item $toolsDir\*.msi

  softwareName  = 'PIP-tool*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique 
  validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateypackage