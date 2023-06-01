$VSIXInstallerPath = "$Env:ProgramFiles\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\VSIXInstaller.exe"
$VSExtensionPath = "C:\Users\JohnDoe\Downloads\GitHub.Copilot.Vsix.1.84.0.1.vsix"
# /a for admin, /q for silent installation and /sp to shutdown all processes that prevent VSIXInstaller from running
$Arguments = @( "/a" , "/q", "/sp", $VSExtensionPath )
start-process -FilePath $VSIXInstallerPath -ArgumentList $Arguments -Wait
