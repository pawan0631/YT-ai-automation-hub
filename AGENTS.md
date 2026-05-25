# AGENTS.md

Instructions for Codex and other coding agents working in this repository.

## Mission

Build and maintain a lightweight automation system for documentary YouTube production. The system supports research, scripting, source management, publishing checklists, analytics review, and VPS/local disaster recovery workflows.

## Priorities

- Keep changes simple, practical, and production-ready.
- Prefer small scripts, clear Markdown templates, and exportable n8n workflows.
- Optimize for repeatability, auditability, and low monthly cost.
- Assume the laptop is a light control/DR workstation; heavy automation runs on VPS and heavy generation uses APIs/cloud tools.

## Safety and Compliance

- Never commit secrets. Use `.env.example` for placeholders only.
- Keep large media files out of GitHub.
- Cybersecurity content must be educational, historical, defensive, or analytical. Do not create actionable exploit, malware, credential theft, evasion, or abuse instructions.
- Business/personality content must avoid unsupported accusations. Use source-backed wording and attribution.
- Generated or synthetic media should be tracked and disclosed where platform rules require it.

## Repo Conventions

- `docs/` contains system design, operating process, and compliance notes.
- `prompts/` contains reusable model prompts.
- `templates/` contains production checklists and episode documents.
- `n8n/workflows/` contains exported n8n workflows as JSON.
- `scripts/` contains local/VPS helper scripts.
- `config/` contains example config only.

## Working Style

- Make focused changes that directly support the requested workflow.
- Preserve existing user content unless explicitly asked to replace it.
- Prefer Markdown, YAML, JSON, PowerShell, and Python for this project.
- Add a short usage note when adding a script or workflow.
- Before finishing, mention any manual setup still needed, especially login/auth steps.
