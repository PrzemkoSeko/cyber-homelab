# Installing and securing Proxmox

## Goal
Install Proxmox VE 9 on the SSD and get it updated and secured.

## What I did
1. Booted the installer from a USB stick and installed on the 256 GB SSD, which erased the Windows 11 that came with the PC. I left the 1 TB HDD alone.
2. Set a fixed IP address outside the router's DHCP range. I couldn't access the router's admin page, so I chose an address and checked with `ping` and `arp -a` that nothing used it.
3. Switched the update repositories: disabled the enterprise repositories and enabled the no-subscription one.
4. Updated the system.
5. Enabled two-factor authentication (TOTP) for the root account.
6. Wiped the HDD and added it to Proxmox as directory storage for the photo library.

## Problems
- The first package refresh failed with an error, because the enterprise repository needs a paid subscription. Disabling it fixed the problem.

## What I learned
- The subscription popup at login is normal for the free version.
- A "Destination host unreachable" ping reply from Windows can show 0% loss, so the message itself matters, not the loss percentage.
- The Proxmox web interface is only reachable from my home network. No router ports are forwarded.
