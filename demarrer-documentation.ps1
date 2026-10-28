
# Documentation locale SolidCraft
$ErrorActionPreference = "Stop"

# Aller dans le dossier du depot
Set-Location $PSScriptRoot

Write-Host "Generation de la documentation SolidCraft..."

# Generer les pages automatiques
cargo xtask book

if ($LASTEXITCODE -ne 0) {
    Write-Host "Erreur pendant la generation." -ForegroundColor Red
    exit 1
}

Write-Host "Generation terminee." -ForegroundColor Green

# Lancer le serveur mdBook
Set-Location (Join-Path $PSScriptRoot "docs\book")

Write-Host "Ouverture de http://localhost:3000/"
mdbook serve --open
