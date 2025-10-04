Phone Screen Inventory Control

This repository contains a static HTML + JavaScript app that uses Firebase (Auth + Firestore) to manage phone screen inventory.

Quick start

1. Review and update the Firebase configuration in `index.html` (search for `firebaseConfig`).
2. Ensure Firestore rules are deployed before testing.

How to push this project to GitHub (one-time setup from this machine):

# Initialize repository, create first commit, and push to GitHub
# Replace <your-remote-repo-url> with your GitHub repo URL (HTTPS or SSH)

1. Open a terminal in the project root (`f:\PhoneScreen`).

2. Run these commands (PowerShell):

    git init
    git add .
    git commit -m "Initial commit: Phone Screen Inventory Control"
    git branch -M main
    git remote add origin <your-remote-repo-url>
    git push -u origin main

Notes

- This repo includes `index.html` which loads Firebase via CDN (compat). For production consider bundling and using the modular SDK.
- Update `DEPLOY_INSTRUCTIONS.md` if your Firebase project ID differs from the one in the files.

Security

- Do not commit secrets or private keys. If you need to store configs, use environment variables or a secrets manager.
