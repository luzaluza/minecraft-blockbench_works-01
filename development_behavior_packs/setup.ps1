param(
  # Path to Minecraft Bedrock Edition resources folder
  [string]$MojangPath
)

$mcDevBehaviorPacks = "$MojangPath\development_behavior_packs"

# Get directories under the current directory (exclude dot-prefixed ones)
Get-ChildItem -Path (Resolve-Path $PSScriptRoot) -Directory |
  Where-Object { $_.Name -notlike '.*' } |
  ForEach-Object {

    $sourceDir = $_.FullName
    $linkPath  = Join-Path $mcDevBehaviorPacks $_.Name

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
