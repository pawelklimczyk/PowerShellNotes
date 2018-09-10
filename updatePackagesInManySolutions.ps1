<#
.SYNOPSIS
    Updates NuGet packages in solution files.
.EXAMPLE
    .\updatePackagesInManySolutins.ps1 Elasticsearch.Net 6.1.0
#>

param(
    [Parameter(Mandatory=$true)][string]$packageId,
    [Parameter(Mandatory=$true)][string]$version
)
 
Get-ChildItem ..\\..\\*.sln | %{
    Write-Host $_.fullname -ForegroundColor White
    c:\\nuget.exe restore $_.fullname
    }

Get-ChildItem ..\\..\\packages.config -Recurse `
    | Where-Object {$_ | Select-String -Pattern $packageId} `
    | %{c:\\nuget.exe update -Id $packageId $_.FullName -Version $version }