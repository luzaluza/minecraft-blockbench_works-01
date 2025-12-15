# Path to Minecraft Bedrock Edition development_resource_packs
$mcDevResourcePacks = "<SET YOUR PATH>\games\com.mojang\development_resource_packs"

# Get directories under the current directory (exclude dot-prefixed ones)
Get-ChildItem -Directory |
  Where-Object { $_.Name -notlike '.*' } |
  ForEach-Object {

    $sourceDir = $_.FullName
    $linkPath  = Join-Path $mcDevResourcePacks $_.Name

    # Skip if the target path already exists
    if (Test-Path $linkPath) {
        Write-Host "Skipped (already exists): $linkPath"
        return
    }

    # Create symbolic link
    New-Item -ItemType SymbolicLink `
             -Path $linkPath `
             -Target $sourceDir | Out-Null

    Write-Host "Link created: $linkPath -> $sourceDir"
}
