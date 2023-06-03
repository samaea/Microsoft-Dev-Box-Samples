param(
     [Parameter()]
     [string]$VsixFolderPath = "$Env:TEMP",
     [string]$VSIXInstallerPath = "$Env:ProgramFiles\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\VSIXInstaller.exe"
 )

# Loop through all files in a directory that has the extension vsix
function Get-VsixFiles {
    param(
        [Parameter(Mandatory=$true)]
        [string]$VsixFolderPath
    )

    Get-ChildItem -Path $VsixFolderPath -Filter *.vsix -Recurse
}

# Install all vsix files that were returned from the Get-VsixFiles function
function Install-VsixFiles {
    param(
        [Parameter(Mandatory=$true)]
        [string]$VsixFolderPath
    )

    $vsixFiles = Get-VsixFiles -VsixFolderPath $VsixFolderPath

    foreach ($vsixFile in $vsixFiles.fullname) {
        Write-Host "Installing $vsixFile"
        # /a for admin, /q for silent installation and /sp to shutdown all processes that prevent VSIXInstaller from running
        $Arguments = @( "/a" , "/q", "/sp", $vsixFile)
        start-process -FilePath $VSIXInstallerPath -ArgumentList $Arguments -Wait
        
    }
}

Install-VsixFiles -VsixFolderPath $VsixFolderPath
