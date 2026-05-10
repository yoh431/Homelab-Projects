# osTicket Helpdesk

Installing and configuring osTicket, a real-world open source ticketing system, to simulate IT helpdesk support scenarios in a virtualised lab environment.

---

## Lab environment

| Component | Detail |
|---|---|
| Server | DC01 — Windows Server 2022 |
| Web server | Apache (via XAMPP) |
| Database | MySQL (via XAMPP) |
| Ticketing system | osTicket |
| Domain | `mydomain.local` |

---

## Installation and setup

osTicket requires a web server and database to run. XAMPP was installed on DC01 to provide both Apache and MySQL locally.

**XAMPP installed and services started:**

![XAMPP Control Panel installed](https://github.com/user-attachments/assets/506734e8-e0b9-4463-ac51-73fed83e43b4)

![XAMPP Apache and MySQL running](https://github.com/user-attachments/assets/f0de9ffe-7363-4558-975a-1deb6ca7d298)

**XAMPP welcome page confirming Apache is running:**

![XAMPP welcome page](https://github.com/user-attachments/assets/eba4bdf9-6e44-4e3c-84ba-4ed2080601ed)

**osticket database created in phpMyAdmin:**

![phpMyAdmin database](https://github.com/user-attachments/assets/dba4bd2e-1148-4a43-b014-34912d1d796f)

**osTicket files placed in the XAMPP web root:**

![osTicket files in htdocs](https://github.com/user-attachments/assets/832c6e83-7cb4-453c-944b-b69fabc2285f)

**osTicket installer running in the browser:**

![osTicket installer](https://github.com/user-attachments/assets/a6a82d24-1260-4a0d-a01a-0c8608ccc96c)

**osTicket staff control panel after successful installation and login:**

![osTicket staff panel](https://github.com/user-attachments/assets/6cc514c5-257c-413e-b9c8-04cb50b2610d)

---

## Helpdesk tickets

Three support tickets were created to simulate real helpdesk scenarios, processed through the queue, and resolved with professional responses.

---

### Ticket 1 — Cannot access Control Panel
**Raised by:** Aron Brown (HR)

Aron reported being unable to access Control Panel. This was investigated and identified as expected behaviour — the restriction was intentionally applied via Group Policy to all HR department users.

**Ticket received in the queue:**

![Ticket in queue](https://github.com/user-attachments/assets/e3a37c02-78e8-4975-b7b7-7bc6b0af8f05)

**Ticket resolved with explanation:**

![Ticket 1 resolved](https://github.com/user-attachments/assets/150ced7e-d58c-4739-bba1-35c6e3834059)

---

### Ticket 2 — Account locked out
**Raised by:** Priya Patel (IT)

Priya was locked out of her account after multiple failed login attempts. The account was unlocked in Active Directory and the user was reminded of the account lockout policy configured via GPO.

**Ticket resolved:**

![Ticket 2 resolved](https://github.com/user-attachments/assets/41dcda19-2cf1-464b-b5dd-06ddbf71ec5e)

---

### Ticket 3 — New starter requires domain account
**Raised by:** Marcus Williams (Sales)

Marcus requested a domain account for a new Sales department starter. A new account was created in the Sales OU in Active Directory with a temporary password and the details were passed back to the requester.

**Ticket resolved:**

![Ticket 3 resolved](https://github.com/user-attachments/assets/c4fc7234-9b92-4d3b-aa25-0472301eb472)

---

**All three tickets closed in the queue:**

![All tickets resolved](https://github.com/user-attachments/assets/6d7eb39b-8c1f-47e7-937a-b7cd9f476b05)

---

## Skills demonstrated

`osTicket administration` `Helpdesk ticket management` `XAMPP configuration` `Apache and MySQL setup` `IT support communication` `Active Directory integration` `Group Policy troubleshooting` `New user provisioning`
