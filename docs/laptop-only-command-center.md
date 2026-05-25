# Laptop-Only Command Center

This mode is for local production before the VPS is active. Codex and GitHub act as the command center. Local tools act as helpers.

## Current Laptop Role

The laptop should handle:

- Topic planning.
- Research capture.
- Script and prompt preparation.
- English/Hindi approval gates.
- Voice sample review.
- Asset organization.
- DaVinci/CapCut editing.
- Shorts/reels creation.
- rclone backup to Google Drive.

The laptop should not handle:

- Heavy local AI video generation.
- Large local LLM hosting.
- Multi-container production automation.
- Public dashboards.

## Command-Center Flow

1. Create an episode project with `scripts/New-EpisodeProject.ps1`.
2. Fill the generated `episode-brief.md`.
3. Ask Codex to create research prompts, source lists, and story angles.
4. Validate each gate in `validation-gates.md`.
5. Use Gemini/Perplexity/Zotero for research.
6. Use prompt files for script, Hindi adaptation, shorts, and shot list.
7. Use ElevenLabs or chosen voice tool for voice samples.
8. Use Canva/Nano Banana/Flow/manual tools for visuals.
9. Edit in DaVinci Resolve or CapCut.
10. Back up the project with `scripts/Backup-Production.ps1`.

## Tool Roles On Laptop

| Tool | Role |
|---|---|
| Codex | Orchestration, repo updates, scripts, checklists, prompts |
| GitHub | Source of truth and task history |
| VS Code | Editing and local command workspace |
| GitHub Desktop | Visual Git sync |
| DaVinci Resolve | Main long-form edit |
| CapCut | Fast shorts/reels and social edits |
| Canva | Thumbnails, graphics, design templates |
| Gemini/Perplexity | Research and creative assistance |
| LM Studio/AnythingLLM | Local fallback drafting and private notes |
| Zotero | Source capture and citation memory |
| Obsidian | Thinking, notes, story ideas |
| FFmpeg | Convert, trim, extract, proxy, normalize media |
| yt-dlp | Permitted metadata/caption research and own-asset handling |
| rclone | Backup/sync to Google Drive |
| VLC | Media review |

## Human Approval Gates

Human approval is required for:

- Topic and angle.
- Research direction.
- English script.
- Hindi adaptation.
- Voice selection.
- Visual style.
- Rough cut.
- Final cut.
- Title/thumbnail.
- Upload metadata.

## Minimum Weekly Routine

Day 1:

- Create project.
- Topic approval.
- Research collection.

Day 2:

- Research dossier.
- Story architecture.
- English script draft.

Day 3:

- English script approval.
- Hindi adaptation.
- Voice samples.

Day 4:

- Shot list.
- Visual assets.
- Thumbnail concepts.

Day 5:

- Long-form edit.
- Captions.
- Sound pass.

Day 6:

- Shorts/reels.
- Metadata.
- Final review.

Day 7:

- Publish.
- Backup.
- Analytics notes.
