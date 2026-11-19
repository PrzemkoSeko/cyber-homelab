# Cyber-HomeLab

My first homelab project. I'm an IT student learning cybersecurity, and I'm building this to learn by doing and to document what I learn.

> **Status:** Backups works

## Plan

I'll run everything on one used Dell OptiPlex using Proxmox. The project has two parts:

1. **A private photo server** (Immich)
2. **An isolated security lab** to practise attacking and detecting, kept completely separate from the photo server

## Progress

**Photo server**
- [x] Buy the hardware
- [x] Check the hardware (drive health, RAM test, BIOS)
- [x] Install Proxmox
- [x] Run Immich in a VM with Docker
- [x] Set up Tailscale for remote access (no router ports opened)
- [x] Give a second user access (non-admin account, only the Immich machine shared)
- [x] Set up encrypted backups to an external drive
- [x] Test restoring a backup
- [ ] Add monitoring (Uptime Kuma) with phone alerts
- [ ] Add an alert for failed backups

**Security lab**
- [ ] Create an isolated lab network
- [ ] Add a firewall (OPNsense)
- [ ] Add Kali Linux and a vulnerable target
- [ ] Add Wazuh and collect logs
- [ ] Run a simple attack and write down how it was detected

## Hardware

Dell OptiPlex 3060 MT, i5-8500, 16 GB RAM, 256 GB SSD + 1 TB HDD.

Full setup: [docs/hardware.md](docs/hardware.md)

## Security approach

- Nothing exposed directly to the internet
- Lab kept isolated from the photo server
- No passwords or keys in this repository

## Notes

- 13 Nov 2026: Hardware arrived and passed health checks. [Details in hardware.md](docs/hardware.md)
- 14 Nov 2026: [Installing and securing Proxmox](docs/proxmox-install.md)
- 15 Nov 2026: [Preparing the Immich VM](docs/immich-vm.md)
- 15 Nov 2026: Immich running in Docker Compose, and Tailscale set up for remote access with no router ports opened.
- 18 Nov 2026: [Encrypted backups and restore test](docs/backups.md)
- 18 Nov 2026: [Encrypted backups and restore test](docs/backups.md). Backup script: [scripts/backup.sh](scripts/backup.sh)
- 19 Nov 2026: Updated Immich 3.4.1 to 3.4.2 after a backup
## Current limitations

- Backups are started by hand once a week, and the backup drive is in the same house as the server.
