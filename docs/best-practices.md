# Best Practices

## GitHub

- Keep the main repo small and text-first.
- Use issues for work requests.
- Use branches and pull requests for meaningful changes.
- Keep large media and private archives outside GitHub.
- Do not store secrets in repo files.

## Codex

- Give Codex a concrete issue or checklist.
- Include expected output, constraints, and acceptance criteria.
- Ask Codex to update docs when automation behavior changes.
- Keep `AGENTS.md` current.

## n8n

- Export workflows to `n8n/workflows/`.
- Use environment variables for credentials.
- Name workflows by business function, not tool.
- Add manual approval steps before upload/publish actions.

## VPS

- Put dashboards behind Tailscale or Cloudflare Access.
- Use Docker Compose and version-controlled examples.
- Monitor with Uptime Kuma, Dozzle, Portainer, and Netdata.
- Back up configs and workflow exports with rclone.

## Content Production

- Keep a source log for every long video.
- Keep AI-generated asset notes.
- Do compliance review before export.
- Track CTR, first 30 seconds retention, average view duration, comments, and subscribers gained.
