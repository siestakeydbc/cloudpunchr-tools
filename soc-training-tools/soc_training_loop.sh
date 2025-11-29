#!/usr/bin/env bash
set -euo pipefail

# Base folder where your SOC lab notes will live
BASE_DIR="$HOME/soc-notes"
mkdir -p "$BASE_DIR"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
note_file="$BASE_DIR/soc_lab_${timestamp}.md"

cat > "$note_file" << 'EOF'
# SOC Training Loop – Lab Note

## 1. Scenario
- Lab / range:
- Data source (logs, pcap, alerts):
- Goal (detection, triage, hunting, etc.):

## 2. Raw Evidence
- Key events, queries, screenshots summary.

## 3. AI Assistant Prompt
Paste here the exact prompt you give your AI assistant.

## 4. AI Assistant Answer
Paste the full answer here.

## 5. My Analysis
- What I agree with:
- What I disagree with:
- Extra hypotheses / ideas:

## 6. Detection Ideas
- Sigma / KQL / Splunk queries:
- Enrichment suggestions:

## 7. Lessons Learned
- What I learned:
- What I will practice next:

EOF

echo "[+] SOC note created: $note_file"
echo "Next steps:"
echo " 1) Open it in Zettlr or VS Code."
echo " 2) Paste your AI prompt + answer into sections 3–4."
echo " 3) Add your own analysis, detections, and lessons in 5–7."

