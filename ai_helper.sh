#!/usr/bin/env bash
# ai_helper.sh - simple Ollama helper that auto-logs to a Zettlr-ready .md file

MODEL="${MODEL:-mistral}"   # default model; override with: MODEL=llama3 ./ai_helper.sh
LOG_DIR="$HOME/cloudpunchr-tools/zettlrvault/ai_logs"

mkdir -p "$LOG_DIR"

TIMESTAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
NOTE_FILE="$LOG_DIR/${TIMESTAMP}_ai_session.md"

# If nothing is piped in, use CLI args as the prompt
if [ -t 0 ]; then
  PROMPT="$*"
else
  PROMPT="$(cat)"
fi

if [ -z "$PROMPT" ]; then
  echo "Usage:"
  echo "  $0 \"your question here\""
  echo "  some_command | $0"
  exit 1
fi

{
  echo "# AI Session - $TIMESTAMP"
  echo ""
  echo "## Prompt"
  echo '```'
  echo "$PROMPT"
  echo '```'
  echo ""
  echo "## AI Response"
  echo '```'
} >> "$NOTE_FILE"

# Call Ollama and log + print at the same time
ollama run "$MODEL" <<EOF | tee -a "$NOTE_FILE"
$PROMPT
EOF

echo '```' >> "$NOTE_FILE"
echo ""
echo "[+] Saved to $NOTE_FILE"
