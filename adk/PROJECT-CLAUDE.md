# PROJECT-CLAUDE.md — Project Level v3.0
# Sprint 1: YouTube Channels — Cybersecurity + Brand Documentary
# Node: Laptop (now) → VPS (when live)
# Updated: 2026-05-30

---

## CURRENT SPRINT

**Goal:** Build end-to-end video production pipeline for two channels, publish first videos

### Sprint 1 Channels
1. **Cybersecurity & Cyber Espionage** (EN → HI)
2. **Business & Brand Documentary** (EN → HI)

### Phase 1: Foundation (NOW — Laptop only, pre-VPS)
- [x] ADK v3 consolidated and loaded into Claude Project
- [x] Some n8n workflows built and tested locally
- [ ] GitHub repo synced: https://github.com/pawan0631/YT-ai-automation-hub
- [ ] ADK files committed to GitHub /adk/
- [ ] Prompt library: base script prompts for both channels
- [ ] Content Calendar: Google Sheets setup with schema
- [ ] Research workflow: n8n + Perplexity for topic discovery
- [ ] Script generation workflow: n8n + Claude API
- [ ] Google Drive folder structure created per naming convention
- [ ] Telegram bot created for notifications

### Phase 2: VPS Setup (Next Month)
- [ ] Contabo Cloud VPS 30 procured
- [ ] Ubuntu 24.04 + XFCE4 + XRDP installed
- [ ] Tailscale mesh VPN: laptop ↔ VPS connected
- [ ] Docker Compose stack deployed (core services)
- [ ] n8n migrated from laptop to VPS
- [ ] Dify installed and configured
- [ ] Ollama installed with LLaMA 3.2:3b + Mistral 7B
- [ ] LiteLLM configured as model gateway
- [ ] Monitoring stack: Portainer + Dozzle + Uptime Kuma + Netdata
- [ ] UFW firewall rules applied
- [ ] .env file configured (all credentials)

### Phase 3: Pipeline Build (VPS live)
- [ ] ElevenLabs voiceover automation node
- [ ] HeyGen / Higgsfield avatar segment integration
- [ ] RunwayML / Veo 2 B-roll generation
- [ ] Creatomate / open-source video assembly workflow
- [ ] YouTube upload + SEO automation node
- [ ] Telegram approval gate workflow
- [ ] Full pipeline test: topic → published video (Cybersecurity)
- [ ] Full pipeline test: topic → published video (Brand Documentary)
- [ ] Hindi translation/adaptation pipeline added

### Phase 4: Agent Layer (after pipeline works)
- [ ] CrewAI YouTube Production Crew configured
- [ ] Paperclip memory configured for production crew
- [ ] Hermes client intake bot deployed
- [ ] Ops & Reporting Crew: daily/weekly reports automated
- [ ] Dashboard v1 deployed at VPS :8080

### Phase 5: Scale (after first 5 videos per channel)
- [ ] One-time gates locked (voice choice, Hindi adaptation style)
- [ ] Cross-platform distribution workflow (FB, Insta, TikTok, LinkedIn)
- [ ] Domain 5 activation: Digital Products (Ruchi)
- [ ] Evaluate channels 3–6 activation

---

## NODE ASSIGNMENT FOR SPRINT 1

| Task | Node (Now) | Node (VPS Live) | Tool |
|------|-----------|-----------------|------|
| Workflow orchestration | Laptop (n8n local) | VPS (n8n) | n8n |
| Script generation | Laptop (Claude.ai) | VPS (Claude API via n8n) | Claude Sonnet |
| Research | Laptop (Perplexity browser) | VPS (Perplexity API via n8n) | Perplexity |
| Voiceover | Manual (browser) | VPS (ElevenLabs API) | ElevenLabs |
| Avatar video | Manual (browser) | VPS (HeyGen/Higgsfield API) | HeyGen |
| B-roll generation | Manual (browser) | VPS (RunwayML/Veo 2 API) | RunwayML/Veo 2 |
| Video assembly | Laptop (CapCut) | VPS (Creatomate API) | Creatomate |
| Thumbnails | Laptop (Canva Pro) | VPS (Imagen 4 API) + Canva | Canva/Imagen 4 |
| Storage | Cloud | Cloud | Google Drive |
| Approval gate | Mobile (Telegram) | Mobile (Telegram) | Telegram Bot |
| Upload | Manual (YouTube Studio) | VPS (YouTube API) | YouTube API |
| Hindi translation | Manual (Claude.ai) | VPS (Claude API) | Claude |

---

## CONTENT CALENDAR SCHEMA (Google Sheets)

| Col | Field | Notes |
|-----|-------|-------|
| A | Row ID | Auto-increment |
| B | Channel | CYBER / BRAND / COMPARE / HIST / KIDS / SPORT |
| C | Topic | Video title idea |
| D | Language | EN / HI / EN+HI |
| E | Keywords | Comma-separated |
| F | Length | short / long |
| G | Status | PENDING → RESEARCHED → SCRIPTED → VOICED → ASSEMBLED → REVIEW → APPROVED → PUBLISHED |
| H | Script URL | Google Drive link |
| I | Audio URL | ElevenLabs output |
| J | Video URL | Final assembled video |
| K | YouTube URL | Post-publish |
| L | Publish Date | Scheduled |
| M | Approval Status | Gate 1–10 checkboxes |
| N | Assigned To | Agent crew or manual |
| O | Notes | Human comments |

---

## N8N WORKFLOW CONVENTIONS

```
Credential names (exact — use these in all workflows):
  Google Sheets:   "Google Sheets - PRRS Global"
  Google Drive:    "Google Drive - PRRS Global"
  Telegram:        "Telegram Bot - PRRS Notifications"
  Perplexity:      "Perplexity API"
  Claude:          "Anthropic - Claude API"
  ElevenLabs:      "ElevenLabs API"
  HeyGen:          "HeyGen API"
  Creatomate:      "Creatomate API"
  YouTube:         "YouTube OAuth - Channel 1"
  RunwayML:        "RunwayML API"
  Higgsfield:      "Higgsfield API"

Drive root path:   /PRRS-Global/
  Per channel:     /PRRS-Global/YT/[CHANNEL]/[YYYY-MM]/
  Assets per video: script.md, audio.mp3, video.mp4, thumbnail.png

Node naming:       PascalCase — e.g. "ResearchPerplexity", "WriteScriptClaude"
Workflow IDs:      PRRS-[CHANNEL]-[FUNCTION]-v[N] — e.g. "PRRS-CYBER-SCRIPT-v1"
Error node:        Always "ErrorNotifyTelegram" as final error branch
```

---

## SCRIPT FORMAT (Cinematic Documentary)

```
[HOOK — 0:00-0:30]        Cold open, most arresting fact first
[INTRO — 0:30-1:30]       Channel brand + topic setup
[B-ROLL CUE: description] Every 45–60 seconds throughout
[AVATAR SEGMENT: topic]   HeyGen/Higgsfield talking-head inserts
[MUSIC CUE: mood]         At major transitions
[ACT 1/2/3]               Narrative blocks
[OUTRO + CTA]             Subscribe + next video prompt
Target: 2,500 words ±200 for 15–18 min video
Shorts: 300–500 words for 2–8 min
```

---

## IMMEDIATE NEXT ACTIONS (Phase 1 checklist)

Priority order — do these before VPS arrives:
1. Commit ADK v3 to https://github.com/pawan0631/YT-ai-automation-hub
2. Set up Google Sheets Content Calendar with schema above
3. Create Google Drive folder structure: /PRRS-Global/YT/CYBER/ and /PRRS-Global/YT/BRAND/
4. Create Telegram bot for notifications
5. Build n8n workflow: Sheets trigger → Perplexity research → Claude script → Drive save → Telegram notify
6. Test pipeline manually: pick 1 cybersecurity topic → research → script → voiceover (browser) → assemble (CapCut) → publish
7. Document what worked and what needs automation — this becomes VPS setup priority list
