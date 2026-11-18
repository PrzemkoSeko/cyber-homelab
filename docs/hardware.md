# Hardware

## Main server

| Part | Details |
|---|---|
| Model | Dell OptiPlex 3060 MT |
| CPU | Intel Core i5-8500 (6 cores) |
| RAM | 16 GB DDR4 (2x8 Dual-Channel) |
| SSD M.2 | 256 GB ADATA, used for Proxmox and VMs |
| HDD | 1 TB Seagate, used for photos |
| BIOS version | 1.2.22 |

## Backup

| Part | Details |
|---|---|
| External HDD | Seagate Expansion Portable 2TB USB 3.0 Gen. 1 |
| Usage | Plugged in only during backups |
| Encryption | Encrypted restic repository |

## Health checks

- [X] BIOS updated
- [X] Virtualization (VT-x / VT-d) enabled
- [X] SSD SMART check
- [X] HDD SMART check
- [X] RAM test (MemTest86, one full pass)

Results: both drives report Good in CrystalDiskInfo (HDD reallocated, pending and uncorrectable sectors all 0). RAM passed one full MemTest86 pass.
Power-on hours when I checked: about 31,000 for the SSD and about 31,000 for the HDD (used office drives).

## Changes and upgrades

- 10 Nov 2026: Bought the machine
- 13 Nov 2026: Machine arrived and health checks completed
- 17 Nov 2026: Bought the external backup drive
- 18 Nov 2026: Set up encrypted backups to the external drive
