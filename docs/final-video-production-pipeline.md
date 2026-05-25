# Final Video Production Pipeline

This pipeline supports weekly cinematic documentary production in English and Hindi:

- Long documentary: 15-18 minutes.
- Shorts/reels: 1-2 minutes.
- Human validation at every important creative/compliance step.

## Production Principle

Do not generate everything at once. Move through gates. Each gate creates a reviewable artifact, and only approved work moves forward.

## Weekly Output Target

Per selected niche/topic:

- 1 English long documentary.
- 1 Hindi long documentary adapted from the English master script.
- 1-2 English shorts/reels.
- 1-2 Hindi shorts/reels.
- Thumbnail/title variants for each language.
- Source log and compliance checklist.

## Master Workflow

### Stage 1: Topic Intake

Input from human:

- Niche/category.
- Topic idea.
- Target audience.
- Desired tone.
- Must-use sources or references.

Output:

- Topic scorecard.
- Initial title angles.
- Risk/compliance notes.

Validation gate:

- Human approves topic and angle before research begins.

### Stage 2: Research and Source Dossier

Tools:

- Gemini / Perplexity for discovery.
- Zotero/Paperless for source archive.
- Google Drive for PDFs/assets.
- Supabase later for structured tracking.

Output:

- Research dossier.
- Timeline.
- Source table.
- Visual/b-roll opportunities.
- Contradictions and weak claims.

Validation gate:

- Human approves sources, factual direction, and core story question.

### Stage 3: Story Architecture

Tools:

- Codex maintains templates and prompts.
- Claude/ChatGPT/Gemini can draft options.

Output:

- 3 story angles.
- Best hook option.
- 15-18 minute structure.
- Chapter breakdown.

Validation gate:

- Human selects one story angle and hook.

### Stage 4: English Master Script

Output:

- Full English narration script.
- Chapter timestamps.
- Visual direction per scene.
- Fact-check markers.

Validation gate:

- Human approves script flow, facts, and tone.

### Stage 5: Hindi Adaptation

Hindi is not a literal translation. It should be a culturally natural adaptation.

Output:

- Hindi narration script.
- Hindi title options.
- Hindi description draft.
- Hindi shorts scripts.

Validation gate:

- Human approves Hindi language quality and cultural tone.

### Stage 6: Voice Selection and Voiceover

Tools:

- ElevenLabs or equivalent voice API.
- Audacity/FFmpeg for cleanup.

Output:

- English voice sample variants.
- Hindi voice sample variants.
- Final voiceover WAV/MP3.

Validation gate:

- Human approves voice identity, pace, emotion, pronunciation, and language quality.

### Stage 7: Visual Style and Shot Plan

Tools:

- Gemini/Nano Banana/Canva for visual concepts.
- Flow/Higgsfield/other video tools for selected cinematic shots.
- Stock footage or licensed b-roll where cheaper/better.

Output:

- Visual moodboard.
- Scene-by-scene shot list.
- AI-generated asset list.
- Stock/b-roll list.
- Graphics/map/timeline requirements.

Validation gate:

- Human approves visual style before generating expensive assets.

### Stage 8: Asset Generation and Editing

Tools:

- DaVinci Resolve or CapCut for edit.
- FFmpeg for conversion/proxies.
- Canva for graphics/thumbnails.
- ImageMagick for batch image processing.

Output:

- Rough cut.
- Sound design pass.
- Graphics pass.
- Subtitles/captions.
- Final export.

Validation gates:

- Rough cut approval.
- Final cut approval.
- Compliance approval.

### Stage 9: Shorts/Reels Creation

Shorts should be derived from the strongest hooks and moments in the long video.

Output:

- English short 1-2 minutes.
- Hindi short 1-2 minutes.
- Vertical 9:16 exports.
- On-screen captions.
- Hook/title variants.

Validation gate:

- Human approves hook, pacing, subtitles, and CTA.

### Stage 10: Upload and Distribution

Tools:

- YouTube Studio.
- n8n later for checklist automation and reminders.
- vidIQ/TubeBuddy later for title/tag research.

Output:

- Final title.
- Thumbnail.
- Description with source/credit notes.
- Chapters.
- Tags.
- Pinned comment.
- Shorts linked to long video.

Validation gate:

- Human approves upload metadata before publish.

### Stage 11: Analytics Review

Metrics:

- CTR.
- First 30 seconds retention.
- Average view duration.
- Comments.
- Subscribers gained.
- Shorts retention.
- Traffic source.

Output:

- Episode performance note.
- Lessons for next topic.
- Thumbnail/title improvement ideas.

Validation gate:

- Human decides whether to repeat, revise, or stop the format.
