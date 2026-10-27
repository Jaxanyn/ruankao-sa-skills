param()

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot "skills"
$mirror = Join-Path $repoRoot "plugins\rk\skills"

function Get-SkillName([string]$Path) {
    $content = Get-Content -LiteralPath $Path -Raw
    $match = [regex]::Match($content, '(?ms)^---\s*\r?\nname:\s*([^\r\n]+)')
    if (-not $match.Success) { throw "Missing frontmatter name: $Path" }
    return $match.Groups[1].Value.Trim().Trim('"')
}

if (-not (Test-Path -LiteralPath $source -PathType Container)) { throw "Missing skills directory: $source" }
if (-not (Test-Path -LiteralPath $mirror -PathType Container)) { throw "Missing plugin skills directory: $mirror" }

$skills = Get-ChildItem -LiteralPath $source -Directory | Sort-Object Name
foreach ($skill in $skills) {
    $skillFile = Join-Path $skill.FullName "SKILL.md"
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) { throw "Missing SKILL.md: $skillFile" }
    if ((Get-SkillName $skillFile) -ne $skill.Name) { throw "Frontmatter name does not match folder: $skillFile" }

    $content = Get-Content -LiteralPath $skillFile -Raw
    if ($content -match '(?im)([A-Z]:\\|/Users/|/home/|/root/)') {
        throw "Public skill contains a machine-specific absolute path: $skillFile"
    }

    $references = [regex]::Matches($content, '\]\((references/[^)]+)\)')
    foreach ($reference in $references) {
        $target = Join-Path $skill.FullName $reference.Groups[1].Value.Replace('/', '\\')
        if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
            throw "Missing reference '$($reference.Groups[1].Value)' in $skillFile"
        }
    }

    $mirrorSkill = Join-Path $mirror $skill.Name
    if (-not (Test-Path -LiteralPath $mirrorSkill -PathType Container)) { throw "Missing mirrored skill: $mirrorSkill" }
}

function Get-RelativeFileHashes([string]$Path) {
    $root = (Resolve-Path -LiteralPath $Path).Path.TrimEnd([char]92, [char]47)
    Get-ChildItem -LiteralPath $Path -Recurse -File |
        Sort-Object FullName |
        ForEach-Object {
            $relative = $_.FullName.Substring($root.Length).TrimStart([char]92, [char]47).Replace([string][char]92, [string][char]47)
            $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
            "$relative $hash"
        }
}

$diff = Compare-Object (Get-RelativeFileHashes $source) (Get-RelativeFileHashes $mirror)
if ($diff) { throw "Root skills and plugin skills are out of sync." }

foreach ($metadata in @(
    (Join-Path $repoRoot "plugins\rk\.codex-plugin\plugin.json"),
    (Join-Path $repoRoot "plugins\rk\.claude-plugin\plugin.json"),
    (Join-Path $repoRoot ".claude-plugin\marketplace.json")
)) {
    Get-Content -LiteralPath $metadata -Raw -Encoding UTF8 | ConvertFrom-Json | Out-Null
}

Write-Host "Skill structure, references, public paths, mirror and metadata checks passed."
