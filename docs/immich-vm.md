# Preparing the Immich VM

## Goal
Create a VM that will run Immich with Docker, with the OS and database on the SSD and the photo library on the HDD.

## What I did
1. Created a VM with 4 cores, 6 GB RAM and a 40 GB disk on the SSD, plus an 800 GB disk on the HDD storage.
2. Installed Debian 13 with no desktop and an SSH server.
3. Formatted the 800 GB disk as ext4 and mounted it at `/mnt/photos` through `/etc/fstab`, using the disk's UUID.
4. Gave the VM a fixed IP address by editing `/etc/network/interfaces`.
5. Installed Docker Engine from Docker's official apt repository and tested it with `hello-world`.

## Problems
- After rebooting, the disk names swapped (the photo disk went from `sdb` to `sda`). It still mounted correctly because the entry uses the UUID.
- After switching to a fixed IP, name resolution failed. I set the router as the DNS server in `/etc/resolv.conf`, and it worked.

## What I learned
- Always mount disks by UUID, not by device name.
- Disk device names can change between boots.
- Docker installed from the official repository gets updates through apt.
- Users in the `docker` group effectively have root access.
