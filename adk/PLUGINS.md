# PLUGINS.md — Distribution & Integration Layer v3.0
# All MCP Servers, APIs, External Tools, Custom Integrations
# Node: [VPS] Contabo Cloud VPS 30 | [LAPTOP] Windows 11 | [CLOUD] External

---

## CLAUDE.AI MCP CONNECTIONS (Active)

Currently connected in Pawi's Claude.ai interface:

| MCP App | Status | Primary Use |
|---------|--------|-------------|
| GitHub | Active | Repo management, ADK version control, workflow JSON storage |
| Gmail | Active | Client communication, proposal delivery |
| Google Drive | Active | Script/asset storage, memory backup, product distribution |
| Google Calendar | Active | Content calendar sync, scheduling |
| Notion | Active | Knowledge base, project documentation |
| Linear | Active | Task/issue tracking |
| Canva | Active | Digital product design, thumbnails |
| Figma | Active | UI/UX design for SaaS products |
| Atlassian | Active | Project management (if needed) |
| Box | Active | File storage (secondary) |
| HubSpot | Active | CRM (evaluate vs Google Sheets CRM) |
| Intercom | Active | Customer communication (evaluate vs Hermes) |
| monday.com | Active | Project management (evaluate vs Paperclip) |

**GitHub Integration Strategy:**
- Repo: `YT-ai-automation-hub` (private)
- Claude MCP reads/searches repo during conversations
- n8n listens to GitHub webhooks for automation triggers (when VPS live)
- All ADK files, workflows, prompts version-controlled in GitHub

---

## CORE AGENT FRAMEWORKS

### n8n — Master Orchestration Engine
```
Node:      [VPS] :5678 (primary) | [LAPTOP] n8n Desktop (fallback)
Auth:      Basic auth / API key
Use:       Triggers, routing, API calls, file ops, scheduling, error handling
VPS path:  /opt/n8n/
Backup:    Export all workflows weekly → GitHub /n8n-workflows/
Status:    Active on laptop, migrate to VPS when live
```

### Dify — AI Orchestration Layer
```
Node:      [VPS] :3000 (API) | :3001 (Web UI)
Auth:      API key per app
Use:       RAG, prompt management, LLM routing, single-turn AI agents
VPS path:  /opt/dify/
Status:    Deploy on VPS
```

### CrewAI — Multi-Agent Crews
```
Node:      [VPS] :8888
Language:  Python 3.11+
Use:       Parallel specialist agents, complex multi-step production
VPS path:  /opt/crewai/
Integration: n8n → CrewAI via HTTP POST /crew/run → callback webhook
Status:    Deploy on VPS after core services stable
```

### Paperclip AI — Enterprise Task Management + Agent Memory
```
Node:      [VPS] :4001 (CORE — always running)
Use:       Enterprise task boards, daily/weekly/monthly monitoring,
           agent memory, cross-session state, decision history
VPS path:  /opt/paperclip/
Integration: All crews report to Paperclip; dashboard reads from Paperclip
Backup:    Nightly sync → Google Drive /PRRS-Global/Memory/
Status:    Core service — deploy early in VPS setup
```

### Hermes AI — Client-Facing Conversational Agent
```
Node:      [VPS] :5000 (public via Cloudflare Tunnel)
Use:       Client intake, scoping, FAQ, escalation to human team
VPS path:  /opt/hermes/
Channels:  Telegram bot (now), WhatsApp Business (planned)
Integration: Hermes → n8n webhook on brief completion
Status:    Deploy after Dify is stable
```

### LiteLLM — Model Gateway
```
Node:      [VPS] :4000 (always running)
Use:       Route AI requests to cheapest/best provider automatically
VPS path:  /opt/litellm/
Models:    Claude, GPT-4o, Gemini, Ollama local — cost-optimized routing
Status:    Deploy on VPS as core service
```

### Ollama — Local LLM Runtime
```
Node:      [VPS] :11434
Models:    llama3.2:3b (fast), mistral:7b (balanced)
Use:       Pre-processing, filtering, classification, draft iterations
Cost:      Free (VPS compute only)
Status:    Deploy on VPS
```

### Open WebUI — Chat Interface
```
Node:      [VPS] :3002 | [LAPTOP] installed locally
Use:       Chat UI for Ollama + remote models, team shared interface
Status:    Active on laptop, deploy on VPS
```

### OpenClaw — Evaluating
```
Node:      [VPS] (if adopted)
Status:    EVALUATING — not confirmed, assess after Dify is stable
Note:      May supplement or replace Dify for specific use cases
```

---

## PRODUCTION APIs — Video/Audio/Image

### ElevenLabs API
```
Node:      [CLOUD] — called from VPS
Endpoint:  https://api.elevenlabs.io/v1/text-to-speech/{voice_id}
Auth:      xi-api-key header
n8n cred:  "ElevenLabs API"
Use:       Voiceover generation (MP3) → Google Drive
Voice IDs: TBD per channel (approve once per channel — Gate 5)
```

### HeyGen API
```
Node:      [CLOUD] — called from VPS
Endpoint:  https://api.heygen.com/v2/video/generate
Auth:      x-api-key header
n8n cred:  "HeyGen API"
Use:       AI avatar talking-head segments → MP4
```

### Higgsfield
```
Node:      [CLOUD] — called from VPS
Use:       Avatar/character video generation (alternative to HeyGen)
Status:    Active — evaluate best-fit per channel
```

### RunwayML
```
Node:      [CLOUD] — called from VPS
Use:       B-roll motion video generation, VFX for video ads
n8n cred:  "RunwayML API"
```

### Google Veo 2 / Imagen 4
```
Node:      [CLOUD] — called from VPS or Laptop browser
Auth:      Google AI Pro subscription (18 months)
Use:       B-roll video (Veo 2), thumbnails/marketing images (Imagen 4)
```

### Creatomate API
```
Node:      [CLOUD] — called from VPS
Endpoint:  https://api.creatomate.com/v1/renders
Auth:      Bearer token
n8n cred:  "Creatomate API"
Use:       Final video assembly — combine B-roll + voiceover + avatar + music → MP4
```

### InVideo
```
Node:      [CLOUD]
Use:       Quick video creation, social media shorts
Status:    Active — evaluate for Shorts pipeline
```

### Veed.ai
```
Node:      [CLOUD]
Use:       Video editing, subtitles, social format adaptation
Status:    Active — evaluate for cross-platform distribution
```

### Kling AI
```
Node:      [CLOUD]
Use:       B-roll motion video (alternative when RunwayML/Veo 2 quota hit)
```

---

## RESEARCH & AI APIs

### Anthropic Claude API
```
Node:      [CLOUD] — called from VPS via LiteLLM
Endpoint:  https://api.anthropic.com/v1/messages
Auth:      x-api-key header
Models:    claude-sonnet-4-20250514 (quality), claude-haiku-4-5 (speed)
n8n cred:  "Anthropic - Claude API"
Use:       Scripts, proposals, QA, blog posts, customer drafts
```

### Perplexity API
```
Node:      [CLOUD] — called from VPS
Endpoint:  https://api.perplexity.ai/chat/completions
Auth:      Bearer token
n8n cred:  "Perplexity API"
Use:       Web-aware research, topic discovery, competitor analysis
```

### YouTube Data API v3
```
Node:      [CLOUD] — called from VPS
Auth:      OAuth 2.0 (one account per channel)
Scopes:    youtube.upload, youtube.readonly, youtube.force-ssl
n8n cred:  "YouTube OAuth - Channel 1" (Cybersecurity), "YouTube OAuth - Channel 2" (Brand)
Use:       Upload, schedule, metadata, analytics
```

### Telegram Bot API
```
Node:      [CLOUD] — VPS sends, team receives on mobile
Auth:      Bot token
n8n cred:  "Telegram Bot - PRRS Notifications"
Channels:  #pipeline-logs, #approval-queue, #cost-alerts, #daily-report
Use:       Task triggers, approval gates, notifications, command input
```

---

## STORAGE & INFRASTRUCTURE

### Google Drive
```
Auth:      OAuth 2.0 (+ Claude MCP)
n8n cred:  "Google Drive - PRRS Global"
Structure:
  /PRRS-Global/
    /YT/[CHANNEL]/[YYYY-MM]/        ← script.md, audio.mp3, video.mp4, thumb.png
    /DP/[Product]/                   ← Digital product assets
    /Blog/[YYYY-MM]/                 ← Blog drafts and published
    /Proposals/                      ← Client proposals
    /Memory/                         ← Paperclip backup
    /Workflows/                      ← n8n JSON exports
    /Reports/                        ← Weekly enterprise reports
    /SAAS/                           ← SaaS product assets
```

### Google Sheets
```
Auth:      OAuth 2.0 (+ Claude MCP)
n8n cred:  "Google Sheets - PRRS Global"
Key sheets:
  "Content Calendar"     → All channel video pipeline
  "Enterprise CRM"       → Leads, proposals, clients
  "Cost Tracker"         → Daily API/subscription spend
  "Channel KPIs"         → Views, subs, watch hours vs targets
  "Weekly Reports"       → Auto-populated by Ops Crew
  "Product Catalog"      → EasySkillup digital products (Ruchi)
  "Blog Tracker"         → Blog post pipeline and metrics
```

### GitHub
```
Node:      [LAPTOP] GitHub Desktop + [VPS] git CLI + Claude MCP
Repo:      YT-ai-automation-hub (private)
Structure:
  /adk/                    ← This Agent Development Kit
  /n8n-workflows/          ← All workflow JSONs
  /crewai-crews/           ← Crew Python files
  /dify-agents/            ← Agent DSL YAMLs
  /prompts/                ← Master prompt library
  /docker/                 ← Docker Compose files
  /docs/                   ← Architecture docs, SOPs
  /blog-content/           ← Blog drafts
  /digital-products/       ← Product templates
```

---

## LAPTOP-NATIVE TOOLS (always available, no VPS needed)

| Tool | Purpose | Category |
|------|---------|----------|
| Claude.ai + MCP apps | Primary AI interface, connected tools | AI |
| ChatGPT Pro | AI assistant, fallback/second opinion | AI |
| Grok Pro | AI assistant, research | AI |
| Codex | AI coding assistant | AI |
| Perplexity | Web-aware research (browser) | AI |
| Manus | AI agent tool | AI |
| LM Studio | Local AI models | AI |
| AnythingLLM | Local RAG + chat | AI |
| Open WebUI | Open-source LLM chat | AI |
| Google Gemini Pro | Multimodal AI, long-context | AI |
| n8n Desktop | Fallback automation | Automation |
| Docker Desktop | Local container runtime (DR) | Infrastructure |
| CapCut | Video editing | Media |
| DaVinci Resolve | Professional video editing | Media |
| FFmpeg | CLI media processing | Media |
| yt-dlp | Video/audio download | Media |
| Canva Pro | Design, digital products | Design |
| VS Code | Code/config editing | Development |
| GitHub Desktop + CLI | Version control | Development |
| MobaXterm | RDP/SSH to VPS | Remote Access |
| Tailscale | Mesh VPN | Networking |
| Obsidian | Knowledge base (local) | Knowledge |
| Notion | Project docs (cloud) | Knowledge |
| Zotero | Research source management | Knowledge |
| Google Sheets | Content calendar, CRM | Business |
| Telegram Desktop | Notifications, approvals | Communication |
| Uptime Kuma | Health monitoring | Monitoring |
| Google AntiGravity/NotebookLM | Research bridge | Research |

---

## CUSTOM INTEGRATION PATTERNS

### Telegram → n8n (Mobile command trigger)
```
Team sends Telegram message with command format:
  /task [domain] [description]
  /approve [task_id]
  /status [domain]

n8n Telegram trigger → parse command → route to appropriate crew/agent
```

### n8n → Paperclip (Task update)
```javascript
POST http://localhost:4001/api/task/update
{
  "board": "youtube/cyber",
  "task_id": "PRRS_YT_Script_CyberHeist",
  "status": "SCRIPTED",
  "assignee": "script_agent",
  "output_url": "drive://PRRS-Global/YT/CYBER/2026-06/script.md",
  "next_gate": "Gate 3 — Script Approval → Pawi"
}
```

### Hermes → n8n (New client brief)
```javascript
POST http://localhost:5678/webhook/client-intake
{
  "client_name": "...",
  "service_requested": "youtube_automation | consulting | cybersecurity | digital_products",
  "budget_range": "...",
  "timeline": "...",
  "contact": { "email": "...", "telegram": "..." },
  "brief_summary": "...",
  "route_to": "rudra | ruchi | pawi"
}
```

### Daily Report Assembly (Ops Crew → Telegram)
```
Trigger: n8n scheduled (8am IST daily)
Flow: Query Paperclip boards → Query cost tracker → Query n8n health →
      Compile report → Send Telegram to team → Update Paperclip daily log
```
