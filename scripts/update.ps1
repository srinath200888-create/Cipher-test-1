# cipher-knowledge update script for Windows
# Pulls latest changes and re-links

$ProjectRoot = Get-Location
$CipherDir = Join-Path $ProjectRoot "cipher-knowledge"

Write-Host "=== Cipher Knowledge Update ===" -ForegroundColor Cyan

if (-not (Test-Path $CipherDir)) {
    Write-Host "ERROR: cipher-knowledge directory not found!" -ForegroundColor Red
    exit 1
}

Set-Location $CipherDir

Write-Host "[*] Pulling latest changes..." -ForegroundColor Gray
git pull origin main

if ($?) {
    Write-Host "[+] Updated to latest version" -ForegroundColor Green
} else {
    Write-Host "[!] Git pull failed. Check your network or git status." -ForegroundColor Red
    Set-Location $ProjectRoot
    exit 1
}

Set-Location $ProjectRoot

# Re-run setup to ensure links are current
& (Join-Path $CipherDir "scripts\setup.ps1")

Write-Host ""
Write-Host "=== Update Complete ===" -ForegroundColor Cyan
Write-Host "Restart OpenCode for changes to take effect." -ForegroundColor White
