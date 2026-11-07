# Cyber-HomeLab

My first homelab project. I'm an IT student learning cybersecurity, and I'm building this to learn by doing and to document what I learn.

> **Status:** Planning. I'm buying the hardware soon, so nothing here is built yet.

## Plan

I'll run everything on one used Dell OptiPlex using Proxmox. The project has two parts:

1. **A private photo server** (Immich)
2. **An isolated security lab** to practise attacking and detecting, kept completely separate from the photo server

## Progress

**Photo server**
- [ ] Buy the hardware and check it (drive health, RAM test, BIOS)
- [ ] Install Proxmox
- [ ] Run Immich in a VM with Docker
- [ ] Set up Tailscale for remote access (no router ports opened)
- [ ] Set up encrypted backups to an external drive
- [ ] Test restoring a backup
- [ ] Write a short note on how I secured it
- [ ] Add monitoring (Uptime Kuma) with phone alerts
- [ ] Add an alert for failed backups

**Security lab**
- [ ] Create an isolated lab network
- [ ] Add a firewall (OPNsense)
- [ ] Add Kali Linux and a vulnerable target
- [ ] Add Wazuh and collect logs
- [ ] Run a simple attack and write down how it was detected

## Hardware (planned)

Dell OptiPlex 3060 MT, i5-8500, 16 GB RAM, 256 GB SSD + 1 TB HDD.
Full setup: [docs/hardware.md](docs/hardware.md)

## Security approach

- Nothing exposed directly to the internet
- Lab kept isolated from the photo server
- No passwords or keys in this repository

## Notes

I'll write up each step here, including the mistakes. Entries will be added as I go.

*Nothing yet.*
