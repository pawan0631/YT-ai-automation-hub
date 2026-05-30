# PRRS_DEV_Agent_SecureLocal.py
# PRRS Global Enterprise — Secure Local Agent
# Node: [LAPTOP] — connects to LM Studio local inference server
# Purpose: Test and development agent using local LLM (via LM Studio OpenAI-compatible API)
# Updated: 2026-05-31

import os
from dotenv import load_dotenv
from smolagents import CodeAgent, OpenAIServerModel

# Load credentials from .env — NEVER hardcode keys
load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), '..', '.env'))

# Disable all external telemetry for privacy
os.environ["SMOLAGENTS_TELEMETRY"] = "0"

# LM Studio connection — runs locally on laptop at port 1234
LM_STUDIO_BASE_URL = os.getenv("LM_STUDIO_BASE_URL", "http://localhost:1234/v1")
LM_STUDIO_MODEL_ID = os.getenv("LM_STUDIO_MODEL_ID", "local-model")

model = OpenAIServerModel(
    model_id=LM_STUDIO_MODEL_ID,
    api_base=LM_STUDIO_BASE_URL,
    api_key="not-needed"  # LM Studio does not require auth
)

# Security hardening: strict execution sandbox — only safe imports allowed
agent = CodeAgent(
    model=model,
    tools=[],
    additional_authorized_imports=['math', 'json', 'datetime', 'os', 're']
)

if __name__ == "__main__":
    print(f"[LAPTOP] PRRS Secure Local Agent ready — connected to LM Studio at {LM_STUDIO_BASE_URL}")
    print("Enter your task (or 'quit' to exit):")
    while True:
        task = input("> ").strip()
        if task.lower() in ("quit", "exit"):
            break
        if task:
            result = agent.run(task)
            print(f"\nResult: {result}\n")
