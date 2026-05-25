# Laptop Setup

This laptop is the light control and disaster recovery workstation. Keep it stable and avoid heavy local AI/video workloads.

## Installed/Recommended Tools

- Git + GitHub Desktop: repo control and sync.
- GitHub CLI: issues, PRs, and repo automation from terminal.
- VS Code: editing, scripts, prompts, and repo work.
- FFmpeg: audio/video conversion, trimming, proxies, subtitle burn-in.
- yt-dlp: metadata/caption research and permitted asset handling.
- rclone: backup/sync to Google Drive, OneDrive, VPS, or object storage.
- Tailscale: private access to VPS dashboards.
- Zotero + Chrome Connector: research/source capture.
- ImageMagick: thumbnail and image batch processing.
- Obsidian: notes and knowledge base.
- VLC: media review.

## Manual Steps Still Required

1. Sign in to Tailscale on laptop.
2. Add VPS to the same Tailscale network when VPS is ready.
3. Run `gh auth login` in a normal PowerShell session.
4. Configure `rclone config` after deciding primary cloud storage.
5. Open this repo in VS Code and sign in to the GitHub extension if prompted.
