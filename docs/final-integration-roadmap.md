# Final Integration Roadmap

This roadmap lists what must be connected before the system becomes a full production center.

## Already Ready

- GitHub repo as source of truth.
- Codex-ready `AGENTS.md`.
- Prompt templates.
- Production templates.
- rclone Google Drive remote `AI_Repo_DB:`.
- Tailscale login on laptop.
- VS Code automation extensions.
- GitHub CLI login.

## Must Connect Next

### 1. GitHub Project Board

Purpose:

- Track every episode and automation task.
- Keep human approvals visible.

Recommended columns:

- Ideas
- Research
- Script
- Voice
- Visuals
- Edit
- Shorts
- Compliance Review
- Scheduled
- Published
- Analytics Review

### 2. Google Drive Folder System

Purpose:

- Store large media and research files outside GitHub.

Recommended root:

- `AI-Automation-Backups/`
- `YouTube-Production/`
  - `01_Topics/`
  - `02_Research/`
  - `03_Scripts/`
  - `04_Voiceover/`
  - `05_Visuals/`
  - `06_Edits/`
  - `07_Shorts/`
  - `08_Final_Uploads/`
  - `09_Analytics/`

### 3. LiteLLM on VPS

Purpose:

- One model gateway for OpenAI, Gemini, Claude, Perplexity/OpenRouter, local Ollama, and future APIs.
- Budget control and fallback routing.

Codex role:

- Maintain `config/litellm.yaml.example`.
- Add model routing rules.
- Keep secrets out of GitHub.

### 4. n8n on VPS

Purpose:

- Run repeatable workflows.

Initial workflows:

- Topic intake from manual form.
- Source collection checklist.
- Research dossier generation.
- Upload checklist reminder.
- Analytics weekly report.
- rclone backup job.

### 5. Supabase/Postgres

Purpose:

- Store production state.

Suggested tables:

- `topics`
- `sources`
- `episodes`
- `assets`
- `approvals`
- `publishing`
- `analytics`
- `costs`

### 6. Qdrant or pgvector

Purpose:

- Search past research, sources, transcripts, and notes.

Start simple:

- Use pgvector if Supabase is already used.
- Use Qdrant if retrieval becomes a separate heavy service.

### 7. Dashboard Stack

Purpose:

- Watch system health.

Recommended:

- Portainer: container status.
- Dozzle: logs.
- Uptime Kuma: service checks.
- Netdata: VPS system health.

### 8. Production Tool APIs

Connect only when ready:

- ElevenLabs for voice.
- Creatomate for template rendering.
- YouTube Data API for metadata and analytics.
- Canva manual export first; API later only if needed.
- AI video tools through manual approval before automation.

## Human Approval Gates

Required approval points:

- Topic and angle.
- Research dossier.
- English script.
- Hindi adaptation.
- Voice choice.
- Visual style.
- Rough cut.
- Final cut.
- Upload metadata.
- Compliance review.

## What Not To Automate Yet

- Final publish button.
- Legal/compliance judgment.
- Expensive AI video generation.
- Final title/thumbnail decision.
- Script claims without source review.
