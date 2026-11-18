# Backups

## Goal

Protect the Immich photo library against disk failure or my own mistakes, using an encrypted backup that I have actually tested by restoring from it.

## Status

- Encrypted backup with restic: working
- Restore test (files and Immich database): passed on 18 Nov 2026
- Weekly script: written, not tested yet

## Design

| What | Where |
|---|---|
| Photo library and Immich database dumps | `/mnt/photos` (800 GB virtual disk on the server's HDD) |
| Backup repository | Seagate Expansion Portable 2 TB, formatted as ext4 |
| Backup tool | restic (encrypted, only copies what changed) |
| Drive connection | Passed through to the Immich VM over USB, plugged in only during a backup |

Immich writes its database dumps into `UPLOAD_LOCATION/backups`, and my library lives in `/mnt/photos`, so backing up that one folder covers both the photos and the database. I do **not** back up the database's live data folder, because a copy taken while it runs can be corrupted.

The drive is mounted only when needed: its `/etc/fstab` entry uses `noauto,nofail`, so the VM boots normally with or without it.

## What I did

1. Formatted the new drive as ext4 and added it to the VM through USB passthrough in Proxmox.
2. Installed restic and created an encrypted repository on the drive.
3. Stored the repository password in a password manager, and in a root-only file on the VM for the backup script.
4. Ran the first backup of `/mnt/photos` and verified it with `restic check`.
5. Created a database dump in Immich and backed up again, so the dump is included.
6. Changed Immich's automatic dump schedule to daily at midnight.

## Restore test

1. Restored the latest snapshot into a temporary folder.
2. Compared it with the originals using `diff -rq`. It printed nothing, so the restored files are identical.
3. Confirmed that the database dumps were inside the restored backup.
4. Restored a database backup from Immich's Administration > Maintenance page. Immich created a restore point first, and it came back working.

## Weekly routine

1. Plug the drive into the server.
2. Run the backup script (`scripts/backup.sh` in this repo is a copy of the one I run on the server). It mounts the drive, backs up, removes old snapshots (8 weekly and 12 monthly are kept), checks a random 5% of the stored data, and unmounts.
3. Wait for the "Done" message, then unplug the drive and put it away.

Planned: a weekly reminder on my phone, so it doesn't depend on me remembering.

## Problems

- **The database dump folder was empty.** Immich creates dumps on a schedule, and most likely my server was off at that time. I only noticed because I looked inside the folder before trusting the backup. I created a dump manually and moved the schedule to midnight, when the server is on.
- **tmux printed odd text into the shell.** It asked my terminal for its background colour and the reply landed on the command line. It was harmless, but the command hadn't run, so I ran the backup without tmux.
- **The first restore comparison failed.** The restore folder didn't exist yet, so `diff` had nothing to compare. After I ran the restore command, the comparison passed.
- **Permission denied when listing the restored folder.** The restored files belong to root, so the command needed `sudo`.
- **Disk names change between reboots.** The photo disk, system disk and backup drive swap between `sda`, `sdb` and `sdc`. This is why every mount uses a UUID instead of a device name.

## What I learned

- Database dumps and photos need to be backed up together.
- Always look inside a backup folder before trusting it.
- Mount disks by UUID, since device names can change.
- A drive that is only connected during backups is safer from mistakes and malware.

## Limitations and next steps

- No alert yet if a weekly backup is missed. Planned: an Uptime Kuma push monitor.
- The backup is run by hand once a week.
