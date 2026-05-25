# YT AI Automation Hub

Central automation workspace for two English documentary YouTube channels:

- Cybersecurity, cyber warfare, cybercrime, and digital risk documentaries.
- Business, brand, founder, and regional economy documentaries.

This repo stores the repeatable operating system: prompts, production templates, n8n workflow exports, VPS setup notes, compliance checklists, and utility scripts. Large media files, API keys, generated videos, and private research archives must stay outside GitHub.

## Operating Model

1. Capture topic ideas and sources.
2. Build a research dossier with citations.
3. Draft a 15-18 minute documentary script.
4. Generate voiceover, visuals, thumbnail concepts, and shorts.
5. Run fact-check, compliance, and upload checklist.
6. Track performance and improve the next episode.

## Core Tools

- GitHub: version control, issues, checklists, and Codex tasks.
- Codex: repo automation, scripts, templates, review, and debugging.
- VS Code: local editing and repo control.
- n8n: production automation on VPS.
- Open WebUI + LiteLLM: central AI model access and routing.
- Zotero/Paperless: source and evidence archive.
- rclone: backup/sync between laptop, VPS, and cloud storage.
- FFmpeg/yt-dlp/ImageMagick: media utilities.

## First Rules

- Do not commit secrets, API keys, tokens, raw credentials, or private customer data.
- Do not commit large media exports. Use cloud storage and link from docs if needed.
- Keep prompts and automation reusable.
- Add sources for factual claims in research outputs.
- Use educational, defensive framing for cybersecurity content.
