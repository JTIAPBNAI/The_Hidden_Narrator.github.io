#!/bin/bash

# ==========================================
# 🚀 AI GHOST WRITING PROJECT SETUP SCRIPT
# Based on DOE Framework (Directive-Orchestration-Execution)
# ==========================================

echo "---------------------------------------------------------"
echo "🤖 AI Agentic Workflow Generator (DOE Framework)"
echo "---------------------------------------------------------"

# 1. INTERACTIVE INPUTS
# ---------------------------------------------------------

# Default Values
DEFAULT_PROJECT="my-book-project"
DEFAULT_ROLE="Ghost Writer & System Architect"
DEFAULT_PERSONA="Adam Grant (Psychology) x Paul Krugman (Economics) x Naval Ravikant (Systems Thinking)"
DEFAULT_TONE="Humble Authority - Tech-Savvy Intellectual"
DEFAULT_LANGUAGE="Thai (ภาษาไทย)"
DEFAULT_BOOK_GOAL="Write a book that empowers ordinary people to become authors using AI"

echo ""
echo "📋 PROJECT CONFIGURATION"
echo "---------------------------------------------------------"

read -p "📁 Project Name (folder name) [${DEFAULT_PROJECT}]: " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-$DEFAULT_PROJECT}

read -p "🎯 Book Goal (What is this book about?) [${DEFAULT_BOOK_GOAL}]: " BOOK_GOAL
BOOK_GOAL=${BOOK_GOAL:-$DEFAULT_BOOK_GOAL}

read -p "🎭 AI Role (e.g., Ghost Writer, Research Assistant) [${DEFAULT_ROLE}]: " AGENT_ROLE
AGENT_ROLE=${AGENT_ROLE:-$DEFAULT_ROLE}

echo -e "\n🧠 Persona (Who should the AI emulate?)"
echo "   Ex: 'Adam Grant x Paul Krugman' or 'Malcolm Gladwell x Tim Ferriss'"
read -p "   > " AGENT_PERSONA
AGENT_PERSONA=${AGENT_PERSONA:-$DEFAULT_PERSONA}

echo -e "\n🗣 Tone & Voice"
echo "   Ex: 'Conversational Thai, Humble Authority' or 'Academic English, Evidence-Based'"
read -p "   > " AGENT_TONE
AGENT_TONE=${AGENT_TONE:-$DEFAULT_TONE}

read -p "🌐 Primary Language [${DEFAULT_LANGUAGE}]: " PRIMARY_LANG
PRIMARY_LANG=${PRIMARY_LANG:-$DEFAULT_LANGUAGE}

read -p "📚 Create sample chapter structure? (y/n) [y]: " CREATE_STRUCTURE
CREATE_STRUCTURE=${CREATE_STRUCTURE:-y}

# ==========================================
# 2. SCAFFOLDING DIRECTORIES
# ==========================================
echo -e "\n🚀 Initializing project: ${PROJECT_NAME}..."
mkdir -p "${PROJECT_NAME}"/{.tmp,directives,drafts,execution,TopBun,resources}
cd "${PROJECT_NAME}" || exit

# Create Config Files
touch .env
cat <<'EOF' > .gitignore
.env
.tmp/
__pycache__/
*.DS_Store
venv/
node_modules/
*.pyc
.pytest_cache/
EOF

# ==========================================
# 3. GENERATE GEMINI.md (DOE Framework Core)
# ==========================================
cat <<'EOF' > GEMINI.md
# Agent Instructions

> This file defines the operating system for the AI agent using the DOE Framework.

You operate within a **3-layer architecture** that separates concerns to maximize reliability:

## The 3-Layer Architecture (DOE Framework)

**Layer 1: Directive (What to do)**
- SOPs written in Markdown, live in `directives/`
- Define goals, inputs, tools/scripts to use, outputs, and edge cases
- Natural language instructions for the AI agent

**Layer 2: Orchestration (Decision making)**
- This is you (the AI). Your job: intelligent routing.
- Read directives, call execution tools in the right order, handle errors, ask for clarification
- Update directives with learnings (self-annealing)
- You're the glue between intent and execution

**Layer 3: Execution (Doing the work)**
- Deterministic Python scripts in `execution/`
- Handle API calls, data processing, file operations
- Reliable, testable, fast

## Operating Principles

**1. Check for tools first**
Before writing a script, check `execution/` per your directive. Only create new scripts if none exist.

**2. Self-anneal when things break**
- Read error message and stack trace
- Fix the script and test it again
- Update the directive with what you learned (API limits, timing, edge cases)
- Example: API rate limit → find batch endpoint → rewrite script → test → update directive

**3. Update directives as you learn**
Directives are living documents. When you discover:
- API constraints
- Better approaches
- Common errors
- Timing expectations
→ Update the directive immediately.

**4. File Hygiene**
- **Deliverables**: Final outputs (drafts, reports) go to `drafts/` or cloud services
- **Intermediates**: Temporary processing files go to `.tmp/` (never commit)
- **Source of Truth**: `TopBun/` contains user's original context (read-only)
- **Directives**: `directives/` contains SOPs (update via self-annealing)

## Self-Annealing Loop
When something breaks:
1. Fix it
2. Update the tool
3. Test the tool
4. Update directive to include new flow
5. System is now stronger

## Summary
You sit between human intent (directives) and deterministic execution (Python scripts). 
Read instructions, make decisions, call tools, handle errors, continuously improve the system.

Be pragmatic. Be reliable. Self-anneal.
EOF

# ==========================================
# 4. GENERATE DIRECTIVES (7 Core Files)
# ==========================================
echo "📚 Generating Directives..."

# 00_persona_and_tone.md
cat <<EOF > directives/00_persona_and_tone.md
# DIRECTIVE: Persona, Role, and Tone Definition

## 1. Role Definition: ${AGENT_ROLE}
**Concept:** You are acting as a **${AGENT_ROLE}**. You are not just a generic AI; you are a specialized partner in this domain.

### The Persona Profile
**Core Identity:** ${AGENT_PERSONA}

**Why this persona?**
- Combine multiple perspectives to create a unique voice
- Balance analytical depth with accessible storytelling
- Maintain credibility through evidence-based reasoning

---

## 2. Voice & Tone
**Style:** ${AGENT_TONE}
**Primary Language:** ${PRIMARY_LANG}

### Writing Rules
1.  **Identity Consistency:** Always stay in character as described above.
2.  **Language Adaptation:** Match vocabulary and structure to the target language and tone.
3.  **Vulnerability:** If unsure, admit it. Do not hallucinate.
4.  **Information Density:** Focus on high insight-per-paragraph ratio.
5.  **Evidence-Based:** Support claims with research, data, or expert opinions.

### Tone Guidelines
- **Humble Authority:** Knowledgeable but approachable
- **Solution-Oriented:** Don't just identify problems; propose frameworks
- **Futuristic yet Grounded:** Forward-thinking but practical

---

## 3. Narrative Themes
Core themes to maintain throughout the work:
- **Empowerment:** Technology democratizes expertise
- **Collaboration:** AI as partner, not replacement
- **Systems Thinking:** View complex tasks as engineerable processes
- **Continuous Learning:** Embrace iteration and improvement

---

## 4. Example Prompt
> "Act as **${AGENT_ROLE}**. Channel the persona of **${AGENT_PERSONA}**.
> 
> **Task:** [Specific task]
> **Context:** [Relevant background]
> **Tone:** ${AGENT_TONE}
> 
> Ensure the output is evidence-based and maintains the established voice."
EOF

# 01_write_chapter.md
cat <<'EOF' > directives/01_write_chapter.md
# DIRECTIVE: Write Chapter (Sandwich Method)

**Role:** Ghost Writer & Director Partner
**Reference:** Must follow `directives/00_persona_and_tone.md` for voice and style.
**Goal:** Draft a chapter section using the Sandwich Workflow.

## The Sandwich Method

### Step 0: Contextual Bridge (The Link)
- **Input:** Read the summary/conclusion of the PREVIOUS chapter (if available).
- **Action:** Reference key terms or concepts from the previous chapter in the opening.
- **Goal:** Create seamless narrative flow.

### Step 1: Human Context (Top Bun)
- **Input:** User provides bullet points, anecdotes, or the "Big Idea".
- **Director's Action:**
  - Define the specific intellectual angle
  - Specify the context (economic, social, psychological)
  - Outline the key message

### Step 2: AI Generation (Meat)
- **Action:** AI expands bullet points into full prose.
- **Guidelines:**
  - **Persona Check:** Adopt the defined persona consistently
  - **Narrative Flow:** Write smoothly, integrate concepts naturally
  - **Structure:** Use clear logical flow (Premise → Evidence → Conclusion)
  - **Chain of Density:** Start with core idea, layer in details progressively
  
  - **Citation Format:**
    - Avoid inline citations unless necessary for the story
    - Create a "References / Key Sources" section at the bottom
    - List theories, papers, or articles used for later verification

### Step 3: Human Refinement (Bottom Bun)
- **Input:** The AI draft.
- **Director's Action:**
  - **Fact-Check:** Verify references against real data
  - **Humanize:** Inject vulnerability, personal insights
  - **Tone Check:** Ensure humble authority, avoid arrogance
  - **Bridge:** Ensure smooth transition to next section

---

## Rules of Engagement
- **Input Integrity:** NEVER overwrite source files in `TopBun/` or `directives/`. These are read-only.
- **Output Location:** ALWAYS create new files in `drafts/` directory (e.g., `drafts/chapter_01_v1.md`).
- **Versioning:** Use version numbers for iterations (v1, v2, v3).

**Output:** A NEW Markdown file saved in `drafts/`.
EOF

# 02_refine_voice.md
cat <<EOF > directives/02_refine_voice.md
# DIRECTIVE: Refine Voice & Localization

**Goal:** Polish the draft to match the defined persona and tone in the target language.
**Reference:** \`directives/00_persona_and_tone.md\`

## Checklist for Review

### 1. Tone & Personality
- [ ] **Humble Authority:**
    - Sound knowledgeable but approachable
    - Avoid preaching or commanding language
    - Use observational or sharing language
- [ ] **Vulnerability & Relatability:**
    - Admit struggles or uncertainties
    - Position author as learner alongside reader
- [ ] **Appropriate Metaphors:**
    - Use metaphors that align with the persona
    - Ensure consistency across chapters

### 2. Language Localization (${PRIMARY_LANG})
- [ ] **Pronouns & Formality:**
    - Choose appropriate pronouns for the target language
    - Maintain consistent formality level
- [ ] **Technical Terms:**
    - Decide when to transliterate vs. translate
    - Explain complex terms on first mention
    - Use parenthetical English terms if helpful
- [ ] **Sentence Structure:**
    - Adapt to natural patterns of target language
    - Break long sentences into digestible chunks
    - Read aloud test: does it sound natural?

### 3. Narrative & Content Style
- [ ] **Metaphor Consistency:**
    - Maintain thematic coherence across chapters
    - Avoid jarring shifts in imagery
- [ ] **Storytelling over Textbook:**
    - Start sections with hooks, questions, or stories
    - Explain complex ideas simply without dumbing down
- [ ] **Attribution:**
    - Always credit theories to their originators
    - Use proper citation format

### 4. Vocabulary Guidelines
- [ ] **Avoid Over-Colloquialism:**
    - Professional but not stuffy
    - Accessible but not casual
- [ ] **Avoid Academic Stiffness:**
    - Conversational where appropriate
    - Clear and direct language
EOF

# 03_master_plan.md
cat <<EOF > directives/03_master_plan.md
# Master Plan: ${PROJECT_NAME}

## Goal
${BOOK_GOAL}

## Book Structure
[Define your chapter outline here]

### Suggested Template:
- Introduction: [Hook and overview]
- Chapter 1: [First major topic]
- Chapter 2: [Second major topic]
- Chapter 3: [Third major topic]
- ...
- Conclusion: [Synthesis and future outlook]
- References

## Target Audience
[Define who this book is for]

## Key Differentiators
[What makes this book unique?]

## Success Metrics
[How will you measure if this book achieves its goal?]
EOF

# 04_research_protocol.md
cat <<'EOF' > directives/04_research_protocol.md
# DIRECTIVE: Research Protocol

**Goal:** Provide empirical evidence to support the work.
**Tool:** `execution/research_tool.py`

## When to Use Research
- Verifying statistical claims
- Finding supporting evidence for assertions
- Discovering recent developments in a field
- Locating expert opinions or studies

## Research Modes

### General Mode
- Broad web search
- News articles, blogs, general sources
- Quick fact-checking

### Academic Mode
- Scholarly papers and journals
- .edu, .gov, arxiv.org, scholar.google.com
- In-depth research for credibility

## Usage
```bash
# General research
python execution/research_tool.py "query"

# Academic research
python execution/research_tool.py "query" --academic
```

## Output
- Results saved to `.tmp/research_results.json`
- Review and cite relevant sources in your draft
- Add to References section
EOF

# 05_autonomous_research.md
cat <<'EOF' > directives/05_autonomous_research.md
# DIRECTIVE: Autonomous Fact-Checking & Enrichment

**Goal:** Reduce user workload by having AI autonomously verify its own drafts.
**Trigger:** Use AFTER generating a draft (V1) but BEFORE showing it to user as final.

## Phase 1: Claim Extraction (The Skeptic)
**Role:** Act as a critical editor.
**Action:** Scan the generated draft and identify:
1.  **Statistical Claims:** Numbers, dates, percentages
2.  **Citations:** Specific people, books, theories
3.  **Strong Assertions:** Causal claims ("X causes Y")

**Output:** List of claims to verify.

## Phase 2: Autonomous Research (The Researcher)
**Action:** Generate terminal commands to verify claims using `research_tool.py`.
**Format:**
```bash
python execution/research_tool.py "query for claim 1" --academic
python execution/research_tool.py "query for claim 2"
```

## Phase 3: Verification & Update (The Editor)
**Action:** 
1. Review research results from `.tmp/research_results.json`
2. Confirm or correct claims in the draft
3. Add verified sources to References section
4. Flag any claims that couldn't be verified for user review

**Output:** Updated draft with verified claims and proper citations.
EOF

# 06_editor_critic.md
cat <<'EOF' > directives/06_editor_critic.md
# DIRECTIVE: The Editor & Critic (Quality Assurance)

**Role:** Chief Editor & Narrative Guardian
**Goal:** Ensure the chapter flows logically, maintains persona, and connects seamlessly with the rest of the book.

## 1. Narrative Continuity Check (The Thread)
* **Callback:** Does this chapter reference concepts from previous chapters?
* **Consistency:** Are metaphors and themes consistent throughout?
* **Progression:** Does the narrative build logically toward the book's goal?

## 2. Persona Alignment Check (The Voice)
* **Reference:** `@directives/00_persona_and_tone.md`
* **Tone Check:**
    - Is it too technical? Simplify or add analogies.
    - Is it too dry? Inject storytelling elements.
    - Is it too assertive? Maintain humble authority.
* **Authority Check:**
    - Are cited experts consistent with the book's authority pillars?
    - If introducing new fields, explain why it matters.

## 3. Structural Logic (The Flow)
* **The Bridge:** Check transitions between sections.
* **The Sandwich Consistency:** Ensure workflow matches `@directives/01_write_chapter.md`.
* **Pacing:** Vary sentence length and paragraph structure for readability.

## 4. Actionable Feedback
If the draft fails any check:
1.  **Identify:** Pinpoint the specific paragraph or section.
2.  **Suggest:** Provide specific rewrite direction.
3.  **Explain:** Clarify why the change improves the work.

**Output:** Detailed feedback document or revised draft.
EOF

# ==========================================
# 5. GENERATE EXECUTION TOOLS
# ==========================================
echo "🛠 Creating Execution Tools..."

# research_tool.py
cat <<'EOF' > execution/research_tool.py
#!/usr/bin/env python3
"""
Research Tool for AI Ghost Writing
Supports general and academic search modes
"""

import argparse
import json
from duckduckgo_search import DDGS

def search(query, mode="general", max_results=5):
    """
    Search tool with specific modes for General vs. Academic context.
    
    Args:
        query: Search keywords
        mode: "general" or "academic"
        max_results: Maximum number of results to return
    """
    print(f"🔎 Mode: [{mode.upper()}] Searching for: {query}...")
    
    # Query Engineering: Adjust query based on mode
    final_query = query
    if mode == "academic":
        # Force search only in academic sources
        academic_sites = (
            "site:arxiv.org OR site:nber.org OR site:scholar.google.com "
            "OR site:researchgate.net OR site:edu OR site:gov"
        )
        final_query = f"{query} ({academic_sites})"
    
    results = []
    try:
        with DDGS() as ddgs:
            ddgs_gen = ddgs.text(final_query, max_results=max_results)
            for r in ddgs_gen:
                results.append(r)
    except Exception as e:
        print(f"❌ Error: {e}")
        return []

    # Save outputs (Layer 3 principle: Local files for processing)
    output_file = ".tmp/research_results.json"
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(results, f, ensure_ascii=False, indent=2)
    
    print(f"✅ Found {len(results)} results. Saved to {output_file}")
    
    # Display results summary in terminal
    for i, res in enumerate(results):
        print(f"[{i+1}] {res.get('title')} ({res.get('href')})")
    
    return results

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="AI Ghost Writer Research Tool")
    parser.add_argument("query", type=str, help="Search keywords")
    parser.add_argument("--academic", action="store_true", help="Enable academic paper search mode")
    parser.add_argument("--max-results", type=int, default=5, help="Maximum number of results")
    
    args = parser.parse_args()
    
    search_mode = "academic" if args.academic else "general"
    search(args.query, mode=search_mode, max_results=args.max_results)
EOF

chmod +x execution/research_tool.py

# ==========================================
# 6. CREATE TOPBUN STRUCTURE (Optional)
# ==========================================
if [ "$CREATE_STRUCTURE" == "y" ]; then
    echo "📄 Creating sample chapter structure..."
    cat <<EOF > TopBun/00_master_outline.md
# Master Outline: ${PROJECT_NAME}

## Book Goal
${BOOK_GOAL}

## Chapter Structure

### Introduction
- Hook: [Compelling opening]
- Problem: [What problem does this book solve?]
- Promise: [What will readers gain?]

### Chapter 1: [Title]
**Big Idea:** [Core concept]
**Key Points:**
- Point 1
- Point 2
- Point 3

### Chapter 2: [Title]
**Big Idea:** [Core concept]
**Key Points:**
- Point 1
- Point 2
- Point 3

### Conclusion
- Summary of key insights
- Call to action
- Future outlook

## References
[List key sources to research]
EOF

    touch TopBun/chapter_01_notes.md
    touch TopBun/chapter_02_notes.md
    
    echo "# Resources & References" > resources/README.md
    echo "" >> resources/README.md
    echo "Store reference materials, research papers, and inspiration here." >> resources/README.md
fi

# ==========================================
# 7. CREATE TASK.MD (Mission Control)
# ==========================================
cat <<EOF > task.md
# Task Tracker: ${PROJECT_NAME}

## Current Phase: Setup Complete ✅

## Checklist

### Phase 1: Planning
- [x] Initialize project structure
- [ ] Define book outline in \`TopBun/00_master_outline.md\`
- [ ] Research key topics and gather references
- [ ] Finalize persona and tone in \`directives/00_persona_and_tone.md\`

### Phase 2: Drafting
- [ ] Chapter 1: First draft
- [ ] Chapter 2: First draft
- [ ] Chapter 3: First draft
- [ ] ...

### Phase 3: Refinement
- [ ] Review all chapters for narrative continuity
- [ ] Fact-check claims and verify references
- [ ] Polish voice and tone consistency
- [ ] Final editorial pass

### Phase 4: Completion
- [ ] Compile references
- [ ] Format for publication
- [ ] Final review

## Notes
[Add notes, blockers, or insights here]
EOF

# ==========================================
# 8. GENERATE START PROMPT
# ==========================================
cat <<EOF > Startprompt.md
**Role:** ${AGENT_ROLE}
**Reference:** @directives/00_persona_and_tone.md
**Context:** Working on Project: **${PROJECT_NAME}**

**Book Goal:** ${BOOK_GOAL}

**Objective:** Execute the next task based on the context in @TopBun/ and @directives/.

**Instructions:**
1.  **Analyze:** Read the input files in TopBun/ to understand the current context.
2.  **Research:** If needed, run \`python execution/research_tool.py "query" --academic\`.
3.  **Execute:** Draft content following the persona: **${AGENT_PERSONA}**.
4.  **Review:** Ensure the tone is **${AGENT_TONE}** and language is **${PRIMARY_LANG}**.
5.  **Self-Anneal:** If you encounter issues, update the relevant directive.

**Current Task:** [Specify the next chapter or section to work on]

Ready to start. Please specify the target file or topic.
EOF

# ==========================================
# 9. CREATE README
# ==========================================
cat <<EOF > README.md
# ${PROJECT_NAME}

${BOOK_GOAL}

## Project Structure

\`\`\`
${PROJECT_NAME}/
├── .tmp/                    # Temporary files (not committed)
├── directives/              # SOPs and workflow instructions
│   ├── 00_persona_and_tone.md
│   ├── 01_write_chapter.md
│   ├── 02_refine_voice.md
│   ├── 03_master_plan.md
│   ├── 04_research_protocol.md
│   ├── 05_autonomous_research.md
│   └── 06_editor_critic.md
├── drafts/                  # AI-generated drafts
├── execution/               # Python tools and scripts
│   └── research_tool.py
├── TopBun/                  # User's original context (read-only)
├── resources/               # Reference materials
├── GEMINI.md               # AI agent operating system
├── task.md                 # Mission control checklist
└── Startprompt.md          # Initial prompt for AI
\`\`\`

## How to Use

### 1. Define Your Book
Edit \`TopBun/00_master_outline.md\` with your chapter structure and key ideas.

### 2. Start Writing
Copy the content from \`Startprompt.md\` and paste it into your AI chat (Gemini, Claude, etc.).

### 3. Iterate
- AI drafts chapters in \`drafts/\`
- You refine in the "Bottom Bun" phase
- Update directives as you learn

### 4. Research
\`\`\`bash
# General search
python execution/research_tool.py "your query"

# Academic search
python execution/research_tool.py "your query" --academic
\`\`\`

## The DOE Framework

**Directive:** Instructions in \`directives/\`
**Orchestration:** AI decision-making and routing
**Execution:** Deterministic tools in \`execution/\`

## Persona
**Role:** ${AGENT_ROLE}
**Voice:** ${AGENT_PERSONA}
**Tone:** ${AGENT_TONE}
**Language:** ${PRIMARY_LANG}

---

Generated by AI Ghost Writing Project Setup Script
EOF

# ==========================================
# 10. FINAL OUTPUT
# ==========================================
echo ""
echo "✅ PROJECT SETUP COMPLETE!"
echo "---------------------------------------------------------"
echo "📁 Project created at: $(pwd)"
echo "🎯 Goal: ${BOOK_GOAL}"
echo "🎭 Role: ${AGENT_ROLE}"
echo "🗣 Tone: ${AGENT_TONE}"
echo "🌐 Language: ${PRIMARY_LANG}"
echo "---------------------------------------------------------"
echo ""
echo "📋 Next Steps:"
echo "1. Review and customize directives in 'directives/'"
echo "2. Define your book outline in 'TopBun/00_master_outline.md'"
echo "3. Open 'Startprompt.md' and copy it to your AI chat"
echo "4. Start writing!"
echo ""
echo "🔧 Tools Available:"
echo "- Research: python execution/research_tool.py 'query' --academic"
echo "- Track Progress: task.md"
echo "- Reference: GEMINI.md for DOE Framework"
echo ""
echo "Happy Writing! 📚✨"