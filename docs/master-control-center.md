# Codex Master Control Center

This repository is the source of truth for automation design, prompts, scripts, workflow exports, checklists, and project operating rules. Codex should act as the engineering and coordination layer, while execution-heavy services run on the VPS or external APIs.

## Control Layers

| Layer | Primary Tool | Purpose |
|---|---|---|
| Source of truth | GitHub repo | Instructions, prompts, templates, scripts, workflow exports |
| Work planning | GitHub Issues / Projects | Episode tasks, automation tasks, bugs, improvements |
| Engineering agent | Codex | Build scripts, workflows, configs, docs, checks, repo reviews |
| Workflow execution | n8n | Scheduled jobs, API calls, publishing support, notifications |
| AI gateway | LiteLLM | Central model routing, keys, budgets, fallbacks |
| Human chat console | Open WebUI | Manual AI operations against local/API models |
| AI app layer | Dify or Flowise | Repeatable research/script apps if needed |
| Data/state | Supabase/Postgres | Topics, sources, production status, analytics |
| Vector search | Qdrant or pgvector | Source retrieval and research memory |
| File archive | Google Drive/rclone/Paperless/Zotero | Media, documents, sources, backups |
| Monitoring | Uptime Kuma, Portainer, Dozzle, Netdata | Health, containers, logs, system metrics |
| Private access | Tailscale | Secure access to VPS dashboards |

## Golden Rule

Codex designs and changes the system through GitHub. n8n runs the system. LiteLLM routes AI calls. Supabase stores state. Google Drive stores large files. Humans approve final creative and compliance decisions.

## What Codex Should Own

- Repo structure and documentation.
- Prompt templates and evaluation rubrics.
- Small utility scripts.
- n8n workflow JSON exports.
- Docker Compose/config examples.
- GitHub issue/PR hygiene.
- Automation safety reviews.

## What Codex Should Not Own Directly

- Raw API keys or secrets.
- Final upload approval.
- Legal/compliance judgment without human review.
- Large media files.
- Paid API spend without budget controls.
- Publicly exposed VPS dashboards.
