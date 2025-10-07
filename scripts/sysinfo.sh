#!/usr/bin/env bash
# scripts/sysinfo.sh — print current user, date, and disk usage

# optional: fail fast on errors
set -euo pipefail

echo "=== Current user ==="
whoami
echo

echo "=== Current date ==="
date
echo

echo "=== Disk usage (human-readable) ==="
df -h