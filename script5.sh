bash
#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator

echo "================================================"
echo "    Open Source Manifesto Generator"
echo "    Answer three quick questions below."
echo "================================================"
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does freedom mean to you?  " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD
DATE=$(date '+%d %B %Y')             # readable date, e.g. 20 March 2026
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')  # unique suffix so we never overwrite
OUTPUT="manifesto_$(whoami)_${TIMESTAMP}.txt"

echo "============================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO"                  >> "$OUTPUT"
echo "  Generated : $DATE"                         >> "$OUTPUT"
echo "  Author    : $(whoami)"                     >> "$OUTPUT"
echo "============================================" >> "$OUTPUT"
echo ""                                            >> "$OUTPUT"

echo "I believe open-source software is one of the best things" >> "$OUTPUT"
echo "humans have done together. Every day I use $TOOL,"        >> "$OUTPUT"
echo "a tool someone built in the open and shared for free."    >> "$OUTPUT"
echo "To me, freedom in software means $FREEDOM — the right"   >> "$OUTPUT"
echo "to read, change, and pass on the tools that run our lives." >> "$OUTPUT"
echo "If I could give one thing back, it would be $BUILD,"      >> "$OUTPUT"
echo "released under a free license so someone else can go"     >> "$OUTPUT"
echo "further than I did."                                      >> "$OUTPUT"
echo ""                                                         >> "$OUTPUT"
echo "Built on giants. Paying it forward."                     >> "$OUTPUT"
echo "============================================"              >> "$OUTPUT"

echo ""
echo "Saved to: $OUTPUT"
echo "--------------------------------------------------"
cat "$OUTPUT"

