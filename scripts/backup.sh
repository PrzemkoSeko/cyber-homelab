#!/bin/bash
set -euo pipefail

REPO=/mnt/backup/restic-repo
PASS=/etc/restic-password

echo "Mounting backup drive..."
mountpoint -q /mnt/backup || mount /mnt/backup

echo "Backing up photos and database dumps..."
restic -r "$REPO" --password-file "$PASS" backup /mnt/photos

echo "Removing old snapshots (keeping 8 weekly and 12 monthly)..."
restic -r "$REPO" --password-file "$PASS" forget --keep-weekly 8 --keep-monthly 12 --prune

echo "Checking the repository..."
restic -r "$REPO" --password-file "$PASS" check --read-data-subset=5%

echo "Unmounting..."
umount /mnt/backup

echo "Telling Uptime Kuma the backup worked..."
curl -fsS -m 10 --retry 3 "$(cat /etc/kuma-push-url)" > /dev/null || echo "Warning: could not reach Uptime Kuma"

echo "Done. You can unplug the drive now."
