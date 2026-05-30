# PRRS GLOBAL AGENT DEVELOPMENT KIT — v3.0
# 3-Person AI-Powered Enterprise
# Laptop (Command Center + DR) + Contabo Cloud VPS 30 (Production Engine)
# Consolidated: 2026-05-30

---

## WHAT IS THIS KIT?

This is the complete, portable context profile for the PRRS Global AI-powered enterprise. It implements the 5-layer Agent Development Kit architecture (Brij Kishore Pandey framework):

```
Layer 1: CLAUDE.md           → Constitution (who you are, what you're building)
         PROJECT-CLAUDE.md   → Active sprint context
Layer 2: SKILLS.md           → 12 domain knowledge modules
Layer 3: HOOKS.md            → 12 guardrails and automatic checks
Layer 4: SUBAGENTS.md        → 5 CrewAI crews + Dify agents + Hermes + Paperclip + LiteLLM
Layer 5: PLUGINS.md          → All APIs, MCP servers, and integration patterns
         INFRASTRUCTURE.md   → Dual-node architecture, Docker Compose, firewall
         DASHBOARD.md        → Enterprise reporting dashboard spec
```

---

## WHAT CHANGED FROM v2 → v3

| Area | v2 (Incorrect/Incomplete) | v3 (Corrected) |
|------|--------------------------|----------------|
| Identity | Rudra = founder | **Pawi = founder**, Rudra = P2 (sys ops), Ruchi = P3 (products) |
| Brand | No brand / "EasySkillup" only | **PRRS Global** (enterprise) + **EasySkillup** (products) with PRRS_[Domain]_[AssetType]_[Topic] naming |
| Background | "SysAdmin, education (birth-15)" | **20+ years**: systems, network, cloud, cybersecurity, audit, compliance, privacy, AI security |
| Domains | 4 domains | **8 domains**: YouTube, multi-platform, video ads, consulting, digital products, SaaS, blog, cybersecurity services |
| Channels | 6 English channels | **6 confirmed + 2 TBD**, Sprint 1 = Cyber + Brand, **EN → HI bilingual** |
| VPS | "Setup in progress" | **Not yet procured** — next month. Honest status. |
| Sprint status | "ElevenLabs node pending" | **Planning phase**, some local n8n workflows built |
| Paperclip role | Agent memory only | **Enterprise task management + monitoring dashboard + agent memory** (core service) |
| Stack | n8n + Dify + CrewAI + Hermes | + **LiteLLM, Open WebUI, Portainer, Dozzle, Uptime Kuma, Netdata, Tailscale** |
| Video tools | ElevenLabs + HeyGen + Creatomate | + **Higgsfield, RunwayML, InVideo, Veed.ai** |
| AI subscriptions | Claude only | **Claude Max + ChatGPT Pro + Grok Pro + Gemini Pro (18mo) + Canva Pro** |
| Laptop tools | Basic list | **Full inventory**: Claude, ChatGPT, Codex, Perplexity, Manus, LM Studio, AnythingLLM, Obsidian, Zotero, etc. |
| Approval gates | Simple approve/reject | **10 gates**, 2 one-time (voice, Hindi style), 8 per-video |
| Mobile command | Telegram only | **Telegram now**, WhatsApp planned |
| GitHub | Not integrated | **GitHub = source of truth**, Claude MCP connected, n8n webhooks planned |
| Real estate | Omaxe State project | **Dropped** |
| OpenClaw | Deprecated | **Evaluating** (not confirmed) |
| Reporting | Basic Telegram | **Paperclip-powered** daily/weekly/monthly dashboards |

---

## FILE INDEX

```
skillindia-adk-v3/
│
├── README.md                          ← You are here
│
├── claude-md/
│   ├── CLAUDE.md                      ← LAYER 1: Global constitution
│   │                                    Identity, team, infra, 8 domains,
│   │                                    approval gates, GitHub strategy,
│   │                                    standing guardrails
│   │
│   └── PROJECT-CLAUDE.md              ← LAYER 1: Sprint 1 context
│                                        Cyber + Brand channels, phase checklist,
│                                        node assignments, content calendar schema,
│                                        script format, n8n conventions
│
├── skills/
│   └── SKILLS.md                      ← LAYER 2: 12 knowledge modules
│                                        1. infrastructure-architect
│                                        2. n8n-workflow-builder
│                                        3. crewai-agent-designer
│                                        4. paperclip-enterprise-manager
│                                        5. hermes-deployment
│                                        6. youtube-pipeline-operator
│                                        7. business-developer
│                                        8. vps-admin
│                                        9. reporting-and-dashboard
│                                        10. digital-product-builder
│                                        11. blog-publisher
│                                        12. saas-product-architect
│
├── hooks/
│   └── HOOKS.md                       ← LAYER 3: 12 guardrails
│                                        SessionStart — Context & Node Loader
│                                        PreToolUse — Node Clarity Gate
│                                        PreToolUse — API & Cost Gate
│                                        PreToolUse — Agent Design Gate
│                                        PreToolUse — Scope Creep Detector
│                                        PreToolUse — Procrastination Check
│                                        PostToolUse — Revenue Reality Check
│                                        Stop — Output Security Validator
│                                        SubagentStop — Quality Gate
│                                        VPS Unreachable — Fallback Activator
│                                        Brand Integrity Validator
│                                        Approval Gate Router
│
├── subagents/
│   └── SUBAGENTS.md                   ← LAYER 4: Full AI workforce
│                                        CrewAI Crew 1: YouTube Production
│                                        CrewAI Crew 2: Business Development
│                                        CrewAI Crew 3: Digital Products (Ruchi)
│                                        CrewAI Crew 4: Blog Publishing
│                                        CrewAI Crew 5: Ops & Reporting (master)
│                                        Dify Agents: Script Refiner, SEO,
│                                          Brief Extractor, Error Analyzer, Blog SEO
│                                        Hermes AI: Client intake + escalation
│                                        Paperclip: Enterprise tasks + memory
│                                        LiteLLM: Model gateway routing
│
├── plugins/
│   ├── PLUGINS.md                     ← LAYER 5: All integrations
│   │                                    Claude MCP connections (13 active)
│   │                                    Agent frameworks (n8n, Dify, CrewAI,
│   │                                      Paperclip, Hermes, LiteLLM, Ollama,
│   │                                      Open WebUI, OpenClaw evaluating)
│   │                                    Production APIs (ElevenLabs, HeyGen,
│   │                                      Higgsfield, RunwayML, Creatomate,
│   │                                      InVideo, Veed.ai, Kling AI)
│   │                                    Research APIs (Claude, Perplexity, YouTube)
│   │                                    Storage (Drive, Sheets, GitHub)
│   │                                    Laptop-native tools (30+ tools)
│   │                                    Integration patterns (Telegram→n8n,
│   │                                      n8n→Paperclip, Hermes→n8n)
│   │
│   └── INFRASTRUCTURE.md             ← LAYER 5: Architecture
│                                        Network topology diagram
│                                        Master Docker Compose (20+ services)
│                                        UFW firewall rules
│                                        .env template
│                                        Backup strategy
│                                        VPS setup checklist (5 phases)
│                                        Laptop DR checklist
│
└── dashboard/
    └── DASHBOARD.md                   ← LAYER 5: Dashboard spec
                                         10 panels (health, approvals, pipeline,
                                           agents, domains, KPIs, costs, CRM,
                                           activity log, team actions)
                                         Paperclip-powered data backbone
                                         Implementation: Retool/AppSmith → Custom React
                                         Monitoring: Portainer, Dozzle, Uptime Kuma, Netdata
```

---

## HOW TO LOAD INTO CLAUDE PROJECT

### Step 1: Create Project
- claude.ai → Projects → New Project
- Name: "PRRS Global Enterprise — Pawi"

### Step 2: Set System Prompt
- Project Instructions → paste entire contents of `claude-md/CLAUDE.md`

### Step 3: Upload Knowledge Files
Upload all remaining .md files:
- claude-md/PROJECT-CLAUDE.md
- skills/SKILLS.md
- hooks/HOOKS.md
- subagents/SUBAGENTS.md
- plugins/PLUGINS.md
- plugins/INFRASTRUCTURE.md
- dashboard/DASHBOARD.md

### Step 4: Test
- "What is my current sprint?" → Should know: Phase 1 foundation, pre-VPS
- "I want to start channel 3" → Scope creep hook should fire
- "Give me a CrewAI crew for YouTube" → Full crew with Paperclip + Reporting Agent
- "Where does n8n run?" → Should clarify: laptop now, VPS when live
- "Who handles digital products?" → Ruchi (P3)

---

## HOW TO UPDATE

**Option A:** Edit in Claude Project directly → Save → immediate effect
**Option B:** Edit .md in VS Code → push to GitHub → re-upload to Claude Project
**Option C:** Ask Claude: "Update CLAUDE.md to add [new tool/change]" → copy back to Project

**Rule:** One master project. Don't split across multiple projects.

---

## TEAM

| Person | Role | Focus |
|--------|------|-------|
| **Pawi (P1)** | Founder & Technical Lead | Architecture, AI agents, content strategy, final approvals |
| **Rudra (P2)** | System Ops & AI Research | Monitoring, security, connections, tokens, tool R&D |
| **Ruchi (P3)** | Digital Products Lead | EasySkillup products, distribution, sales, marketing |

---

## CURRENT STATUS

| Item | Status |
|------|--------|
| Business stage | Pre-revenue, foundation build |
| Active sprint | Phase 1: Foundation (laptop, pre-VPS) |
| Sprint 1 channels | Cybersecurity + Brand Documentary |
| VPS | Contabo Cloud VPS 30 — procurement next month |
| Stack (active) | n8n (laptop), Claude.ai + MCP apps, various AI subscriptions |
| Stack (planned) | Full Docker stack on VPS (20+ services) |
| GitHub | Repo exists: https://github.com/pawan0631/YT-ai-automation-hub |
| First revenue target | Month 5–7 (AdSense YPP) + consulting month 3+ |

---

## VERSION HISTORY

| Version | Date | Summary |
|---------|------|---------|
| v1.0 | 2026-05 | Initial — YouTube only, "EasySkillup", Oracle Cloud, Rudra as founder |
| v2.0 | 2026-05 | Expanded — 4 domains, Contabo VPS, CrewAI+Paperclip+Hermes, still Rudra as founder |
| v3.0 | 2026-05-30 | **Consolidated** — Correct identity (Pawi), PRRS Global brand, 8 domains, 12 skills, 12 hooks, Paperclip as enterprise backbone, full laptop inventory, honest sprint status, GitHub strategy |
