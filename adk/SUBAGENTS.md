# SUBAGENTS.md — Delegation Layer v3.0
# Full Enterprise AI Agent Workforce
# All crews run on VPS (Contabo Cloud VPS 30) unless marked otherwise
# Enterprise: PRRS Global | Task tracking: Paperclip (core)

---

## ARCHITECTURE OVERVIEW

```
HUMAN CORE (3 people)
  Pawi (P1) — architecture, strategy, approvals
  Rudra (P2) — sys ops, security, AI tool R&D
  Ruchi (P3) — digital products, EasySkillup brand
       │
       ▼ (approve, decide, validate via Telegram)
   n8n ORCHESTRATOR (VPS :5678)
       │
   ┌───┴───────────────────────────┐
   │                               │
DIFY AGENT LAYER              CREWAI CREWS
(VPS :3000)                   (VPS :8888)
   │                               │
   └───── PAPERCLIP ENTERPRISE ────┘
          (VPS :4001 — always running)
          Task management + Agent memory
          Daily/Weekly/Monthly dashboards
                   │
           LiteLLM MODEL GATEWAY
           (VPS :4000 — route to best/cheapest model)
                   │
           HERMES AI FRONTEND
           (VPS :5000 — client-facing)
                   │
           CLIENT / CUSTOMER
```

**Mobile command flow:**
```
Team (Telegram) → n8n webhook → classify task →
  → CrewAI crew OR Dify agent →
  → execute using APIs/tools →
  → output to Google Drive →
  → update Paperclip task board →
  → report back via Telegram
```

---

## CREWAI CREW 1: YouTube Production Crew
**Triggers:** n8n POST to /crew/run with crew="youtube_production"
**Domains served:** Domain 1 (YouTube), Domain 2 (Multi-platform)
**Reports to:** Paperclip daily + Telegram
**Paperclip:** Required — topic history, style learnings, channel performance

### Agents
```python
research_agent = Agent(
    role='YouTube Research Specialist',
    goal='Find compelling, unique angles for video topics that gap competitors',
    backstory='Expert in viral content strategy, cybersecurity, and documentary topics',
    tools=[perplexity_tool, web_search_tool, sheets_read_tool],
    memory=True,
    verbose=True
)

script_agent = Agent(
    role='Cinematic Documentary Script Writer',
    goal='Write engaging 2,500-word scripts with B-roll cues, avatar segments, and strong hooks',
    backstory='Documentary writer trained on National Geographic and Vice-style narration',
    tools=[claude_sonnet_tool, drive_write_tool],
    memory=True
)

translation_agent = Agent(
    role='Hindi Adaptation Specialist',
    goal='Culturally adapt English scripts to Hindi — not just translate, but localize',
    backstory='Bilingual content specialist who understands Indian audience preferences',
    tools=[claude_sonnet_tool, drive_write_tool],
    memory=True
)

seo_agent = Agent(
    role='YouTube SEO Specialist',
    goal='Generate click-worthy titles, keyword-rich descriptions, and thumbnail briefs',
    backstory='YouTube growth expert for documentary and educational content',
    tools=[claude_haiku_tool, sheets_write_tool],
    memory=False
)

qa_agent = Agent(
    role='Content Quality Reviewer',
    goal='Ensure every video package passes brand safety, accuracy, and compliance',
    backstory='Senior content editor with cybersecurity accuracy expertise and YouTube demonetization knowledge',
    tools=[drive_read_tool, forms_write_tool],
    memory=False
)

reporting_agent = Agent(
    role='Production Status Reporter',
    goal='Update Paperclip task board and send production reports to team',
    tools=[telegram_tool, paperclip_update_tool, sheets_write_tool],
    memory=True
)
```

### Tasks (sequential)
```
1. research_task      → research_agent     → topic brief JSON
2. script_task        → script_agent       → full script in Google Drive
3. translation_task   → translation_agent  → Hindi version in Google Drive
4. seo_task           → seo_agent          → titles, description, tags in Sheets
5. qa_task            → qa_agent           → PASS/FAIL with notes
6. report_task        → reporting_agent    → Paperclip update + Telegram notify
```

---

## CREWAI CREW 2: Business Development Crew
**Triggers:** Hermes intake complete → n8n webhook → CrewAI
**Domains served:** Domain 4 (Consulting), Domain 8 (Cybersecurity Services)
**Reports to:** Paperclip weekly + Telegram per-lead
**Paperclip:** Required — client preferences, deal history, proposal templates

### Agents
```python
lead_research_agent = Agent(
    role='B2B Lead Researcher',
    goal='Find and qualify potential clients for AI automation and cybersecurity services',
    tools=[perplexity_tool, web_search_tool],
    memory=True
)

proposal_agent = Agent(
    role='Proposal Writer',
    goal='Write persuasive proposals with 3 pricing tiers tailored to each client brief',
    tools=[claude_sonnet_tool, drive_write_tool, sheets_read_tool],
    memory=True
)

outreach_agent = Agent(
    role='Outreach Copywriter',
    goal='Write personalized cold outreach emails and LinkedIn messages',
    tools=[claude_haiku_tool, gmail_draft_tool],
    memory=False
)

followup_agent = Agent(
    role='Follow-up Sequence Manager',
    goal='Manage automated follow-up sequences for proposals and leads',
    tools=[gmail_draft_tool, sheets_update_tool, telegram_tool],
    memory=True
)

reporting_agent = Agent(
    role='Business Pipeline Reporter',
    goal='Track all leads, proposals, and deal status in Paperclip + weekly Telegram report',
    tools=[telegram_tool, paperclip_update_tool, sheets_write_tool],
    memory=True
)
```

---

## CREWAI CREW 3: Digital Products & EasySkillup Crew
**Triggers:** Manual trigger from n8n / scheduled / Ruchi request via Telegram
**Domains served:** Domain 5 (Digital Products)
**Reports to:** Paperclip weekly + Telegram to Ruchi (P3)
**Paperclip:** Required — curriculum knowledge, product catalog, sales data
**Lead:** Ruchi (P3)

### Agents
```python
curriculum_agent = Agent(
    role='Education Content Researcher',
    goal='Research and outline educational content for courses and workbooks',
    tools=[perplexity_tool, web_search_tool, drive_read_tool],
    memory=True
)

content_writer_agent = Agent(
    role='Educational Content Writer',
    goal='Write engaging educational content and course materials',
    tools=[claude_sonnet_tool, drive_write_tool],
    memory=True
)

product_builder_agent = Agent(
    role='Digital Product Assembler',
    goal='Convert content into structured digital products (PDFs, slides, workbooks)',
    tools=[canva_tool, drive_write_tool],
    memory=False
)

distribution_agent = Agent(
    role='Product Distribution Manager',
    goal='Upload and configure products on Gumroad, Teachable, and other platforms',
    tools=[gumroad_tool, sheets_update_tool],
    memory=False
)

reporting_agent = Agent(
    role='Product Pipeline Reporter',
    goal='Track product creation status and sales metrics in Paperclip',
    tools=[telegram_tool, paperclip_update_tool, sheets_write_tool],
    memory=True
)
```

---

## CREWAI CREW 4: Blog & Content Publishing Crew
**Triggers:** Scheduled weekly / manual trigger / topic from content calendar
**Domains served:** Domain 7 (Blog)
**Reports to:** Paperclip weekly + Telegram
**Paperclip:** Required — published topics, SEO performance, platform metrics

### Agents
```python
blog_research_agent = Agent(
    role='Blog Topic Researcher',
    goal='Identify trending topics in cybersecurity, privacy, and AI for blog content',
    tools=[perplexity_tool, web_search_tool],
    memory=True
)

blog_writer_agent = Agent(
    role='Technical Blog Writer',
    goal='Write SEO-optimized, expert-level blog posts on cybersecurity, privacy, and AI topics',
    backstory='Technical writer with 20+ years of cybersecurity and compliance knowledge base',
    tools=[claude_sonnet_tool, drive_write_tool],
    memory=True
)

seo_blog_agent = Agent(
    role='Blog SEO Optimizer',
    goal='Optimize posts for search, generate meta descriptions, and social share text',
    tools=[claude_haiku_tool, sheets_write_tool],
    memory=False
)

publishing_agent = Agent(
    role='Multi-Platform Publisher',
    goal='Publish approved blog posts across website, Medium, LinkedIn, and Dev.to',
    tools=[web_publish_tool, sheets_update_tool],
    memory=False
)

reporting_agent = Agent(
    role='Content Publishing Reporter',
    goal='Track published content and performance metrics in Paperclip',
    tools=[telegram_tool, paperclip_update_tool, sheets_write_tool],
    memory=True
)
```

---

## CREWAI CREW 5: Ops & Reporting Crew (MASTER)
**Triggers:** Scheduled daily (8am IST) + on error events + weekly (Monday 9am)
**Domains served:** ALL — enterprise-wide operations
**Reports to:** Paperclip (always) + Telegram (daily/weekly) + Dashboard
**Paperclip:** Required — historical performance data, cost trends, system health logs

### Agents
```python
cost_monitor_agent = Agent(
    role='API & Subscription Cost Monitor',
    goal='Track all API spend and subscription costs, flag overruns, suggest optimizations',
    tools=[sheets_read_tool, api_billing_tools, telegram_tool, paperclip_update_tool],
    memory=True
)

pipeline_health_agent = Agent(
    role='Pipeline Health Monitor',
    goal='Detect failed workflows, stuck agents, system issues across all domain pipelines',
    tools=[n8n_api_tool, crewai_api_tool, vps_monitor_tool, paperclip_update_tool],
    memory=True
)

channel_metrics_agent = Agent(
    role='YouTube Analytics Tracker',
    goal='Pull channel KPIs vs YPP targets and content performance metrics',
    tools=[youtube_analytics_tool, sheets_write_tool, paperclip_update_tool],
    memory=True
)

weekly_report_agent = Agent(
    role='Enterprise Weekly Report Generator',
    goal='Compile comprehensive weekly report covering all 8 domains for the human core team',
    tools=[sheets_read_tool, drive_write_tool, telegram_tool, paperclip_update_tool],
    memory=True
)
```

### Daily Report Template (8am IST → Telegram)
```
📊 PRRS GLOBAL DAILY REPORT — [DATE]

🎬 YOUTUBE PIPELINE
✅ Done: [N] videos/scripts completed
🔄 In progress: [list with status]
❌ Blocked: [items needing human input]

💼 BUSINESS & PRODUCTS
📨 Leads: [N] | Proposals: [N] | Products: [status]
💬 Hermes conversations: [N]

⚙️ SYSTEM HEALTH
💰 API spend today: $[X] (₹[X])
🔴 Failed workflows: [N]
✅ VPS uptime: [X]%

🚨 ACTION REQUIRED:
→ Pawi: [items]
→ Rudra: [items]
→ Ruchi: [items]
```

---

## DIFY AGENTS (Stateless — single-turn, VPS :3000)

### Script Refinement Agent
- Input: Draft script + style instructions
- Process: Improve narrative flow, strengthen hook, add B-roll cues
- Output: Refined script → Google Drive
- Used by: n8n after CrewAI script generation

### SEO Quick-Generator
- Input: Video title + keywords
- Process: Generate 5 title variants + description + tags
- Output: JSON → n8n → Google Sheets
- Used by: Quick SEO runs without full crew

### Client Brief Extractor
- Input: Raw Hermes conversation transcript
- Process: Extract service needed, budget, timeline, contact details
- Output: Structured JSON → n8n → CRM Sheets row
- Used by: After every Hermes intake conversation

### Error Analyzer
- Input: n8n error log + failed node details
- Process: Diagnose cause, suggest fix
- Output: Telegram message to Rudra (P2) with diagnosis + fix steps
- Used by: Auto-triggered on any workflow failure

### Blog SEO Optimizer
- Input: Draft blog post
- Process: Add keywords, meta description, social share text, internal links
- Output: SEO-optimized draft → Google Drive
- Used by: Blog Publishing Crew

---

## HERMES AI — Client-Facing Layer
**Node:** VPS :5000 (public via Cloudflare Tunnel)
**Channels:** Telegram bot (now), WhatsApp Business (planned)

### Conversation Flow
```
1. Greeting + qualification
   "Hi! I'm the PRRS Global assistant. Are you interested in YouTube automation,
    AI workflows, cybersecurity services, or digital products?"

2. Scope capture (adaptive)
   YouTube: "How many channels? Niche? Budget? Timeline?"
   Consulting: "What processes? Team size? Current tools?"
   Cybersecurity: "What compliance needs? Audit scope? Industry?"
   Digital Products: "What topic? Format? Target audience?"

3. Brief generation → Dify Brief Extractor → n8n webhook → CRM

4. Expectation setting
   "Your brief is with our team. Expect a detailed proposal within 24–48 hours."

5. Escalation routing:
   YouTube/Consulting/Cybersecurity → Rudra (P2) Telegram
   Digital Products/EasySkillup → Ruchi (P3) Telegram
   Architecture/Technical → Pawi (P1) Telegram

6. Post-delivery (via n8n):
   Day 3:  Satisfaction check
   Day 7:  Testimonial request
   Day 30: Upsell/retainer offer
```

---

## PAPERCLIP AI — Enterprise Backbone
**Node:** VPS :4001 (CORE — always running)
**Role:** Enterprise task management + agent memory + monitoring dashboard

### Enterprise Task Boards
```
/youtube/cyber/         → Cybersecurity channel pipeline (Kanban)
/youtube/brand/         → Brand Documentary channel pipeline
/youtube/[channel]/     → Future channels (activate when ready)
/products/skillindia/   → Digital product pipeline (Ruchi)
/consulting/pipeline/   → Client leads and deals
/blog/publishing/       → Blog content pipeline
/saas/development/      → SaaS product development
/security/services/     → Cybersecurity service delivery
/ops/costs/             → API spend tracking, subscription audit
/ops/system/            → Infrastructure health, known issues
```

### Monitoring Dashboards
```
Daily view:   Active tasks today, blockers, team action items
Weekly view:  Domain-by-domain progress, KPIs, costs
Monthly view: Revenue tracking, domain performance, growth metrics
```

### Agent Memory Namespaces
```
/memory/youtube/        → Topic history, style learnings, performance data
/memory/business/       → Client interactions, deal history, preferences
/memory/products/       → Product catalog, sales data, student feedback
/memory/blog/           → Published topics, SEO rankings, traffic data
/memory/ops/            → Cost trends, system decisions, tool evaluations
```

### Daily Memory Sync (2am IST)
```
□ Compress episodic memories older than 7 days into summaries
□ Sync all task boards to Google Drive /PRRS-Global/Memory/
□ Generate memory health report → Dashboard
□ Flag any tasks stuck >48 hours → Telegram alert
```

---

## LiteLLM — Model Gateway
**Node:** VPS :4000 (always running)
**Role:** Route AI requests to cheapest/best available model

### Routing Rules
```
High quality (scripts, proposals, QA):    → Claude Sonnet (API)
Speed/bulk (SEO, metadata, tagging):      → Claude Haiku (API)
Research (web-aware):                     → Perplexity / Gemini
Local pre-processing (filtering, drafts): → Ollama (LLaMA/Mistral)
Fallback (Claude quota hit):              → GPT-4o or Gemini
Cost optimization:                        → LiteLLM auto-routes based on cost/quality rules
```
