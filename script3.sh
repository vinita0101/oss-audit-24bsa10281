bash
#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/lib")

KERNEL_CFG="/boot/config-$(uname -r)"

echo "================================================"
echo "         Directory Audit Report"
echo "================================================"


for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then          # check the dir actually exists
        # awk pulls out specific fields from ls -ld output
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        # 2>/dev/null silences permission denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "  Dir  : $DIR"
        echo "  Perms: $PERMS  Owner: $OWNER  Group: $GROUP  Size: $SIZE"
        echo "  ------------------------------------------------"
    else
        echo "  $DIR — not found on this system."
    fi
done

echo ""
echo "== Kernel Config File Check =="
if [ -f "$KERNEL_CFG" ]; then
    echo "Config found: $KERNEL_CFG"
    ls -lh "$KERNEL_CFG" | awk '{print "Perms:", $1, "Size:", $5}'
else
    echo "Kernel config not found at $KERNEL_CFG"
fi

