# Vendored from fuzzifikation/agents — see the stamp for the upstream commit.
# Vendor this repo's AI customizations into another repo (or the VS Code user profile).
# Windows twin of bin/sync.sh — keep the two in step.
#
#   sync.ps1 [-Agents] [-User] <target-repo-path>
#
# Copies are stamped with this clone's commit. No network, no git on the clone.
# Runs on Windows PowerShell 5.1 and pwsh 7: no -ContainerPath, no ternaries.
[CmdletBinding()]
param(
  [switch]$Agents,
  [switch]$User,
  [Parameter(Position = 0)][string]$Target
)
$ErrorActionPreference = 'Stop'
if (-not $Target) { Write-Host 'usage: sync.ps1 [-Agents] [-User] <target-repo-path>' 2>&1; exit 2 }

function Test-Folder([string]$p) { Test-Path -LiteralPath $p -PathType Container }

$Src = Split-Path -Parent $PSScriptRoot
$Sha = git -C $Src rev-parse --short HEAD 2>$null
if (-not $Sha) { $Sha = 'unknown' }
$Stamp = "<!-- vendored from fuzzifikation/agents @ $Sha, synced $((Get-Date).ToUniversalTime().ToString('yyyy-MM-dd')). Do not edit here: edit upstream and re-run bin/sync.ps1 -->"

if ($User) {
  if ($env:VSCODE_USER_PROMPTS) { $Dest = $env:VSCODE_USER_PROMPTS }
  else { $Dest = Join-Path $env:APPDATA 'Code\User\prompts' }
} else {
  if (-not (Test-Folder $Target)) { Write-Error "no such directory: $Target"; exit 1 }
  $Dest = Join-Path $Target '.github'
}

# Copy one file, inserting the provenance stamp after the YAML frontmatter
# (frontmatter must stay at byte zero or the parser never sees it).
function Vendor([string]$SrcFile, [string]$DstFile) {
  $dir = Split-Path -Parent $DstFile
  if (-not (Test-Folder $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $old = 'new'
  if (Test-Path -LiteralPath $DstFile) {
    $m = Select-String -LiteralPath $DstFile -Pattern 'agents @ [^,]*' | Select-Object -First 1
    if ($m) { $old = $m.Matches[0].Value } else { $old = 'untracked version' }
  }

  $lines = @(Get-Content -LiteralPath $SrcFile)
  $out = New-Object System.Collections.Generic.List[string]
  if ($lines.Count -gt 0 -and $lines[0] -eq '---') {
    $dashes = 0; $stamped = $false
    foreach ($l in $lines) {
      $out.Add($l)
      if (-not $stamped -and $l -eq '---') { $dashes++; if ($dashes -eq 2) { $out.Add(''); $out.Add($Stamp); $stamped = $true } }
    }
    if (-not $stamped) { $out.Add(''); $out.Add($Stamp) }
  } else {
    $out.Add($Stamp); $out.Add('')
    foreach ($l in $lines) { $out.Add($l) }
  }
  # UTF-8 without BOM, LF endings — VS Code and git both prefer bytes nobody has to explain.
  [System.IO.File]::WriteAllText($DstFile, (($out -join "`n") + "`n"), (New-Object System.Text.UTF8Encoding($false)))
  Write-Host "  $(Split-Path -Leaf $DstFile): $old -> @ $Sha"
}

Write-Host "sync -> $Dest"
Vendor (Join-Path $Src 'working-principles.instructions.md') (Join-Path $Dest 'instructions\working-principles.instructions.md')

if ($Agents) {
  Vendor (Join-Path $Src 'structural-review.agent.md') (Join-Path $Dest 'agents\structural-review.agent.md')
  # sibling assets folder: the agent resolves <its-dir>/structural-review-assets/
  $assetDst = Join-Path $Dest 'agents\structural-review-assets'
  if (Test-Folder $assetDst) { Remove-Item -Recurse -Force $assetDst }
  New-Item -ItemType Directory -Force -Path $assetDst | Out-Null
  Copy-Item (Join-Path $Src 'structural-review-assets\*.mjs') $assetDst
  $names = (Get-ChildItem (Join-Path $Src 'structural-review-assets') -Filter *.mjs | ForEach-Object Name) -join ' '
  Write-Host "  structural-review-assets/: $names"
}

# Repo scope only: make sure the project file points at the vendored law.
$proj = Join-Path $Dest 'copilot-instructions.md'
if (-not $User -and (Test-Path -LiteralPath $proj)) {
  if (-not (Select-String -LiteralPath $proj -Pattern 'working-principles' -Quiet)) {
    Write-Host 'WARN  copilot-instructions.md has no pointer to working-principles.'
    Write-Host '      Add one line so every session finds the general law, e.g.:'
    Write-Host '      > General working rules: vendored from fuzzifikation/agents, see'
    Write-Host '      > .github/instructions/working-principles.instructions.md'
  }
}
