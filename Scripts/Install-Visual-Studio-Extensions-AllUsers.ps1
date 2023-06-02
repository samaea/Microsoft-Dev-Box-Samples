param(
     [Parameter()]
     [string]$Path
 )

# Loop through all files in a directory that has the extension vsix
function Get-VsixFiles {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    Get-ChildItem -Path $Path -Filter *.vsix -Recurse
}

# Install all vsix files that were returned from the Get-VsixFiles function
function Install-VsixFiles {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    $vsixFiles = Get-VsixFiles -Path $Path

    foreach ($vsixFile in $vsixFiles) {
        Write-Host "Installing $vsixFile"
        # /a for admin, /q for silent installation and /sp to shutdown all processes that prevent VSIXInstaller from running
        $Arguments = @( "/a" , "/q", "/sp", $VSExtensionPath )
        start-process -FilePath $vsixFile -ArgumentList $Arguments -Wait
        
    }
}

Install-VsixFiles -Path $Path
