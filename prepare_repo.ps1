# prepare_repo.ps1
# Initializes a git repository (if needed), makes initial commit, and configures remote.
# Usage (PowerShell):
#   .\prepare_repo.ps1 -RemoteUrl 'https://github.com/youruser/yourrepo.git'

param(
    [Parameter(Mandatory=$true)]
    [string]$RemoteUrl
)

Set-Location -Path $PSScriptRoot

if (-not (Test-Path -Path .git)) {
    Write-Output "Initializing git repository..."
    git init
} else {
    Write-Output "Git repository already initialized."
}

git add .

# If there are no commits yet, make an initial commit
$hasCommits = git rev-parse --verify HEAD 2>$null
if (-not $hasCommits) {
    git commit -m "Initial commit: Phone Screen Inventory Control" -q
    Write-Output "Created initial commit."
} else {
    Write-Output "Repository already has commits."
}

# Ensure main branch exists and set as current
try {
    git branch -M main
} catch {
    # ignore
}

# Add remote if not present or update it
$existingRemote = git remote get-url origin 2>$null
if (-not $existingRemote) {
    git remote add origin $RemoteUrl
    Write-Output "Added remote origin: $RemoteUrl"
} else {
    Write-Output "Remote 'origin' already set to: $existingRemote"
}

Write-Output "To push to GitHub, run: git push -u origin main"
