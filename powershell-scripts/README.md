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
