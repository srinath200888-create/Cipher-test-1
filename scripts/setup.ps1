# cipher-knowledge setup script for Windows
# Run from your project root: .\cipher-knowledge\scripts\setup.ps1

$ProjectRoot = Get-Location
$CipherDir = Join-Path $ProjectRoot "cipher-knowledge"
$DotOpenCode = Join-Path $ProjectRoot ".opencode"

Write-Host "=== Cipher Knowledge Setup ===" -ForegroundColor Cyan
Write-Host "Project root: $ProjectRoot" -ForegroundColor Gray
Write-Host ""

# Check if cipher-knowledge exists
if (-not (Test-Path $CipherDir)) {
    Write-Host "ERROR: cipher-knowledge directory not found!" -ForegroundColor Red
    Write-Host "Make sure you cloned it: git clone https://github.com/srinath200888/cipher-knowledge" -ForegroundColor Yellow
    exit 1
}

# Copy opencode.json if not already present
$TargetConfig = Join-Path $ProjectRoot "opencode.json"
$SourceConfig = Join-Path $CipherDir "opencode.json"
if (-not (Test-Path $TargetConfig)) {
    Copy-Item $SourceConfig $TargetConfig
    Write-Host "[+] Copied opencode.json to project root" -ForegroundColor Green
} else {
    Write-Host "[~] opencode.json already exists (skipped)" -ForegroundColor Yellow
}

# Create symlink for .opencode directory
if (-not (Test-Path $DotOpenCode)) {
    New-Item -ItemType Junction -Path $DotOpenCode -Target (Join-Path $CipherDir ".opencode") | Out-Null
    Write-Host "[+] Created .opencode symlink" -ForegroundColor Green
} else {
    Write-Host "[~] .opencode already exists (skipped)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Setup Complete ===" -ForegroundColor Cyan
Write-Host "Restart OpenCode for changes to take effect."
Write-Host ""
Write-Host "Try these commands in OpenCode:" -ForegroundColor Magenta
Write-Host "  /health          - Verify everything is loaded" -ForegroundColor White
Write-Host "  @vibe-coder     - Build an app from scratch" -ForegroundColor White
Write-Host "  /suggest-stack  - Get tech stack recommendations" -ForegroundColor White
