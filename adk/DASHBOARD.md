# DASHBOARD.md — Enterprise Reporting Dashboard v3.0
# Powered by: Paperclip (task management) + n8n (data feeds) + Web UI
# VPS :8080 | Accessible from Laptop browser via Tailscale
# Enterprise: PRRS Global | Team: Pawi, Rudra, Ruchi

---

## PURPOSE

The dashboard + Paperclip together give the 3-person team a single view into everything AI agents are doing across all 8 domains. Open it in a browser → know the status of every pipeline, agent crew, cost meter, and approval queue in under 60 seconds.

No digging through n8n logs. No querying Sheets. No Telegram archaeology.

**Data backbone:** Paperclip enterprise task boards (always running on VPS :4001)
**Display layer:** Dashboard web UI (VPS :8080)
**Mobile access:** Telegram daily/weekly digests

---

## DASHBOARD SECTIONS

### 1. SYSTEM HEALTH BAR (top strip — always visible)
```
VPS: ✅ Online | n8n: ✅ Running | Dify: ✅ Running | CrewAI: ✅ Ready
Paperclip: ✅ Synced | Hermes: ✅ Active | LiteLLM: ✅ Routing | Ollama: ✅ Ready
Last report: 8 min ago | Today API spend: $4.20 / ₹349
Uptime Kuma: all green | Netdata: CPU 23% RAM 61%
```

---

### 2. APPROVAL QUEUE (priority panel — top of main content)
Items needing human decision before agents proceed.
```
┌──────────────────────────────────────────────────────────────┐
│ WAITING FOR APPROVAL                                          │
├─────────────────────────────────┬─────────┬────────┬─────────┤
│ Item                            │ Domain  │ Gate   │ Route To│
├─────────────────────────────────┼─────────┼────────┼─────────┤
│ Script: "NSA Cyber Heist 2025"  │ YT      │ Gate 3 │ Pawi    │
│ Proposal: TechCorp automation   │ CON     │ Review │ Rudra   │
│ Product: AI Starter Course v1   │ DP      │ Review │ Ruchi   │
│ Cost alert: ElevenLabs >budget  │ OPS     │ Flag   │ Rudra   │
│ Blog: GDPR Guide draft          │ BLOG    │ Review │ Pawi    │
└─────────────────────────────────┴─────────┴────────┴─────────┘
```

---

### 3. YOUTUBE PIPELINE BOARD (per-channel Kanban — powered by Paperclip)
```
CHANNEL: CYBERSECURITY (EN → HI)
┌──────────┬────────────┬──────────┬──────────┬──────────┬──────────┐
│ PENDING  │ RESEARCHED │ SCRIPTED │ REVIEW   │ APPROVED │PUBLISHED │
├──────────┼────────────┼──────────┼──────────┼──────────┼──────────┤
│Topic 4   │Topic 3     │Topic 2   │          │          │Topic 1   │
│Topic 5   │(Perplexity)│(Gate 3)  │          │          │Jun 1     │
│Topic 6   │            │          │          │          │          │
└──────────┴────────────┴──────────┴──────────┴──────────┴──────────┘

CHANNEL: BRAND DOCUMENTARY (EN → HI)
┌──────────┬────────────┬──────────┬──────────┬──────────┬──────────┐
│ PENDING  │ RESEARCHED │ SCRIPTED │ REVIEW   │ APPROVED │PUBLISHED │
├──────────┼────────────┼──────────┼──────────┼──────────┼──────────┤
│Topic 1   │            │          │          │          │          │
│Topic 2   │            │          │          │          │          │
└──────────┴────────────┴──────────┴──────────┴──────────┴──────────┘

Each card: topic name, assigned agent/crew, last updated, next gate, language status (EN/HI)
```

---

### 4. AGENT CREW STATUS (powered by Paperclip)
```
┌────────────────────────────┬───────────┬──────────────────────────┐
│ Crew                       │ Status    │ Last Activity            │
├────────────────────────────┼───────────┼──────────────────────────┤
│ YouTube Production Crew    │ ✅ Running │ Script written — 14 min  │
│ Business Dev Crew          │ 💤 Idle   │ Last run — 6 hrs ago     │
│ Digital Products Crew      │ 💤 Idle   │ Waiting: Sprint 1 first  │
│ Blog Publishing Crew       │ 💤 Idle   │ Not yet activated        │
│ Ops & Reporting Crew       │ ✅ Running │ Cost report — 2 min ago  │
├────────────────────────────┼───────────┼──────────────────────────┤
│ Paperclip Enterprise       │ ✅ Active  │ 3 task boards active     │
│ LiteLLM Gateway            │ ✅ Routing │ 47 requests today        │
│ Hermes Intake Bot          │ ⏸ Paused  │ Deploy after VPS stable  │
└────────────────────────────┴───────────┴──────────────────────────┘
```

---

### 5. DOMAIN STATUS OVERVIEW (all 8 domains)
```
┌─────────────────────────────┬───────────┬──────────────────┐
│ Domain                      │ Status    │ Sprint Phase     │
├─────────────────────────────┼───────────┼──────────────────┤
│ 1. YouTube Studio           │ 🟢 Active │ Sprint 1 — Build │
│ 2. Multi-Platform Content   │ ⚪ Queued │ After Sprint 1   │
│ 3. Video Ads (UGC/VFX)     │ ⚪ Queued │ After Sprint 1   │
│ 4. Consulting Services      │ ⚪ Queued │ Month 3+         │
│ 5. Digital Products (Ruchi) │ 🟡 Planning│ Parallel track   │
│ 6. SaaS Development        │ ⚪ Queued │ Month 6+         │
│ 7. Blog Publishing         │ ⚪ Queued │ After Sprint 1   │
│ 8. Cybersecurity Services   │ ⚪ Queued │ Month 3+         │
└─────────────────────────────┴───────────┴──────────────────┘
```

---

### 6. CHANNEL KPIs (vs YPP targets)
```
CYBERSECURITY CHANNEL
Views:       0     ░░░░░░░░░░░░░░░░  Target: 50,000 watch hours
Subscribers: 0     ░░░░░░░░░░░░░░░░  Target: 1,000
Videos live: 0     Published this week: 0
YPP Progress: 0%   Est. eligibility: Month 5–7

BRAND DOCUMENTARY CHANNEL
Views:       0     ░░░░░░░░░░░░░░░░  Target: 50,000 watch hours
Subscribers: 0     ░░░░░░░░░░░░░░░░  Target: 1,000
Videos live: 0     Published this week: 0
YPP Progress: 0%   Est. eligibility: Month 5–7
```

---

### 7. COST TRACKER
```
TODAY: $0 / ₹0            MONTH TO DATE: $0 / ₹0
Subscriptions active: Claude Max, ChatGPT Pro, Grok Pro, Gemini Pro, Canva Pro

PLANNED MONTHLY COSTS (when VPS live):
Contabo VPS:       ~$17     ██░░░░░░░░
Claude API:        ~$30–50  ████████░░  (usage-based)
ElevenLabs:        ~$22     ██████░░░░
HeyGen:            ~$29     ██████░░░░
RunwayML:          ~$15–30  █████░░░░░
Creatomate:        ~$25     █████░░░░░
Perplexity:        ~$20     ████░░░░░░
Misc APIs:         ~$20     ████░░░░░░

⚠️ ALERTS: None
```

---

### 8. BUSINESS PIPELINE (CRM — Paperclip board)
```
NEW LEADS    │ PROPOSAL SENT  │ NEGOTIATING  │ WON       │ DELIVERED
─────────────┼────────────────┼──────────────┼───────────┼──────────
             │                │              │           │
(no leads yet — pre-launch)

Pipeline value: ₹0   Won this month: ₹0   Hermes conversations: 0
```

---

### 9. RECENT AGENT ACTIVITY LOG (last 20 actions)
```
[timestamp]  [crew/agent]     [action]
(no activity yet — agents not deployed)
```

---

### 10. TEAM ACTION ITEMS (per person)
```
PAWI (P1):
  □ Finalize ADK v3 and commit to GitHub
  □ Create Content Calendar in Google Sheets
  □ Set up Telegram bot
  □ Pick first 3 topics per channel

RUDRA (P2):
  □ Procure Contabo Cloud VPS 30
  □ Begin VPS base setup (Phase A checklist)
  □ Configure Tailscale mesh
  □ Test laptop ↔ VPS RDP connectivity

RUCHI (P3):
  □ Draft first 3 digital product outlines
  □ Set up Gumroad/Teachable account
  □ Review PRRS Global branding guidelines
```

---

## IMPLEMENTATION

### Recommended: Retool / AppSmith (Phase 1 — fast, no-code)
- Connect to Paperclip API, Google Sheets, n8n APIs
- Drag-and-drop UI builder
- Approval buttons built natively
- Self-hosted free tier on VPS
- Setup: 1 day after VPS is live
- Pawi-friendly: GUI builder, no coding needed

### Future: Custom React Dashboard (Phase 2 — when stable)
- Full read/write — approve items directly
- API endpoints: Paperclip, n8n, CrewAI, Sheets
- VPS :8080
- Build when enterprise is generating revenue

### Monitoring (separate from dashboard):
- **Portainer** (:9090) — container management GUI
- **Dozzle** (:8081) — real-time container logs
- **Uptime Kuma** (:3003) — service health alerts
- **Netdata** (:19999) — CPU/RAM/disk/network metrics

---

## DATA SOURCES

| Panel | Source | Method |
|-------|--------|--------|
| System Health | Uptime Kuma + Netdata | API read |
| Approval Queue | Paperclip task boards | Paperclip API |
| Pipeline Board | Paperclip YouTube boards | Paperclip API |
| Agent Status | CrewAI API + Paperclip | REST API |
| Domain Status | Paperclip enterprise config | Paperclip API |
| Channel KPIs | YouTube Analytics API | n8n daily pull → Paperclip |
| Cost Tracker | Google Sheets "Cost Tracker" | Sheets API (Ops Crew updates) |
| Business Pipeline | Paperclip consulting board | Paperclip API |
| Activity Log | n8n execution history + Paperclip | Combined API |
| Team Actions | Paperclip task assignments | Paperclip API |
