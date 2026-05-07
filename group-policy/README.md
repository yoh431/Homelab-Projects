# Group Policy Objects

Configuring and testing Group Policy Objects (GPOs) in a Windows Server 2022 Active Directory environment to enforce security settings and desktop restrictions across the domain.

---

## Lab environment

| Component | Detail |
|---|---|
| Domain Controller | DC01 — Windows Server 2022 |
| Client machine | CLIENT01 — Windows 10 Pro |
| Domain | `mydomain.local` |
| Tool used | Group Policy Management Console (GPMC) |

---

## Overview

Group Policy Objects allow an administrator to enforce settings across users and computers in a domain from a single location. Rather than configuring each machine manually, a GPO is created once on the Domain Controller and automatically applies to everyone in the targeted OU.

**Group Policy Management open showing the domain structure:**

![Group Policy Management](https://github.com/user-attachments/assets/8dfd62d8-d8d7-4c5e-b62f-e671b1b556ec)

---

## GPO 1 — Password Policy

Applied at the **domain level** so it affects all users across every OU.

| Setting | Value | Reason |
|---|---|---|
| Enforce password history | 5 | Prevents reuse of last 5 passwords |
| Maximum password age | 90 days | Forces regular password changes |
| Minimum password age | 1 day | Prevents immediately cycling back to old password |
| Minimum password length | 10 characters | Reduces risk of brute force attacks |
| Password complexity requirements | Enabled | Requires mix of uppercase, lowercase, numbers and symbols |

**Password Policy GPO created and linked to the domain:**

![Password Policy GPO](https://github.com/user-attachments/assets/234d0b94-6f71-4374-a436-4f0ebd058ff3)

**Password Policy settings open in Group Policy Management Editor:**

![Password Policy settings](https://github.com/user-attachments/assets/e5314a60-2797-4c21-89ad-ae247db91e35)

**Enforce password history — set to 5:**

![Enforce password history](https://github.com/user-attachments/assets/69d44890-2314-48eb-a6d5-f34d7ea94762)

**Maximum password age — set to 90 days:**

![Maximum password age](https://github.com/user-attachments/assets/5a2d7ff6-ca2f-4aac-9f36-29dbcb78370b)

**Minimum password age — set to 1 day:**

![Minimum password age](https://github.com/user-attachments/assets/243d7c09-c4d8-4b64-882a-580b1fa7e415)

**Minimum password length — set to 10 characters:**

![Minimum password length](https://github.com/user-attachments/assets/ec764eb4-e431-47c4-85ef-1be16a8bde7a)

**Password complexity requirements — set to Enabled:**

![Password complexity](https://github.com/user-attachments/assets/e1a41c9a-ee4c-43e2-894a-d484409bf33e)

---

## GPO 2 — Account Lockout Policy

Applied at the **domain level** alongside the Password Policy. Protects against brute force login attempts by locking accounts after repeated failures.

| Setting | Value | Reason |
|---|---|---|
| Account lockout threshold | 5 attempts | Locks account after 5 failed logins |
| Account lockout duration | 30 minutes | Account automatically unlocks after 30 minutes |
| Reset account lockout counter after | 30 minutes | Failed attempt counter resets after 30 minutes |

**Account lockout settings configured:**

![Account lockout settings](https://github.com/user-attachments/assets/ddce54e9-bccc-4dfe-a027-b28993690a53)

---

## GPO 3 — Desktop Restrictions

Applied specifically to the **HR OU** to simulate the kind of restrictions placed on standard business users. IT staff are excluded as they need full access to system settings.

| Setting | Value |
|---|---|
| Prohibit access to Control Panel and PC Settings | Enabled |
| Prevent changing desktop background | Enabled |

**Desktop Restrictions GPO linked to the HR OU:**

![Desktop Restrictions GPO](https://github.com/user-attachments/assets/1cd0fff6-a4de-42f1-a02c-31777d931d06)

**Control Panel access prohibited:**

![Control Panel restriction](https://github.com/user-attachments/assets/6c5b831f-ee1b-4fbf-b9d9-8eeb3c6ad250)

**Desktop background change prevented:**

![Wallpaper restriction](https://github.com/user-attachments/assets/6bb5387d-c923-4e84-bac5-da54a96590ac)

---

## Testing and verification

After configuring all three GPOs, `gpupdate /force` was run on DC01 to push the policies out immediately rather than waiting for the default refresh cycle.

**gpupdate /force run successfully on DC01:**

![gpupdate /force](https://github.com/user-attachments/assets/2cdd099c-969b-4519-8535-909314d1643e)

CLIENT01 was then logged into using an HR domain account (`abrown`) to verify the desktop restrictions were applying correctly.

**Control Panel blocked on CLIENT01:**

![Control Panel blocked](https://github.com/user-attachments/assets/ba9d7cf3-8caf-4efd-bb1f-1fa32f4394b4)

**Wallpaper personalisation blocked on CLIENT01:**

![Wallpaper blocked](https://github.com/user-attachments/assets/7a9bb49a-ffac-4bdb-bc8a-98ee04c302f8)

---

## Skills demonstrated

`Group Policy Management` `Password Policy configuration` `Account Lockout Policy` `Desktop restrictions` `OU-based policy targeting` `gpupdate` `Windows Server 2022` `Active Directory`
