# Homelab Projects

A collection of hands-on IT projects built in a virtualised home lab environment, designed to simulate real-world enterprise IT support scenarios. Built to develop practical skills for an IT helpdesk apprenticeship.

---

## Lab environment

| Component | Detail |
|---|---|
| Virtualisation platform | VirtualBox |
| Server OS | Windows Server 2022 (Desktop Experience) |
| Client OS | Windows 10 Pro |
| Domain | `mydomain.local` |
| Domain Controller | DC01 — 192.168.1.10 |

---

## Projects

### 1. Active Directory Setup
Setting up a Windows Server 2022 Domain Controller, configuring a domain, creating Organisational Units, managing users and groups, and joining a client machine to the domain.

[View project →](./active-directory/README.md)

---

### 2. PowerShell User Management
Automating AD user account creation and offboarding using PowerShell scripts driven by CSV input files.

[View project →](./powershell-scripts/README.md)

---

## Roadmap

| Priority | Task | Notes |
|---|---|---|
| Up next | Group Policy Objects | Password policy, desktop restrictions, drive mapping via GPO |
| Up next | Helpdesk ticketing (osTicket) | Simulate and document real IT support scenarios end-to-end |
| Planned | File server + permissions | Shared folders with OU-based NTFS permissions and audit logging |
| Planned | Second client VM | Simulate multi-user environment and test GPO deployment |
