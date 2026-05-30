# HOOKS.md — Guardrail Layer v3.0
# Event-driven automatic checks and enforcement rules
# Dual-node aware: Laptop (Command Center + DR) + VPS (Production Engine)
# Enterprise: PRRS Global | Team: Pawi (P1), Rudra (P2), Ruchi (P3)

---

## HOOK: SessionStart — Context & Node Loader
**Fires:** Start of every conversation

```
AUTO-LOAD:
□ Enterprise: PRRS Global — 8 business domains, 3-person team
□ Current sprint: Phase 1 — Foundation (Laptop, pre-VPS)
□ Active channels: Cybersecurity + Brand Documentary (Sprint 1)
□ Infra: Laptop (Win11, command center + DR) + Contabo Cloud VPS 30 (planned next month)
□ Stack: n8n (local now, VPS later) + Dify + CrewAI + Paperclip + Hermes + LiteLLM + Ollama
□ Paperclip: Enterprise task management + agent memory (core service on VPS)
□ Team: Pawi (architect), Rudra (sys ops/security), Ruchi (digital products/EasySkillup)
□ Human rule: Humans approve/decide — AI agents produce/execute/report
□ Brand: PRRS Global | Naming: PRRS_[Domain]_[AssetType]_[Topic]

If technical question → ask: "Is this for the VPS or laptop?"
If agent question → ask: "Does this crew have Paperclip tracking configured?"
If content question → ask: "Which channel and language (EN/HI)?"
```

---

## HOOK: PreToolUse — Node Clarity Gate
**Fires:** Any time a tool, install, config, or code is being recommended

```
BEFORE giving any technical instruction:
□ Which node does this run on? (VPS / Laptop / Cloud)
□ Is VPS even live yet? (if not → laptop-only or manual approach)
□ Is there a laptop fallback if VPS is down?
□ Does it need a new Docker service? (if yes → note port + add to compose)
□ Does it need a new VPS port open? (if yes → UFW rule required)
□ Is this accessible from laptop browser/RDP?
□ Does Pawi need GUI steps? (low-code preference)

Format all technical outputs with [VPS] / [LAPTOP] / [CLOUD] prefixes
If VPS not yet live → provide laptop/manual alternative first
```

---

## HOOK: PreToolUse — API & Cost Gate
**Fires:** Any new paid tool, API, or subscription mentioned

```
BEFORE recommending any new tool addition:
□ Monthly cost in USD and INR (₹83/$1)
□ Is there a free tier or self-hosted alternative?
□ Can existing stack handle this? (n8n + Dify + CrewAI + Ollama + LiteLLM)
□ Which domain/revenue stream does this enable?
□ Does it duplicate a tool already in the stack?

Current subscriptions (pre-committed):
  Contabo Cloud VPS 30:   ~$14–20/month (3 months)
  Google Gemini Pro:       ₹1,950/month (18 months)
  Claude Max:              [subscription — active]
  ChatGPT Pro:             [subscription — active]
  Grok Pro:                [subscription — active]
  Canva Pro:               [subscription — 3 months]

API-based tools (3-month commitment):
  ElevenLabs, HeyGen, Higgsfield, RunwayML, InVideo,
  Veed.ai, Creatomate, Perplexity — costs vary by usage

Flag if: new tool duplicates existing capability without clear advantage
Flag if: total monthly API spend exceeds subscription savings
```

---

## HOOK: PreToolUse — Agent Design Gate
**Fires:** Any new CrewAI crew, Paperclip config, or Hermes deployment being designed

```
BEFORE finalizing any agent design:
□ Is Paperclip tracking configured? (MANDATORY for all crews)
□ Is a Reporting Agent included? (MANDATORY)
□ What is the reporting cadence? (daily / per-task / weekly)
□ How does the crew report to Paperclip enterprise dashboard?
□ How does n8n trigger this crew?
□ What is the callback when crew completes?
□ What requires human approval in this crew's output?
□ Which approval gates (1–10) apply?
□ Who gets the Telegram notification? (Pawi / Rudra / Ruchi)

If Reporting Agent is missing → refuse to finalize crew design
If Paperclip config is missing → refuse to deploy crew
```

---

## HOOK: PreToolUse — Scope Creep Detector
**Fires:** New channel, new domain, or new feature discussed before Sprint 1 completes

```
ACTIVE SPRINT GATE:
Sprint 1: Cybersecurity + Brand Documentary channels — end-to-end pipeline

If request involves:
  - Starting channel 3–8 before channels 1–2 are live and publishing
  - Activating domains 3–8 before domain 1 pipeline is tested
  - "Nice to have" features before first video is published
  - Adding new agent frameworks before existing ones are deployed
  - Building SaaS products before YouTube revenue exists

→ ASK: "Are the Cybersecurity and Brand Documentary pipelines fully end-to-end tested with published videos?"
→ If NO: Redirect to Sprint 1 completion first
→ If YES: Green light for expansion

Exceptions (these ARE part of current sprint):
  - Paperclip enterprise setup (needed for task management)
  - VPS setup and core service deployment (infrastructure)
  - n8n workflow building (foundation layer)
  - GitHub repo setup (source of truth)
```

---

## HOOK: PreToolUse — Productive Procrastination Check
**Fires:** Extended planning, redesign, or research before first deliverable is live

```
PROCRASTINATION PATTERNS:
- "Let me plan all 8 domains before building domain 1"
- "Should I redesign the whole architecture before testing?"
- "I want to research all possible agent frameworks first"
- Designing CrewAI crews for channels that aren't built yet
- Configuring Hermes for clients before having any clients
- Building SaaS tools before first YouTube video is published
- Perfecting the dashboard before there's data to display

REDIRECT: "What's the minimum viable version we can test this week?"
RULE: Build → Test → Report → Iterate
      (not: Plan → Plan → Research → Redesign → Plan → Build)
```

---

## HOOK: PostToolUse — Revenue Reality Check
**Fires:** After any monetization projection, business plan, or revenue discussion

```
AUTO-APPLY to every projection:
  Indian audience CPM:    ₹100/1000 views ($1.20 USD)
  Global English CPM:     ₹330/1000 views ($4 USD)
  YPP timeline:           5–7 months realistic (add 2-month buffer)
  First 3 months revenue: ₹0 (assume zero — build phase)
  Consulting revenue:     Month 3+ earliest (Indian market)
  Digital products:       Month 4+ earliest (need audience first)
  SaaS revenue:           Month 6+ earliest (need product + users)

Always output 3 scenarios:
  🐻 Bear:  Things go slower — what's the floor?
  📊 Base:  Moderate growth — realistic middle
  🚀 Bull:  Everything works — clearly labeled optimistic

NEVER present only Bull case. Always lead with Base.
```

---

## HOOK: Stop — Output Security Validator
**Fires:** Before delivering any workflow JSON, Docker config, script, or agent code

```
SECURITY CHECKLIST:
□ No raw API keys in any output (use credential references / .env vars)
□ No hardcoded VPS IP addresses in shared files
□ No hardcoded passwords or tokens
□ Docker configs have restart: unless-stopped policies
□ New VPS ports have UFW rule defined
□ n8n workflows have error handling nodes
□ CrewAI agents have rate limiting / retry logic
□ Paperclip configs don't store PII beyond project scope
□ No credentials visible in Telegram notifications
□ GitHub commits never contain secrets

For Docker Compose:
□ Sensitive values → .env file (not in compose YAML)
□ Volumes defined for persistent data
□ Network isolation: internal vs external services
□ Monitoring services accessible only via Tailscale/localhost
```

---

## HOOK: SubagentStop — Output Quality Gate
**Fires:** After any script, proposal, report, or agent output is generated

```
CONTENT QUALITY:
□ Scripts: [B-ROLL CUE] every 45–60s, [AVATAR SEGMENT] markers, CTA in outro
□ Scripts: 2,200–2,800 words for long-form, 300–500 for shorts
□ Scripts: Hook in first 30 seconds
□ Hindi versions: culturally adapted, not just translated
□ Proposals: 3 pricing tiers (Basic / Professional / Enterprise)
□ Reports: Bear/Base/Bull for any financial projection
□ Agent designs: Reporting Agent present, Paperclip config defined
□ Workflows: Error node present, credential references (not raw keys)
□ Blog posts: SEO keywords, meta description, social share text included
□ Digital products: SI_DP naming, distribution platform specified

BRAND SAFETY:
□ No unverified claims in cybersecurity content (educational/defensive only)
□ No exploit, malware, or abuse instructions in any content
□ No copyrighted footage/music references without licensing note
□ No competitor disparagement in consulting proposals
□ Enterprise output uses "PRRS Global" branding. Digital products use "EasySkillup" branding. Reject "Digital Marketing Academy" or "SkillIndia"
□ Source-backed wording for business/brand documentary content — avoid defamation risk
```

---

## HOOK: VPS Unreachable — Fallback Activator
**Fires:** When VPS connectivity issue is mentioned or suspected

```
LAPTOP DR CHECKLIST (Pawi executes from command center):
□ n8n Desktop / Docker Desktop — light workflow triggers
□ Claude.ai / ChatGPT / Gemini browser — manual script generation
□ Google Sheets — Content Calendar still accessible
□ Telegram — still receiving notifications
□ CapCut / DaVinci Resolve — manual video editing
□ Canva Pro — digital product creation
□ Gmail + Claude drafts — client communication
□ LM Studio / AnythingLLM — local AI if internet spotty
□ Obsidian — knowledge base accessible offline
□ Dashboard — check cached last-known state in browser

RECOVERY CHECKLIST (when VPS restored):
1. Check n8n execution log for failed workflows
2. Check Dify for incomplete agent runs
3. Check CrewAI crew statuses
4. Check Paperclip — any task tracking gaps?
5. Re-run any failed pipeline steps
6. Confirm Telegram approval queue cleared
7. Update Paperclip enterprise dashboard
8. Rudra (P2) validates system health before resuming production
```

---

## HOOK: Brand Integrity Validator
**Fires:** All document, metadata, and asset generation

```
NAMING ENFORCEMENT:
□ All assets follow PRRS_[Domain]_[AssetType]_[Topic] convention
□ Reject any output using "SkillIndia" or "Digital Marketing Academy" as enterprise name
□ Auto-correct enterprise refs to "PRRS Global", product refs to "EasySkillup"
□ Domain codes: YT, DP, SAAS, BLOG, SEC, CON, AD
□ Channel names consistent with Content Calendar schema

TEAM REFERENCES:
□ Pawi = P1 (Founder/Architect)
□ Rudra = P2 (System Ops)
□ Ruchi = P3 (Digital Products)
□ Never mix up team roles in proposals or reports
```

---

## HOOK: Approval Gate Router
**Fires:** When a production task hits an approval checkpoint

```
ROUTING RULES:
Gate 1 (Topic):          → Pawi via Telegram
Gate 2 (Research):       → Pawi via Telegram
Gate 3 (Script):         → Pawi via Telegram
Gate 4 (Hindi style):    → Pawi via Telegram (ONE-TIME per channel)
Gate 5 (Voice choice):   → Pawi via Telegram (ONE-TIME per channel)
Gate 6 (Visual style):   → Pawi via Telegram
Gate 7 (Rough cut):      → Pawi + Rudra via Telegram
Gate 8 (Final cut):      → Pawi via Telegram
Gate 9 (Upload metadata):→ Pawi via Telegram
Gate 10 (Compliance):    → Pawi via Telegram

Digital Product gates:   → Ruchi via Telegram (P3 leads domain 5)
System/Security issues:  → Rudra via Telegram (P2 handles ops)
Architecture decisions:  → Pawi via Telegram (P1 final call)

One-time gates: once approved for a channel, auto-apply to all future videos on that channel
Per-video gates: require fresh approval every time
```
