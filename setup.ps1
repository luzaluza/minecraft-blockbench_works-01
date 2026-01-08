# Path to Minecraft Bedrock Edition resources folder
$mojangPath = "<SET YOUR PATH>\games\com.mojang"

# development_resource_packs
$setupForDevResPacks = Join-Path $PSScriptRoot "development_resource_packs\setup.ps1"
& $setupForDevResPacks -MojangPath $mojangPath
