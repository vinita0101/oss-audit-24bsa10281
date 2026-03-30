bash
#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# ============================================================

PACKAGE="linux-image-$(uname -r)"   # target the running kernel

# --- Check installation: try rpm first, then dpkg ---
if rpm -q $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed (RPM-based system)."
    rpm -qi $PACKAGE | grep -E 'Version|License|Summary'

elif dpkg -l $PACKAGE &>/dev/null 2>&1; then
    echo "$PACKAGE is installed (Debian/Ubuntu system)."
    dpkg -l $PACKAGE | grep -v '^|\|^+\|^Desired'

else
    # Package not found via manager - fall back to uname
    echo "Could not query package manager."
    echo "Currently running kernel: $(uname -r)"
fi

echo ""

# --- case statement: print a philosophy note per package ---
case $PACKAGE in
    linux*)
        echo ">> Linux Kernel: the engine that runs the free world."
        echo "   Torvalds wrote it so ordinary people could own"
        echo "   their computing infrastructure, not just rent it."
        ;;
    httpd|apache2)
        echo ">> Apache: the web server that made the internet free." ;;
    mysql|mariadb)
        echo ">> MySQL/MariaDB: open source at the core of the web." ;;
    python3|python)
        echo ">> Python: a language built entirely by its community." ;;
    git)
        echo ">> Git: Linus built this when proprietary VCS failed him." ;;
    *)
        echo ">> An open-source tool keeping the digital world running." ;;
esac

