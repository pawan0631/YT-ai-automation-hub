# Agent and LLM Interconnection Map

Use specialized tools for specialized jobs. Avoid making every AI model do the same task.

## Recommended Roles

| Role | Best Tool | Why |
|---|---|---|
| Master engineering agent | Codex | Repo, scripts, configs, workflows, debugging |
| Long-form writing critic | Claude or ChatGPT | Structure, clarity, narration polish |
| Research assistant | Gemini / Perplexity | Source discovery, summaries, citations |
| Visual ideation | Gemini image / Canva | Thumbnails, graphics, visual boards |
| Voice generation | ElevenLabs | Consistent documentary voiceover |
| Workflow runner | n8n | Repeatable scheduled automation |
| AI gateway | LiteLLM | Model routing, cost limits, fallback routing |
| Manual AI console | Open WebUI | One place to test prompts and local/API models |
| Knowledge app | Dify or Flowise | Optional reusable research/script apps |
| Local fallback | LM Studio / AnythingLLM | Emergency drafting and small private RAG |

## Recommended Request Flow

1. GitHub Issue describes the task.
2. Codex updates prompts, scripts, docs, or workflow exports in a branch.
3. Pull request documents the change.
4. n8n pulls approved workflow/config changes from GitHub or manual export.
5. LiteLLM routes model calls using budget rules.
6. Supabase records workflow state and analytics.
7. Uptime Kuma/Portainer/Dozzle show service health.
8. rclone backs up config and exports to Google Drive.

## Model Routing Policy

- Use local small models for rough drafts, extraction, and low-risk rewriting.
- Use Gemini/Perplexity for source discovery and current research.
- Use Claude/ChatGPT for final script structure and high-value creative review.
- Use paid video/image tools only after script and storyboard approval.
- Put all API traffic behind LiteLLM when possible.

## Budget Control

- Prefer subscription tools already paid for before adding more subscriptions.
- Use API keys with monthly provider limits.
- Keep a cost log per episode.
- Track generated assets and wasted generations.
