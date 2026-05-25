param(
    [Parameter(Mandatory = $true)]
    [string]$InputVideo,

    [string]$OutputAudio
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $InputVideo)) {
    throw "Input video not found: $InputVideo"
}

if (-not $OutputAudio) {
    $dir = Split-Path $InputVideo -Parent
    $name = [IO.Path]::GetFileNameWithoutExtension($InputVideo)
    $OutputAudio = Join-Path $dir "$name.audio.wav"
}

ffmpeg -y -i $InputVideo -vn -acodec pcm_s16le -ar 48000 -ac 2 $OutputAudio

Write-Output "Audio extracted:"
Write-Output $OutputAudio
