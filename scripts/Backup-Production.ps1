param(
    [string]$Source = "C:\Users\paawa\Videos\YouTube-Production",
    [string]$Remote = "AI_Repo_DB:YouTube-Production"
)

$ErrorActionPreference = "Stop"

$rclone = Get-Command rclone -ErrorAction SilentlyContinue
if (-not $rclone) {
    $rclone = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter rclone.exe -ErrorAction SilentlyContinue | Select-Object -First 1
}

if (-not $rclone) {
    throw "rclone.exe not found. Install or repair rclone first."
}

if (-not (Test-Path -LiteralPath $Source)) {
    throw "Source folder does not exist: $Source"
}

& $rclone.Source copy $Source $Remote `
    --exclude ".git/**" `
    --exclude "*.tmp" `
    --exclude "CacheClip/**" `
    --exclude "Render Cache/**" `
    --progress

Write-Output "Backup complete: $Source -> $Remote"
