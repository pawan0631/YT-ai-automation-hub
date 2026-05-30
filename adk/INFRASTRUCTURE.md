# INFRASTRUCTURE.md — Dual-Node Architecture v3.0
# Laptop (Command Center + DR) + Contabo Cloud VPS 30 (Production Engine)
# Networking: Tailscale mesh VPN + Cloudflare Tunnel (public services)

---

## NETWORK TOPOLOGY

```
┌──────────────────────────────────────────────────────────────────────┐
│                    PRRS GLOBAL ENTERPRISE NETWORK                      │
│                                                                      │
│  ┌─────────────────┐   Tailscale VPN   ┌──────────────────────────┐ │
│  │   LAPTOP         │◄────────────────►│   CONTABO CLOUD VPS 30   │ │
│  │   (Windows 11)   │   RDP / SSH      │   (Ubuntu 24.04)         │ │
│  │                  │                   │                          │ │
│  │  Command Center  │                   │  Production Engine       │ │
│  │  + DR Site       │                   │  ──────────────────      │ │
│  │  ────────────    │                   │  n8n          :5678      │ │
│  │  Claude.ai+MCP   │                   │  Dify API     :3000      │ │
│  │  ChatGPT/Grok    │                   │  Dify Web     :3001      │ │
│  │  n8n (fallback)  │                   │  Ollama       :11434     │ │
│  │  Docker Desktop  │                   │  LiteLLM      :4000      │ │
│  │  LM Studio       │                   │  Paperclip    :4001  ★   │ │
│  │  AnythingLLM     │                   │  Open WebUI   :3002      │ │
│  │  CapCut/DaVinci  │                   │  CrewAI       :8888      │ │
│  │  Canva Pro       │                   │  Hermes       :5000      │ │
│  │  VS Code         │                   │  Dashboard    :8080      │ │
│  │  GitHub Desktop  │                   │  PostgreSQL   :5432      │ │
│  │  Obsidian        │                   │  Redis        :6379      │ │
│  │  MobaXterm       │                   │  Portainer    :9090      │ │
│  │  Telegram        │                   │  Dozzle       :8081      │ │
│  │  Uptime Kuma     │                   │  Uptime Kuma  :3003      │ │
│  └─────────────────┘                   │  Netdata      :19999     │ │
│                                         └────────────┬─────────────┘ │
│         ★ Paperclip = CORE (always running)          │               │
│           Enterprise task mgmt + agent memory        │               │
│                                         ┌────────────▼─────────────┐ │
│                                         │      CLOUD APIS          │ │
│                                         │  Anthropic · ElevenLabs  │ │
│                                         │  HeyGen · Higgsfield     │ │
│                                         │  RunwayML · Creatomate   │ │
│                                         │  InVideo · Veed.ai       │ │
│                                         │  Perplexity · Kling AI   │ │
│                                         │  Google (Drive/Sheets/YT)│ │
│                                         │  Telegram · GitHub       │ │
│                                         └──────────────────────────┘ │
│                          │                                            │
│                ┌─────────▼──────────┐                                │
│                │  PUBLIC INTERNET    │                                │
│                │  Hermes (Cloudflare │                                │
│                │  Tunnel :5000)      │                                │
│                │  Dashboard (:8080)  │                                │
│                └────────────────────┘                                │
└──────────────────────────────────────────────────────────────────────┘

MOBILE LAYER:
  Pawi / Rudra / Ruchi → Telegram → n8n webhook → Agent system
```

---

## VPS DOCKER COMPOSE — MASTER FILE

```yaml
# /opt/docker/docker-compose.yml
# Contabo Cloud VPS 30 — PRRS Global Enterprise Stack
# Status: Deploy when VPS is procured

version: '3.8'

services:

  # ── DATABASE LAYER ──────────────────────────────────────
  postgres:
    image: postgres:15-alpine
    restart: unless-stopped
    environment:
      POSTGRES_USER: ${DB_USER}
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_DB: skillindia
    volumes:
      - postgres_data:/var/lib/postgresql/data
    networks: [internal]

  redis:
    image: redis:7-alpine
    restart: unless-stopped
    volumes:
      - redis_data:/data
    networks: [internal]

  # ── AUTOMATION LAYER ────────────────────────────────────
  n8n:
    image: n8nio/n8n:latest
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=${DB_USER}
      - DB_POSTGRESDB_PASSWORD=${DB_PASSWORD}
      - N8N_ENCRYPTION_KEY=${N8N_ENCRYPTION_KEY}
      - WEBHOOK_URL=http://${VPS_IP}:5678/
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on: [postgres, redis]
    networks: [internal, external]

  # ── AI ORCHESTRATION LAYER ──────────────────────────────
  dify-api:
    image: langgenius/dify-api:latest
    restart: unless-stopped
    ports:
      - "3000:5001"
    environment:
      - SECRET_KEY=${DIFY_SECRET_KEY}
      - DB_USERNAME=${DB_USER}
      - DB_PASSWORD=${DB_PASSWORD}
      - DB_HOST=postgres
      - REDIS_HOST=redis
    depends_on: [postgres, redis]
    networks: [internal, external]

  dify-web:
    image: langgenius/dify-web:latest
    restart: unless-stopped
    ports:
      - "3001:3000"
    networks: [external]

  ollama:
    image: ollama/ollama:latest
    restart: unless-stopped
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
    networks: [internal]

  litellm:
    image: ghcr.io/berriai/litellm:main-latest
    restart: unless-stopped
    ports:
      - "4000:4000"
    environment:
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
      - OPENAI_API_KEY=${OPENAI_API_KEY}
      - GEMINI_API_KEY=${GEMINI_API_KEY}
    volumes:
      - ./litellm_config.yaml:/app/config.yaml
    command: ["--config", "/app/config.yaml"]
    networks: [internal, external]

  openwebui:
    image: ghcr.io/open-webui/open-webui:main
    restart: unless-stopped
    ports:
      - "3002:8080"
    environment:
      - OLLAMA_BASE_URL=http://ollama:11434
    volumes:
      - openwebui_data:/app/backend/data
    depends_on: [ollama]
    networks: [internal, external]

  # ── ENTERPRISE CORE ─────────────────────────────────────
  paperclip:
    image: paperclip/server:latest
    restart: unless-stopped
    ports:
      - "4001:4000"
    environment:
      - STORAGE_BACKEND=postgres
      - DB_URL=postgresql://${DB_USER}:${DB_PASSWORD}@postgres/paperclip
      - BACKUP_DRIVE_PATH=/PRRS-Global/Memory/
    depends_on: [postgres]
    networks: [internal, external]

  # ── AGENT LAYER (start on demand) ──────────────────────
  crewai:
    build: /opt/crewai/
    restart: unless-stopped
    ports:
      - "8888:8888"
    environment:
      - LITELLM_URL=http://litellm:4000
      - PAPERCLIP_URL=http://paperclip:4000
      - N8N_WEBHOOK_URL=http://n8n:5678
    volumes:
      - /opt/crewai/crews:/app/crews
    depends_on: [paperclip, litellm]
    networks: [internal]
    profiles: ["agents"]

  hermes:
    image: hermes-ai/server:latest
    restart: unless-stopped
    ports:
      - "5000:5000"
    environment:
      - N8N_INTAKE_WEBHOOK=http://n8n:5678/webhook/client-intake
      - TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}
      - LITELLM_URL=http://litellm:4000
    networks: [internal, external]
    profiles: ["agents"]

  # ── DASHBOARD ───────────────────────────────────────────
  dashboard:
    build: /opt/dashboard/
    restart: unless-stopped
    ports:
      - "8080:8080"
    environment:
      - N8N_URL=http://n8n:5678
      - CREWAI_URL=http://crewai:8888
      - PAPERCLIP_URL=http://paperclip:4000
    networks: [internal, external]

  # ── MONITORING LAYER ────────────────────────────────────
  portainer:
    image: portainer/portainer-ce:latest
    restart: unless-stopped
    ports:
      - "9090:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - portainer_data:/data
    networks: [external]

  dozzle:
    image: amir20/dozzle:latest
    restart: unless-stopped
    ports:
      - "8081:8080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    networks: [external]

  uptime-kuma:
    image: louislam/uptime-kuma:latest
    restart: unless-stopped
    ports:
      - "3003:3001"
    volumes:
      - uptime_data:/app/data
    networks: [external]

  netdata:
    image: netdata/netdata:latest
    restart: unless-stopped
    ports:
      - "19999:19999"
    cap_add:
      - SYS_PTRACE
    security_opt:
      - apparmor:unconfined
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
    networks: [external]

volumes:
  postgres_data:
  redis_data:
  n8n_data:
  ollama_data:
  openwebui_data:
  portainer_data:
  uptime_data:

networks:
  internal:
    driver: bridge
    internal: true
  external:
    driver: bridge
```

---

## UFW FIREWALL RULES

```bash
# [MEDIUM RISK] — Run on VPS after deployment, verify before executing

# SSH access
sudo ufw allow 22/tcp

# Public services (accessible from internet)
sudo ufw allow 5678/tcp      # n8n (restrict to Tailscale IP if possible)
sudo ufw allow 3001/tcp      # Dify Web UI
sudo ufw allow 8080/tcp      # Dashboard
sudo ufw allow 5000/tcp      # Hermes (public-facing via Cloudflare Tunnel)

# Monitoring (restrict to Tailscale network)
sudo ufw allow from ${TAILSCALE_SUBNET} to any port 9090   # Portainer
sudo ufw allow from ${TAILSCALE_SUBNET} to any port 8081   # Dozzle
sudo ufw allow from ${TAILSCALE_SUBNET} to any port 3003   # Uptime Kuma
sudo ufw allow from ${TAILSCALE_SUBNET} to any port 19999  # Netdata

# Internal only — deny public access
sudo ufw deny 3000/tcp       # Dify API
sudo ufw deny 11434/tcp      # Ollama
sudo ufw deny 4000/tcp       # LiteLLM
sudo ufw deny 4001/tcp       # Paperclip
sudo ufw deny 8888/tcp       # CrewAI
sudo ufw deny 3002/tcp       # Open WebUI
sudo ufw deny 5432/tcp       # PostgreSQL
sudo ufw deny 6379/tcp       # Redis

sudo ufw enable
sudo ufw status verbose
```

---

## .env FILE TEMPLATE

```bash
# /opt/docker/.env — NEVER commit to GitHub
# Copy to VPS, fill values, chmod 600 .env

VPS_IP=YOUR_CONTABO_VPS_IP
TAILSCALE_SUBNET=100.64.0.0/10

# Database
DB_USER=skillindia_admin
DB_PASSWORD=CHANGE_THIS_STRONG_PASSWORD

# n8n
N8N_USER=pawi
N8N_PASSWORD=CHANGE_THIS
N8N_ENCRYPTION_KEY=GENERATE_32_CHAR_RANDOM

# Dify
DIFY_SECRET_KEY=GENERATE_RANDOM

# AI APIs
ANTHROPIC_API_KEY=sk-ant-...
OPENAI_API_KEY=sk-...
GEMINI_API_KEY=...
PERPLEXITY_API_KEY=pplx-...

# Production APIs
ELEVENLABS_API_KEY=...
HEYGEN_API_KEY=...
HIGGSFIELD_API_KEY=...
RUNWAYML_API_KEY=...
CREATOMATE_API_KEY=...
INVIDEO_API_KEY=...

# Communication
TELEGRAM_BOT_TOKEN=...

# Google
GOOGLE_API_KEY=...
YOUTUBE_OAUTH_CLIENT_ID=...
YOUTUBE_OAUTH_CLIENT_SECRET=...

# Paperclip
PAPERCLIP_API_KEY=...
```

---

## BACKUP STRATEGY

```
Daily (2am IST — automated via n8n):
  □ Paperclip task boards + memory → Google Drive /PRRS-Global/Memory/
  □ n8n workflow exports → Google Drive /PRRS-Global/Workflows/
  □ PostgreSQL dump → Google Drive /PRRS-Global/Backups/db/

Weekly (Sunday 11pm IST):
  □ Full VPS snapshot (Contabo control panel)
  □ All Docker configs → GitHub /docker/ (no secrets)
  □ All workflow JSONs → GitHub /n8n-workflows/
  □ CrewAI crew files → GitHub /crewai-crews/
  □ Prompt library → GitHub /prompts/
  □ ADK files → GitHub /adk/

Responsible: Rudra (P2) monitors backup health
```

---

## VPS SETUP CHECKLIST (for next month)

```
Phase A — Base OS (Day 1):
  □ Contabo Cloud VPS 30 provisioned
  □ Ubuntu 24.04 LTS installed
  □ SSH keys configured, root login disabled
  □ UFW firewall enabled with rules above
  □ XFCE4 + XRDP installed for GUI access
  □ Tailscale installed and joined to network
  □ Docker + Docker Compose installed
  □ Git installed, SSH key for GitHub

Phase B — Core Services (Day 2–3):
  □ .env file created with all credentials
  □ docker-compose.yml deployed
  □ PostgreSQL + Redis verified
  □ n8n up and accessible from laptop browser
  □ Dify API + Web UI up
  □ Ollama installed, models pulled (llama3.2:3b, mistral:7b)
  □ LiteLLM configured with all API keys
  □ Open WebUI connected to Ollama + LiteLLM
  □ Paperclip deployed, enterprise boards created

Phase C — Monitoring (Day 3–4):
  □ Portainer up — manage containers via GUI
  □ Dozzle up — view container logs
  □ Uptime Kuma up — monitor all services
  □ Netdata up — system performance metrics
  □ Cloudflare Tunnel configured for public services

Phase D — Migration (Day 4–5):
  □ n8n workflows imported from laptop exports
  □ Google Drive/Sheets credentials configured in n8n
  □ Telegram bot connected
  □ Test: Sheets trigger → Perplexity → Claude → Drive → Telegram
  □ Rudra (P2) validates system health

Phase E — Agent Layer (Week 2+):
  □ CrewAI installed, YouTube Production Crew configured
  □ Hermes deployed with Cloudflare Tunnel
  □ Dashboard v1 deployed
  □ Full pipeline test: topic → published video
```

---

## LAPTOP DR SETUP (already done / verify)

```
Installed (verify all present):
  □ n8n Desktop or Docker Desktop with n8n
  □ LM Studio + AnythingLLM + Open WebUI
  □ CapCut + DaVinci Resolve
  □ VS Code + GitHub Desktop + GitHub CLI
  □ MobaXterm (RDP/SSH client)
  □ Tailscale
  □ Telegram Desktop
  □ Docker Desktop (for running reduced local stack)
  □ Uptime Kuma (local instance)
  □ Obsidian

Laptop fallback docker-compose (if VPS down):
  services:
    n8n:        # workflow triggers + approvals
    ollama:     # local AI (3b model only — 8GB RAM limit)
```
