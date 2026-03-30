bash
#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# ============================================================

LOGFILE=$1                   # first argument = log file path
KEYWORD=${2:-"error"}        # second arg, defaults to 'error'
COUNT=0                      # will count matching lines
if [ ! -f "$LOGFILE" ]; then
    echo "Error: '$LOGFILE' not found. Please check the path."
    exit 1
fi
ATTEMPTS=0
while [ ! -s "$LOGFILE" ]; do
    ATTEMPTS=$((ATTEMPTS + 1))
    if [ $ATTEMPTS -ge 3 ]; then
        echo "File is still empty after $ATTEMPTS tries. Giving up."
        exit 1
    fi
    echo "File looks empty, waiting 2 seconds (try $ATTEMPTS)..."
    sleep 2
done

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))  # found a match, bump the counter
    fi
done < "$LOGFILE"
echo "================================================"
echo "  Log file : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "  Matches  : $COUNT lines"
echo "------------------------------------------------"
echo "  Last 5 matching lines:"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo "================================================"

