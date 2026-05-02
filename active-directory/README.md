# Homelab-Projects

A fully documented Windows Server 2022 + Active Directory lab, built to simulate real-world enterprise IT support scenarios.

![Windows Server 2022](https://img.shields.io/badge/Windows_Server-2022-0078D4?style=flat-square&logo=windows)
![Active Directory](https://img.shields.io/badge/Active_Directory-Configured-5C2D91?style=flat-square)
![VirtualBox](https://img.shields.io/badge/VirtualBox-Lab-183A61?style=flat-square)
![Status](https://img.shields.io/badge/Status-Ongoing-green?style=flat-square)

---

## Lab environment

| Component | Detail |
|---|---|
| Virtualisation platform | VirtualBox |
| Server OS | Windows Server 2022 (Desktop Experience) |
| Client OS | Windows 10 Pro |
| Domain | `mydomain.local` |
| Domain Controller hostname | DC01 |
| DC static IP | 192.168.1.10 |
| Client hostname | CLIENT01 |
| DNS | 127.0.0.1 (on DC) / 192.168.1.10 (on client) |

---

## What I built and configured

- [x] Installed Windows Server 2022 and promoted it to a Domain Controller
- [x] Configured a static IP, DNS, and verified connectivity between VMs
- [x] Created a new AD forest (`mydomain.local`) with Organisational Units for HR, IT, and Sales
- [x] Created and managed multiple domain user accounts across departments
- [x] Joined a Windows 10 Pro client to the domain and authenticated with domain credentials
- [x] Performed helpdesk tasks: password resets, account enable/disable, group membership changes

![OU Setup](https://github.com/user-attachments/assets/70694441-a78e-45a7-9030-b32034a5bedf)
---

## Troubleshooting log

Real issues I hit during setup and how I resolved them.

### DNS — domain join failing with name resolution error
- **Problem:** Client couldn't resolve `mydomain.local` because DNS was pointing at the router, not the DC.
- **Fix:** Changed client DNS to `192.168.1.10`. Used `nslookup mydomain.local` to confirm resolution before retrying the domain join.

### Firewall — ping blocked between VMs
- **Problem:** ICMP was blocked by Windows Firewall on the server, making connectivity look broken.
- **Fix:** Created an inbound firewall rule to allow ICMPv4. Confirmed actual connectivity with `ipconfig` and port checks rather than relying on ping alone.

### Network — missing DNS records after AD DS install
- **Problem:** SRV records for the domain weren't auto-registering, preventing domain services from being located.
- **Fix:** Ran `dcdiag /test:dns` to diagnose, then `ipconfig /registerdns` and restarted the Netlogon service to force re-registration.

![Troubleshooting 1](https://github.com/user-attachments/assets/4c6b65f8-99d7-4888-8605-e64b2b89e454)
![Troubleshooting 2](https://github.com/user-attachments/assets/c80baf6b-cd98-49f7-a90e-6d17858f6ca0)
---

## Skills demonstrated

`Active Directory administration` `Windows Server 2022` `DNS configuration and troubleshooting` `Virtualisation (VirtualBox)` `Network troubleshooting` `User and group management` `Domain join and authentication` `Firewall rule configuration`
