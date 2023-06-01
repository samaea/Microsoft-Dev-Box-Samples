# NOTE:- The below script requires PowerShell to be running as an administrator
# This is just a sample. As such, do not have a dependency on the below URL (as it can change without notice),
# but you can save a copy in a location accessible for the VM images you are building.

$NugetConfigUrl = "https://raw.githubusercontent.com/samaea/Microsoft-Dev-Box-Samples/main/Scripts/assets/nuget-all-users.Config"
$Path = "${Env:ProgramFiles(x86)}\NuGet\Config\nuget-all-users.Config"
Invoke-WebRequest -URI $NugetConfigUrl -OutFile $Path
dotnet nuget add source "https://nuget.contoso.com/Owner/index.json" --name "Contoso Nuget" --configfile $Path
