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

---

## PowerShell automation

To simulate real-world IT workflows, I wrote two PowerShell scripts to automate user account management in Active Directory.

### Create-ADUsers.ps1
Reads a CSV file of new starters and automatically creates their AD accounts, assigning them to the correct OU with their department, job title, and a default password. Accounts are flagged to require a password change on first login. If a username already exists it skips that entry and logs a warning rather than throwing an error.

**Starting state — Disabled Users OU empty before any scripts are run:**

![Empty Disabled Users OU](https://github.com/user-attachments/assets/d810a9f8-69c9-4c41-a60c-7960daa805dd)

**Create-ADUsers.ps1 script:**

![Create ADUsers script](https://github.com/user-attachments/assets/0d58bd65-07c2-4999-b015-6c39f015b81c)

**Script output — users created successfully:**

![Script output](https://github.com/user-attachments/assets/e35a3fb7-7bea-4b74-8cf5-a4468c340c40)

**Users created and placed in the correct OUs:**

![HR OU](https://github.com/user-attachments/assets/da4ece11-25ce-48e2-934f-09e9ee0b17b3)
![IT OU](https://github.com/user-attachments/assets/45e4f172-eb41-46a9-bb4a-ac2f48f1c5f4)
![Sales OU](https://github.com/user-attachments/assets/41c47b32-bff6-468b-8fd8-4b291ca7ad05)

---

### Disable-ADUsers.ps1
Reads a CSV file of leavers, disables their AD accounts, and automatically moves them to the `Disabled Users` OU. This keeps the directory clean and mirrors standard offboarding procedures used in real IT environments.

**Disable-ADUsers.ps1 script and output:**

![Disable ADUsers script](https://github.com/user-attachments/assets/eebb5fb9-fbe9-4a13-aef6-942581135c5b)

**HR OU after offboarding — Sarah Jones removed:**

![Updated HR OU](https://github.com/user-attachments/assets/14517b23-0ee9-4a3a-a2ec-66ba90cf0ad5)

**Disabled Users OU — Sarah Jones moved here successfully:**

![Updated Disabled Users OU](https://github.com/user-attachments/assets/e04eaa3f-f8d6-4d3f-893f-8364db7f7ff0)

**Final terminal output confirming both scripts ran successfully:**

![Final terminal output](https://github.com/user-attachments/assets/7b488cd8-f86b-4008-a68f-6f3c80db2223)
---

## Roadmap
| Priority | Task | Notes |
|---|---|---|
| Up next | Group Policy Objects | Password policy, desktop restrictions, drive mapping via GPO |
| Up next | Helpdesk ticketing (osTicket) | Simulate and document real IT support scenarios end-to-end |
| ✅ Done | PowerShell automation | Bulk user creation from CSV, automated account management |
| Planned | File server + permissions | Shared folders with OU-based NTFS permissions and audit logging |
| Planned | Second client VM | Simulate multi-user environment and test GPO deployment |
