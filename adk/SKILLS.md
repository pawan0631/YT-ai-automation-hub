# SKILLS.md — Knowledge Layer v3.0
# 12 Domain Skills — Dual-Node Aware
# Brand: PRRS Global | Naming: PRRS_[Domain]_[AssetType]_[Topic]
# Node labels: [VPS] = Contabo Cloud VPS 30 | [LAPTOP] = Windows 11 Command Center | [CLOUD] = External

---

## SKILL 1: infrastructure-architect
**Triggers:** "which node", "where does this run", "VPS or laptop", "setup", "install", "Docker", "deploy", "Tailscale", "firewall"
**Node:** Both

Always clarify node before giving instructions:
- **VPS tasks:** n8n workflows, Dify agents, Ollama models, CrewAI crews, Paperclip enterprise tasks, Hermes bot, LiteLLM gateway, heavy API calls, 24/7 processes, video rendering, blog publishing
- **Laptop tasks:** Dashboard monitoring, approval decisions, CapCut/DaVinci editing, Canva products, VS Code editing, RDP to VPS, fallback light automation, AI tool research, Obsidian knowledge base
- **Cloud tasks:** All external APIs (ElevenLabs, HeyGen, RunwayML, etc.) — called FROM VPS primarily, laptop as fallback

**Output format for all technical instructions:**
```
[VPS] Install/configure on Contabo server:
  [commands/config]

[LAPTOP] What you do from Windows:
  [steps/access method]

[FALLBACK] If VPS unreachable:
  [laptop-only alternative]
```

**VPS standard paths:**
```
Docker configs:   /opt/docker/
n8n data:         /opt/n8n/
Dify:             /opt/dify/
Ollama:           /opt/ollama/
CrewAI:           /opt/crewai/
Paperclip:        /opt/paperclip/
Hermes:           /opt/hermes/
LiteLLM:          /opt/litellm/
Open WebUI:       /opt/openwebui/
Dashboard:        /opt/dashboard/
Backups:          /opt/backups/
Monitoring:       /opt/monitoring/
```

---

## SKILL 2: n8n-workflow-builder
**Triggers:** "build a workflow", "n8n flow", "automate this", "give me the JSON", "workflow for", "trigger"
**Node:** [VPS] primary, [LAPTOP] fallback/editing

Output = complete importable n8n workflow JSON. Always includes:
1. Trigger node (Sheets / Webhook / Schedule / Telegram)
2. Processing nodes (named PascalCase)
3. Error branch → "ErrorNotifyTelegram" node
4. Sticky note documentation nodes
5. No raw API keys — use named credential references only

**Standard credential names:**
```
"Google Sheets - PRRS Global"       → Google Sheets
"Google Drive - PRRS Global"        → Google Drive
"Anthropic - Claude API"           → Claude Sonnet/Haiku
"Perplexity API"                   → Research
"ElevenLabs API"                   → Voiceover
"HeyGen API"                       → Avatar video
"Higgsfield API"                   → Avatar video (alt)
"RunwayML API"                     → Video generation
"Creatomate API"                   → Video assembly
"Telegram Bot - PRRS Notifications"  → Alerts + approvals
"YouTube OAuth - Channel 1"        → Upload (Cybersecurity)
"YouTube OAuth - Channel 2"        → Upload (Brand Documentary)
"CrewAI API"                       → Agent crew triggers
"LiteLLM Gateway"                  → Model routing
```

**Workflow ID convention:** `PRRS-[CHANNEL]-[FUNCTION]-v[N]`
Examples: PRRS-CYBER-SCRIPT-v1, PRRS-BRAND-RESEARCH-v1, PRRS-OPS-DAILY-REPORT-v1

**n8n ↔ CrewAI pattern:**
```json
{
  "node": "HTTP Request",
  "name": "TriggerCrewAI",
  "method": "POST",
  "url": "http://localhost:8888/crew/run",
  "body": {
    "crew": "youtube_production",
    "inputs": { "topic": "{{$json.topic}}", "channel": "{{$json.channel}}" },
    "callback_webhook": "http://localhost:5678/webhook/crew-complete"
  }
}
```

**n8n ↔ Dify pattern:**
```json
{
  "node": "HTTP Request",
  "name": "CallDifyAgent",
  "method": "POST",
  "url": "http://localhost:3000/v1/workflows/run",
  "headers": { "Authorization": "Bearer {{$credentials.DifyAPIKey}}" },
  "body": {
    "inputs": { "topic": "{{$json.topic}}" },
    "response_mode": "blocking",
    "user": "n8n-automation"
  }
}
```

---

## SKILL 3: crewai-agent-designer
**Triggers:** "CrewAI crew", "multi-agent", "agent crew", "parallel agents", "crew for"
**Node:** [VPS] — Python service at /opt/crewai/

Every CrewAI crew design MUST include:
1. Agent definitions (role, goal, tools, memory=True/False)
2. Task definitions (description, expected_output, agent)
3. Crew config (process: sequential or hierarchical)
4. **Reporting Agent** (mandatory — no crew without it)
5. **Paperclip memory config** (mandatory for crews running >1 session)
6. n8n trigger definition (how n8n starts the crew)
7. Callback definition (how crew reports back to n8n/Paperclip/dashboard)

**Crew template:**
```python
from crewai import Agent, Task, Crew, Process

reporting_agent = Agent(
    role='Status Reporter',
    goal='Summarize crew work and send reports to Paperclip + Telegram',
    tools=[telegram_notify_tool, paperclip_update_tool, sheets_update_tool],
    verbose=True
)

reporting_task = Task(
    description='Generate status report. Include: tasks done, output locations, errors, time taken.',
    expected_output='JSON report → Paperclip task board + Telegram notification',
    agent=reporting_agent
)
# Always add reporting_task as the LAST task in every crew
```

---

## SKILL 4: paperclip-enterprise-manager
**Triggers:** "Paperclip", "task management", "enterprise dashboard", "daily tasks", "weekly monitor", "agent memory", "persistent memory", "task tracking"
**Node:** [VPS] — core service, always running

Paperclip serves TWO critical roles:
1. **Enterprise Task Management** — daily/weekly/monthly task structure, monitoring dashboard, progress tracking across all domains
2. **Agent Memory** — long-term memory for CrewAI crews, cross-session state, decision history

**Enterprise task structure:**
```yaml
# /opt/paperclip/configs/enterprise.yaml
enterprise_id: "skillindia-001"

# Task monitoring tiers
monitoring:
  daily:
    - youtube_pipeline_status
    - api_cost_tracking
    - system_health_check
    - agent_crew_status
  weekly:
    - channel_kpi_review
    - business_pipeline_review
    - cost_vs_budget_analysis
    - content_calendar_planning
  monthly:
    - revenue_projection_update
    - domain_activation_review
    - tool_subscription_audit
    - performance_retrospective

# Domain task boards
task_boards:
  youtube_production:
    columns: [PENDING, RESEARCHED, SCRIPTED, VOICED, ASSEMBLED, REVIEW, APPROVED, PUBLISHED]
  digital_products:
    columns: [IDEA, DRAFTING, REVIEW, PRODUCTION, DISTRIBUTION, LIVE]
  consulting:
    columns: [LEAD, PROPOSAL, NEGOTIATION, WON, DELIVERY, FOLLOW_UP]
  blog:
    columns: [TOPIC, DRAFTING, SEO_REVIEW, PUBLISHED, PROMOTED]
```

**Agent memory config template:**
```yaml
# /opt/paperclip/configs/[project].yaml
project_id: "[unique-id]"
memory_scope: "crew"
retention_days: 90
memory_types:
  episodic: true      # what happened, decisions made
  semantic: true      # facts learned, domain knowledge
  procedural: true    # what worked, best practices
sync_to_drive: "google_drive:/PRRS-Global/Memory/[project]/"
daily_summary: true
report_to_telegram: true
```

---

## SKILL 5: hermes-deployment
**Triggers:** "Hermes", "client bot", "intake bot", "customer chatbot", "client-facing agent"
**Node:** [VPS] — exposed via Cloudflare Tunnel

Hermes handles all inbound client communication before human escalation.

**Conversation flow:**
1. Greet and qualify (what service needed?)
2. Scope capture (adaptive to service type)
3. Generate structured brief → send to n8n webhook
4. Set expectation for human follow-up
5. Escalate to P2 (Rudra) or P3 (Ruchi) based on domain
6. Post-delivery: satisfaction check (day 3), testimonial (day 7), upsell (day 30)

**Escalation routing:**
- YouTube/Consulting/Cybersecurity inquiries → Rudra (P2) via Telegram
- Digital Products/EasySkillup inquiries → Ruchi (P3) via Telegram
- Architecture/Technical decisions → Pawi (P1) via Telegram

---

## SKILL 6: youtube-pipeline-operator
**Triggers:** "script for", "YouTube video", "run the pipeline", "produce a video", "channel production"
**Node:** [VPS] full pipeline, [LAPTOP] approval gate + fallback editing

**Script format (cinematic documentary):**
```
[HOOK — 0:00-0:30]        Cold open, most arresting fact first
[INTRO — 0:30-1:30]       Channel brand + topic setup
[B-ROLL CUE: description] Every 45–60 seconds throughout
[AVATAR SEGMENT: topic]   HeyGen/Higgsfield talking-head inserts
[MUSIC CUE: mood]         At major transitions
[ACT 1/2/3]               Narrative blocks
[OUTRO + CTA]             Subscribe + next video prompt
Target long-form: 2,500 words ±200 for 15–18 min
Target shorts: 300–500 words for 2–8 min
```

**Full pipeline sequence (VPS):**
```
Sheets Trigger → ResearchPerplexity → WriteScriptClaude →
[GATE: Script Approval] →
TranslateHindi (if bilingual) → [GATE: Hindi Approval (one-time)] →
GenerateVoiceElevenLabs → [GATE: Voice Choice (one-time)] →
GenerateAvatarHeyGen → GenerateBRollRunwayML →
AssembleVideoCreatomate → GenerateThumbnailImagen4 →
WriteSEOClaude → [GATE: Visual Style + Rough Cut + Final Cut] →
UploadYouTube → [GATE: Metadata + Compliance] →
PublishSchedule → UpdateSheets → NotifyTelegram →
CrossPostSocial (FB, Insta, TikTok, LinkedIn)
```

**Asset naming:** PRRS_YT_Script_[Topic], PRRS_YT_Audio_[Topic], PRRS_YT_Video_[Topic], PRRS_YT_Thumb_[Topic]

---

## SKILL 7: business-developer
**Triggers:** "client", "proposal", "pricing", "lead", "outreach", "consulting", "sell"
**Node:** Hermes (intake) + CrewAI Biz Dev Crew (VPS) + Team (close)

**Service pricing (India market baseline):**
```
YouTube automation setup (full pipeline):     ₹80,000–1,50,000 one-time
Monthly content production (per channel):     ₹25,000–50,000/month
n8n workflow build (simple):                  ₹15,000–30,000
n8n workflow build (complex multi-agent):     ₹50,000–1,00,000
AI consulting day rate:                       ₹15,000–25,000/day
EdTech/digital content package:               ₹40,000–80,000
Cybersecurity audit automation:               ₹1,00,000–2,50,000
Privacy compliance documentation:             ₹50,000–1,50,000
```

**Proposal structure (auto-generated by Biz Dev Crew):**
1. Executive summary
2. Scope of work (phased)
3. Timeline + milestones
4. Investment (3 tiers: Basic / Professional / Enterprise)
5. Tech stack brief (builds confidence)
6. Sample output / case study
7. Next steps + CTA

---

## SKILL 8: vps-admin
**Triggers:** "VPS", "Contabo", "Ubuntu", "Docker", "server setup", "SSH", "firewall", "port"
**Node:** [VPS] — Contabo Cloud VPS 30

Rules:
1. Explain every command before giving it
2. Mark risk: [LOW RISK] / [MEDIUM RISK] / [HIGH RISK — backup first]
3. Prefer docker-compose over raw docker commands
4. Always check UFW before opening ports
5. GUI alternative: Portainer (container management) via browser
6. Pawi has low-code preference — provide GUI steps when available

**Standard commands:**
```bash
cd /opt/docker/
docker-compose up -d            # start all services
docker-compose down             # stop all
docker-compose restart [service] # restart one
docker-compose logs -f [service] # follow logs
```

---

## SKILL 9: reporting-and-dashboard
**Triggers:** "report", "dashboard", "status", "how are agents doing", "weekly review", "cost tracking", "Paperclip dashboard"
**Node:** Paperclip dashboard (VPS, always running) + VPS :8080 web dashboard

**Reporting tiers:**
- **Real-time:** Paperclip task boards — live view of all domain pipelines
- **Daily (8am IST):** Auto Telegram digest — pipeline status, costs, blockers, action items
- **Weekly (Monday 9am IST):** Full enterprise review — KPIs, revenue, costs, issues, plan
- **Monthly:** Domain performance review, subscription audit, growth assessment

**Dashboard sections:**
System health bar, approval queue, YouTube pipeline Kanban, agent crew status, channel KPIs, cost tracker, business CRM, content calendar, activity log

---

## SKILL 10: digital-product-builder
**Triggers:** "digital product", "course", "PDF", "ebook", "workbook", "EasySkillup product", "Ruchi"
**Node:** [LAPTOP] for creation, [VPS] for automation
**Lead:** Ruchi (P3)

**Production workflow:**
1. Research → Claude.ai / Gemini generates outline + content
2. Design → Canva Pro for visual products
3. Slides → Google Slides / PowerPoint + AI content
4. Video → CapCut (laptop) for course video editing
5. Distribution → Gumroad / Teachable / own website
6. Automation → n8n: purchase → delivery → follow-up → upsell

**Product ideas:**
- "Build Your First AI Automation" (n8n starter course)
- Cybersecurity awareness workbook (school/corporate)
- YouTube automation SOP template pack
- AI tools guide for Indian educators
- Privacy compliance toolkit (GDPR/DPDPA)

**Naming:** PRRS_DP_Course_[Topic], PRRS_DP_Template_[Topic], PRRS_DP_Workbook_[Topic]

---

## SKILL 11: blog-publisher
**Triggers:** "blog", "article", "publish post", "Medium", "LinkedIn article", "Dev.to", "write about"
**Node:** [VPS] for automated pipeline, [LAPTOP] for manual drafting

**Blog pipeline:**
```
Topic Selection → ResearchPerplexity → DraftClaude →
SEOOptimize → [GATE: Review] → PublishToWebsite →
CrossPostMedium → CrossPostLinkedIn → CrossPostDevTo →
SocialShare → UpdateContentCalendar
```

**Blog topics (from Pawi's expertise):**
- Cybersecurity awareness and threat analysis
- Privacy compliance guides (GDPR, DPDPA, CCPA)
- AI security and risk management
- AI automation tutorials and tool reviews
- n8n workflow guides
- Industry compliance frameworks explained

**Naming:** PRRS_BLOG_Post_[Topic], PRRS_BLOG_Draft_[Topic]

---

## SKILL 12: saas-product-architect
**Triggers:** "SaaS", "software product", "build a tool", "micro-SaaS", "AI tool for sale"
**Node:** [VPS] for hosting, [LAPTOP] for development

**SaaS product categories:**
- Cybersecurity compliance automation tools
- Content generation tools for creators
- Workflow automation templates (n8n-based)
- AI-powered audit/reporting tools

**Tech approach (low-code friendly):**
- Frontend: Retool / AppSmith (no-code) or simple React
- Backend: n8n workflows as API endpoints + Dify agents
- Database: Supabase (when deployed)
- Auth: Supabase Auth or simple API keys
- Hosting: VPS (containerized)

**Naming:** PRRS_SAAS_[ProductName]_[Component]

---

## EXECUTION RULES (apply to all skills)

1. Always prioritize Windows-compatible GUI instructions for laptop tasks
2. Always use Docker Compose for VPS service deployment
3. Maintain PRRS_[Domain]_[AssetType]_[Topic] naming across all assets
4. Every automated workflow must have error handling + Telegram notification
5. Every agent crew must include Reporting Agent + Paperclip integration
6. All costs shown in USD + INR (₹83/$1)
7. Revenue projections always Bear/Base/Bull
8. No raw credentials in any output — use .env references
9. Hindi content follows same pipeline as English + translation step
10. Paperclip tracks all tasks across all domains — single source of truth for enterprise status
