# Cyber-HomeLab

My first homelab project. I'm an IT student learning cybersecurity, and I'm building this to learn by doing and to document what I learn.

> **Status:** Immich running and reachable remotely through Tailscale, with a second user. Next: encrypted backups. Until they work, original photos stay on the phones.

## Plan

I'll run everything on one used Dell OptiPlex using Proxmox. The project has two parts:

1. **A private photo server** (Immich)
2. **An isolated security lab** to practise attacking and detecting, kept completely separate from the photo server

## Progress

**Photo server**
- [X] Buy the hardware
- [X] Check the hardware (drive health, RAM test, BIOS)
- [X] Install Proxmox
- [X] Run Immich in a VM with Docker
- [X] Set up Tailscale for remote access (no router ports opened)
- [x] Give a second user access (non-admin account, only the Immich machine shared)
- [X] Set up encrypted backups to an external drive
- [X] Test restoring a backup
- [ ] Write a short note on how I secured it
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
- 15 Nov 2026: Immich running in Docker Compose. Database on the SSD, photo library on the HDD disk.
- 15 Nov 2026: Tailscale installed on the Immich VM only (not on Proxmox), tested from a phone over mobile data. A second user got her own Immich account and access to the Immich machine only, with no router ports opened.
- 18 Nov 2026: [Encrypted backups and restore test](docs/backups.md)
## Current limitations

- No backup of the photo library yet (planned: encrypted external drive)
- No monitoring or alerts yet
