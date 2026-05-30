# CLAUDE.md — Global Constitution v3.0
# PRRS Global AI-Powered Enterprise
# Infrastructure: Laptop (Command Center + DR) + Contabo Cloud VPS 30 (Production Engine)
# Framework: Agent Development Kit — 5-Layer Architecture
# Consolidated: 2026-05-30

---

## WHO YOU ARE WORKING WITH

**Pawi (P1)** — Founder, Technical Lead & Enterprise Architect
- Experience: 20+ years — systems administration, network engineering, cloud infrastructure, cybersecurity, information security, audit, compliance (ISO 27001, NIST, SOC2, GDPR, DPDPA), privacy frameworks, AI security, risk management
- Location: Delhi, India
- Working style: GUI-first, visual workflows, low-code/no-code orchestration. Can integrate libraries, JSON files, and configs but prefers visual pipeline builders over bare CLI
- Active subscriptions: Claude Max, ChatGPT Pro, Grok Pro, Google Gemini Pro (18 months), Canva Pro
- Role: Final technical decisions, architecture, AI agent design, content strategy, procurement

**Rudra (P2)** — System Operations & AI Research Lead
- Role: System monitoring, security operations, connection management, AI token/quota management, new AI tools research and evaluation, tool addition to stack
- Status: Active

**Ruchi (P3)** — Digital Products Lead (EasySkillup / easyskillup.in)
- Role: Digital product creation, distribution strategy, sales and marketing automation, EasySkillup brand management
- Status: Active

**The Rule:** Humans review, approve, and decide. AI agents research, produce, build, and report. If an AI agent can do it, it does it.

---

## BRAND

**Enterprise Brand:** PRRS Global
**Digital Products Brand:** EasySkillup (https://easyskillup.in/)
  - Hosted on Hostinger (current), migrate to own server after Year 1
  - Lead: Ruchi (P3)
**Asset Naming Convention:** `PRRS_[Domain]_[AssetType]_[Topic]`
**Domain Codes:** YT (YouTube), DP (Digital Products), SAAS (SaaS), BLOG (Blog), SEC (Cybersecurity Services), CON (Consulting), AD (Video Ads)
**Examples:** PRRS_YT_Script_CyberHeist, PRRS_DP_Course_AIAutomation, PRRS_BLOG_Post_GDPRGuide

---

## DUAL-NODE INFRASTRUCTURE

### Node 1: Laptop — Command Center + DR Site
**Role:** Central command, monitoring, approvals, light production, disaster recovery for VPS, daily research on new AI tools

| Spec | Detail |
|------|--------|
| OS | Windows 11 |
| CPU | i7-8550U |
| RAM | 8 GB |
| Storage | 200 GB HDD |
| Interface | GUI-first |
| VPS Access | RDP (MobaXterm) + SSH, Tailscale mesh VPN |

**Installed Tools:**

| Category | Tools |
|----------|-------|
| AI Assistants | Claude.ai, ChatGPT, Codex, Perplexity, Manus, Grok, Google Gemini |
| AI Local | LM Studio, AnythingLLM, Open WebUI (light open-source LLMs) |
| Development | VS Code, GitHub Desktop, GitHub CLI, Docker Desktop |
| Video/Media | CapCut, DaVinci Resolve, FFmpeg, yt-dlp |
| Design | Canva Pro |
| Automation | n8n (local/fallback) |
| Knowledge | Obsidian, Zotero, Notion, Google AntiGravity (NotebookLM) |
| Monitoring | Uptime Kuma, Tailscale |
| Remote Access | MobaXterm (RDP/SSH to VPS) |
| Communication | Telegram Desktop |

**DR/Fallback Capability (when VPS unreachable):**
- Script generation via Claude.ai / ChatGPT
- Image gen via Google Imagen 4 (browser)
- Basic video assembly via CapCut
- Manual YouTube upload via YouTube Studio
- Client communication via Gmail + Claude drafts
- Digital product creation (PDFs, slides, course content)
- Light n8n workflows via Docker Desktop
- Blog drafts via AI assistants + manual publishing

### Node 2: Contabo Cloud VPS 30 — Production Engine (next month)
**Role:** Heavy AI workloads, 24/7 automation pipelines, video production, digital product generation, SaaS development, blog publishing
**Status:** Procurement planned — setup begins next month

| Spec | Detail |
|------|--------|
| Provider | Contabo Cloud VPS 30 |
| OS | Ubuntu 24.04 LTS |
| Desktop | XFCE4 + XRDP |
| Deployment | Docker Compose — all services containerized |
| Uptime | 24/7 production engine |
| Mesh VPN | Tailscale (laptop ↔ VPS secure link) |

**Core Services (always running):**

| Port | Service | Role |
|------|---------|------|
| 5678 | n8n | Master automation orchestrator |
| 3000 | Dify API | AI orchestration, RAG, prompt management |
| 3001 | Dify Web UI | Dify interface |
| 11434 | Ollama | Local LLMs (LLaMA, Mistral) |
| 4000 | LiteLLM | Model gateway — route to cheapest/best provider |
| 3002 | Open WebUI | Chat interface for local + remote models |
| 5432 | PostgreSQL | Shared DB |
| 6379 | Redis | Queue/cache layer |
| 8080 | Enterprise Dashboard | Unified reporting UI |
| 9090 | Portainer | Docker container management GUI |
| 8081 | Dozzle | Real-time container log viewer |
| 3003 | Uptime Kuma | Service health monitoring |
| 19999 | Netdata | System performance monitoring |

**Agent Services (start on demand):**

| Port | Service | Role |
|------|---------|------|
| 8888 | CrewAI | Multi-agent crew execution |
| 4001 | Paperclip AI | Agent memory + persistence |
| 5000 | Hermes AI | Client-facing conversational agent |

**Planned/Evaluating:**

| Service | Status | Notes |
|---------|--------|-------|
| OpenClaw | Evaluating | Not confirmed — assess after Dify is stable |
| Qdrant | Planned | Vector DB for RAG + agent memory |
| Supabase | Planned | Managed Postgres + auth + storage alternative |
| Proxy tools | Planned | Reverse proxy and SSL termination |

**Video/Production Tools (VPS — cloud API):**
HeyGen, Higgsfield, RunwayML, ElevenLabs, InVideo, Veed.ai, Creatomate, open-source video rendering tools, Claude API connection

---

## ENTERPRISE BUSINESS DOMAINS (8 Domains)

### Domain 1: YouTube Automation Studio (PRIMARY — Sprint 1)
Fully automated multi-channel AI video production — 6 confirmed channels + 2 in discussion.

**Sprint 1 Channels (active build):**

| # | Channel | Language | Niche |
|---|---------|----------|-------|
| 1 | Cybersecurity & Cyber Espionage | EN → HI | Cyber warfare, cybercrime, digital risk, defensive analysis |
| 2 | Business & Brand Documentary | EN → HI | Founders, brands, economic impact, rise/fall, lessons |

**Future Channels (activate after Sprint 1 is end-to-end):**

| # | Channel | Language | Niche |
|---|---------|----------|-------|
| 3 | Product Comparisons | EN | Tech/product reviews |
| 4 | History & Documentaries | EN → HI | Historical events, geopolitics |
| 5 | Children's Learning | HI | Educational content |
| 6 | Sports | EN → HI | Sports stories, analysis |
| 7-8 | TBD | TBD | In internal discussion |

**Format:** Long-form (15–18 min) + Shorts (2–8 min)
**Language:** English first → same content republished in Hindi
**Pipeline:** Research → Script → Translate → Voice → B-Roll → Avatar → Assembly → SEO → Publish
**Revenue:** AdSense, white-label production, sponsorships
**Safety:** Educational/defensive only for cybersecurity; source-backed for business; no exploit/malware/abuse content

### Domain 2: Multi-Platform Content Distribution
Repurpose YouTube content across all social platforms.
- Platforms: YouTube, Facebook, Instagram Reels, TikTok, LinkedIn, Twitter/X
- Formats: Long-form, Shorts/Reels, carousels, text posts, stories
- Automation: n8n workflows for cross-platform format adaptation, scheduling, publishing

### Domain 3: Video Ad Creation (UGC/VFX)
Commercial video production for brands and clients.
- UGC-style ads, VFX shorts, product showcases
- Brand-specific or customer-demand driven
- Revenue: Per-project fees, retainer packages

### Domain 4: AI Automation Consulting & Workflow Services
Productize internal capabilities for external clients.
- n8n + Dify workflow builds for SMBs
- YouTube automation setup-as-a-service
- Multi-agent implementations
- Cybersecurity audit automation consulting
- Target: Indian SMBs, IT companies, content creators, ed-startups

### Domain 5: Digital Products — EasySkillup (Ruchi-Led)
AI-powered digital product generation and distribution.
- Courses, workbooks, templates, SOPs
- Automated generation → distribution → sales → follow-up pipeline
- Platforms: Gumroad, Teachable, own website, Udemy
- Lead: Ruchi (P3)

### Domain 6: SaaS AI Tools & Software Development
Build and sell AI-powered micro-SaaS products.
- Internal tools productized for market
- Cybersecurity compliance automation tools
- Content generation tools for creators

### Domain 7: Blog & Content Publishing
Professional blogs on cybersecurity, privacy, AI.
- Topics: Cybersecurity awareness, privacy compliance (GDPR/DPDPA), AI tools, automation tutorials
- Platforms: Own website, Medium, LinkedIn articles, Dev.to
- Automation: Research → Draft → SEO → Publish → Social share

### Domain 8: Cybersecurity & Compliance Services
Leverage Pawi's 20+ years of domain expertise.
- Security awareness content production
- SMB security audit workflows
- Compliance documentation automation (ISO 27001, SOC2, NIST)
- Privacy consulting (GDPR, DPDPA, CCPA)
- AI security risk assessments

---

## MOBILE-FIRST COMMAND FLOW

```
Pawi/Rudra/Ruchi (Mobile — Telegram)
       │ trigger task / approve / instruct
       ▼
Agent Manager (n8n master orchestrator on VPS)
       │ classify task → assign to correct crew/agent
       ▼
Sub-Agents (CrewAI crews / Dify agents)
       │ connect to resources (APIs, Drive, tools)
       │ execute production tasks
       ▼
Output → Shared Drive (Google Drive)
       │
Report → Agent Manager
       │ task status + system health
       ▼
Telegram notification → Team mobile
       │ "Task completed" or "Issue — needs attention"
       ▼
Team responds: approval / guidance / new instructions
```

**Primary command channel:** Telegram (now)
**Planned addition:** WhatsApp (future)

---

## HUMAN APPROVAL GATES (Video Production)

| # | Gate | Type | Approver |
|---|------|------|----------|
| 1 | Topic and angle | Per-video | Pawi |
| 2 | Research dossier | Per-video | Pawi |
| 3 | English script | Per-video | Pawi |
| 4 | Hindi adaptation style | One-time per channel | Pawi |
| 5 | Voice choice | One-time per channel | Pawi |
| 6 | Visual style | Per-video | Pawi |
| 7 | Rough cut | Per-video | Pawi/Rudra |
| 8 | Final cut | Per-video | Pawi |
| 9 | Upload metadata (title, desc, tags) | Per-video | Pawi |
| 10 | Compliance review | Per-video | Pawi |

One-time gates (4, 5) are approved once per channel, then auto-applied to all future videos on that channel.

---

## GITHUB INTEGRATION STRATEGY

**Approach:** GitHub = source of truth, Claude Projects = working copy, n8n = automation layer
**Connected via:** Claude.ai MCP (GitHub), GitHub Desktop (laptop), git CLI (VPS)

**Repo:** https://github.com/pawan0631/YT-ai-automation-hub
```
/adk/                  — This Agent Development Kit (version-controlled)
/n8n-workflows/        — All workflow JSONs
/crewai-crews/         — Crew Python files
/dify-agents/          — Agent DSL YAMLs
/prompts/              — Master prompt library
/docker/               — Docker Compose files + .env template
/docs/                 — Architecture docs, SOPs
/blog-content/         — Blog drafts and published content
/digital-products/     — Product templates and assets
```

**Workflow:** Edit in VS Code → push to GitHub → upload updated file to Claude Project
**Automation (when VPS live):** n8n listens to GitHub webhooks → triggers relevant agent workflows
**Rule:** Never commit secrets, tokens, API keys, or credentials. Use .env files and credential references only.

---

## REPORTING SYSTEM

**Daily (auto, 8am IST → Telegram + Dashboard):**
Pipeline status, business development, system health, action items needing human decision

**Weekly (Monday 9am IST → Google Sheets + Telegram):**
Channel KPIs, revenue tracking, cost tracking, top issues, next week plan

**Dashboard (VPS :8080, laptop browser access):**
Pipeline board, agent status, approval queue, cost meter, channel KPIs, CRM, activity log

---

## RESPONSE PREFERENCES

- Always clarify Laptop vs VPS context before giving technical instructions
- Mark all code/configs with [VPS] / [LAPTOP] / [CLOUD] prefixes
- Show costs in USD + INR (₹83/$1)
- Revenue projections always in Bear/Base/Bull scenarios
- Hindi content pipeline = same as English + translation/adaptation step
- Tone: Mentor-level — flag risks, challenge assumptions, redirect procrastination
- Format: Complete, importable output — no pseudocode, no placeholders
- Security: Never expose API keys, VPS IPs, or credentials in output

---

## STANDING GUARDRAILS (summary — full rules in HOOKS.md)

1. **Scope creep** — no new channels/domains until Sprint 1 (Cyber + Brand) is end-to-end live
2. **Productive procrastination** — build and test before over-planning
3. **Revenue realism** — Indian CPM ₹100 base, always 3-scenario projections
4. **Cost gate** — new paid tool needs ROI justification against subscriptions
5. **Human boundary** — humans approve and decide; AI produces and reports
6. **Node clarity** — always specify VPS vs Laptop vs Cloud before any instruction
7. **Agent reporting** — every crew/agent must include a Reporting Agent
8. **Memory persistence** — configure Paperclip before any long-running crew
9. **Security compliance** — no credentials in output, UFW rules for new ports
10. **Multilingual pipeline** — translation step mandatory for Hindi versions
11. **Naming enforcement** — all assets follow PRRS_[Domain]_[AssetType]_[Topic] convention
12. **Brand integrity** — enterprise uses "PRRS Global", digital products use "EasySkillup" (easyskillup.in)
