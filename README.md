# Active Directory Home Lab

## Overview
This project demonstrates the setup and configuration of a Windows Server 2022 Domain Controller and a Windows 10 client machine in a virtualized lab environment using VirtualBox. The lab simulates a real-world enterprise network with centralized user and device management via Active Directory.

---

## Lab Environment
- Virtualization Platform: VirtualBox
- Server OS: Windows Server 2022 (Desktop Experience)
- Client OS: Windows 10 Pro
- Domain: mydomain.local
- Server IP: 192.168.1.10

---

## 1. VM Setup
- Created virtual machines for Domain Controller (DC01) and Client (CLIENT01)
- Allocated appropriate resources (RAM, CPU, storage)
- Configured networking to allow communication between VMs

---

## 2. Windows Server Installation
- Installed Windows Server 2022 (Desktop Experience)
- Completed initial system configuration

---

## 3. Network Configuration
- Assigned static IP to Domain Controller:
  - IP: 192.168.1.10
  - Subnet: 255.255.255.0
  - DNS: 127.0.0.1
- Verified connectivity between machines using ping

---

## 4. Active Directory Setup
- Installed Active Directory Domain Services (AD DS)
- Promoted server to Domain Controller
- Created new forest: `mydomain.local`

---

## 5. Organizational Units and Users
- Created Organizational Units:
  - HR
  - IT
  - Sales
- Created multiple user accounts to simulate a business environment

![OU Setup](https://github.com/user-attachments/assets/70694441-a78e-45a7-9030-b32034a5bedf)

---

## 6. IT Support Tasks Performed
- Reset user passwords
- Disabled and re-enabled user accounts
- Managed group memberships

---

## 7. Client Machine Setup & Domain Join
- Installed Windows 10 Pro on client VM
- Configured DNS to point to Domain Controller
- Successfully joined client machine to domain
- Logged in using domain user credentials

---

## 8. Troubleshooting & Problem Solving
During setup, several issues were encountered and resolved:

- Network connectivity issues between VMs
- DNS misconfiguration preventing domain resolution
- Missing DNS records affecting domain join
- Firewall interference blocking DNS queries
- Verified and corrected IP/DNS settings using `ipconfig` and `nslookup`

![Troubleshooting 1](https://github.com/user-attachments/assets/4c6b65f8-99d7-4888-8605-e64b2b89e454)
![Troubleshooting 2](https://github.com/user-attachments/assets/c80baf6b-cd98-49f7-a90e-6d17858f6ca0)

---

## Key Skills Demonstrated
- Active Directory Administration
- Windows Server Configuration
- DNS Configuration and Troubleshooting
- Virtualization (VirtualBox)
- Network Troubleshooting
- User Account Management

---

## Next Steps
- Implement Group Policy Objects (GPOs)
- Add additional client machines
- Simulate helpdesk scenarios (account lockouts, permissions issues)
- Configure file sharing and permissions
