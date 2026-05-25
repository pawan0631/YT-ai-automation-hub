param(
    [Parameter(Mandatory = $true)]
    [string]$Topic,

    [Parameter(Mandatory = $true)]
    [ValidateSet("Cybersecurity", "Business")]
    [string]$Channel,

    [string]$Root = "C:\Users\paawa\Videos\YouTube-Production"
)

$ErrorActionPreference = "Stop"

function New-SafeName {
    param([string]$Text)
    $safe = $Text -replace '[\\/:*?"<>|]', ''
    $safe = $safe -replace '\s+', '-'
    return $safe.Trim('-').ToLowerInvariant()
}

$date = Get-Date -Format "yyyy-MM-dd"
$slug = New-SafeName $Topic
$projectName = "$date-$Channel-$slug"
$projectPath = Join-Path $Root $projectName

$folders = @(
    "01-topic",
    "02-research\sources",
    "02-research\zotero-notes",
    "03-scripts\english",
    "03-scripts\hindi",
    "04-voiceover\english",
    "04-voiceover\hindi",
    "05-visuals\moodboard",
    "05-visuals\ai-generated",
    "05-visuals\stock-broll",
    "05-visuals\graphics",
    "06-editing\project-files",
    "06-editing\proxies",
    "06-editing\exports",
    "07-shorts\english",
    "07-shorts\hindi",
    "08-thumbnail",
    "09-upload",
    "10-analytics"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path (Join-Path $projectPath $folder) -Force | Out-Null
}

$brief = @"
# Episode Brief

Topic: $Topic
Channel: $Channel
Created: $date

## Core Question


## Viewer Promise


## Research Sources

| Source | Link | Key Claim | Confidence |
|---|---|---|---|

## Validation Status

- [ ] Topic approved
- [ ] Research approved
- [ ] English script approved
- [ ] Hindi adaptation approved
- [ ] Voice approved
- [ ] Visual style approved
- [ ] Rough cut approved
- [ ] Final cut approved
- [ ] Upload metadata approved

## Notes


"@

$briefPath = Join-Path $projectPath "01-topic\episode-brief.md"
Set-Content -LiteralPath $briefPath -Value $brief -Encoding UTF8

$gatesSource = Join-Path (Split-Path $PSScriptRoot -Parent) "templates\validation-gates.md"
if (Test-Path -LiteralPath $gatesSource) {
    Copy-Item -LiteralPath $gatesSource -Destination (Join-Path $projectPath "01-topic\validation-gates.md") -Force
}

$readme = @"
# $Topic

Channel: $Channel

Use this folder for all local production assets. Do not commit large media files to GitHub.

Start here:

1. Open `01-topic/episode-brief.md`.
2. Complete the topic and viewer promise.
3. Run the research workflow manually with Gemini/Perplexity/Zotero.
4. Validate each stage in `01-topic/validation-gates.md`.
"@

Set-Content -LiteralPath (Join-Path $projectPath "README.md") -Value $readme -Encoding UTF8

Write-Output "Created episode project:"
Write-Output $projectPath
