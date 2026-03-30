bash
#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# ============================================================
STUDENT_NAME="Vinita Sharma"
SOFTWARE_CHOICE="Linux Kernel"
KERNEL=$(uname -r)                          # running kernel version
USER_NAME=$(whoami)                         # who is logged in
HOME_DIR=$HOME                              # home directory path
UPTIME=$(uptime -p)                         # uptime in plain English
DATE_TIME=$(date "+%A, %d %B %Y  %H:%M")
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)
OS_LICENSE="GNU General Public License v2 (GPL v2)"
echo "================================================"
echo "   Open Source Audit — System Identity Report"
echo "================================================"
echo "  Student   : $STUDENT_NAME"
echo "  Project   : $SOFTWARE_CHOICE"
echo "------------------------------------------------"
echo "  Distro    : $DISTRO"
echo "  Kernel    : $KERNEL"
echo "  User      : $USER_NAME"
echo "  Home      : $HOME_DIR"
echo "  Uptime    : $UPTIME"
echo "  Date/Time : $DATE_TIME"
echo "------------------------------------------------"
echo "  OS License: $OS_LICENSE"
echo "  The Linux kernel is free — you can study, modify,"
echo "  and redistribute it under the terms of GPL v2."
echo "================================================"

