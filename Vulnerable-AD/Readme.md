# 🔥 Vulnerable Active Directory Lab

Welcome to the Vulnerable Active Directory Lab! This lab is designed to help you practice common Active Directory attack techniques in a safe, controlled environment.

---

## 🧪 Lab Setup — Script Execution Order

Run the following PowerShell scripts **in this exact order** to build the vulnerable AD environment:

| Step | Script                      | Description                                                   |
|-------|-----------------------------|---------------------------------------------------------------|
| 1️⃣    | `Rename-And-Restart.ps1`    | Rename machine and reboot before AD DS installation.          |
| 2️⃣    | `Install-ADDS-And-Promote.ps1` | Install Active Directory Domain Services and promote to DC.  |
| 3️⃣    | `Create-AD-Users.ps1`       | Create domain users, groups, OUs, and objects needed for lab. |
| 4️⃣    | `Setup-ACL-AutoTask.ps1`    | Setup weak ACL permissions and scheduled tasks to persist them.|

---
## After Follow this steps

###  ▶️  Run this command to off defender

#### Disable Real-Time Monitoring
        Set-MpPreference -DisableRealtimeMonitoring $true

#### Disable all main Defender protection features
        Set-MpPreference -DisableBehaviorMonitoring $true
        Set-MpPreference -DisableIOAVProtection $true
        Set-MpPreference -DisableScriptScanning $true
        Set-MpPreference -DisableBlockAtFirstSeen $true

#### Disable Cloud-based protection
        Set-MpPreference -MAPSReporting 0
        Set-MpPreference -SubmitSamplesConsent 2



### 🛠️ Step 1 — Create the sqlsvc User in Active Directory

#### Follow the steps below to create a dedicated SQL service account in Active Directory.

##### ✔️ Create the SQL Service Account (sqlsvc)

##### Open Server Manager
#### → Navigate to Tools
<br>
<img width="832" height="64" alt="image" src="https://github.com/user-attachments/assets/e5342355-5290-4a85-b92f-194d6f5feb5b" />
<br>

#### → Select Active Directory Users and Computers.

<img width="395" height="215" alt="image" src="https://github.com/user-attachments/assets/3b18db66-aabd-4dd7-bdcf-d9c59b56ca17" />

##### In the left panel, expand your domain and click on Users.

#### Right-click inside the Users pane and select:
#### New → User

#### Fill in the required details:

#### Configure password options:


<img width="1053" height="483" alt="image" src="https://github.com/user-attachments/assets/19c5af51-a6fe-40af-995f-cbbf94d7b075" />

        Field	Value
        First Name	SQL
        Last Name	Service
        User logon name	sqlsvc
        Click Next, then set the password:
        
<img width="683" height="460" alt="image" src="https://github.com/user-attachments/assets/7835f7a9-4574-49a0-9de4-0f10364d146f" />

<br>
            
        Password: Password@123
        
#### ✔️ Password never expires

#### ❌ User must change password at next logon (leave unchecked)

#### Click Finish to create the user.


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
<br>


### Create new Group Management 

    New-ADGroup -Name "Management" -GroupScope Global -GroupCategory Security
    
### sqlsvc get Write owner to Management group

    dsacls "CN=Management,CN=Users,DC=sandeep,DC=local" /G "sandeep\sqlsvc:WO"
<br>
<img width="862" height="138" alt="image" src="https://github.com/user-attachments/assets/89db6e29-18fb-4561-a24a-bbf2ccde7a9d" />



### Generic write on peter

    dsacls "CN=peter,CN=Users,DC=sandeep,DC=local" /G "sandeep\Management:GW"
<br>
<img width="990" height="160" alt="image" src="https://github.com/user-attachments/assets/000da746-9c95-4d0c-ba99-2f62c482560c" />
    

### hide peter password in powershell history

     Create the missing folders manually (recommended)

### Run this inside Evil-WinRM:

    New-Item -ItemType Directory -Path "C:\Users\peter\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline" -Force


### Then write the fake credential:

    "harry - harry12123" | Add-Content "C:\Users\peter\AppData\Roaming\Microsoft\Windows\Power

<br>
<img width="1280" height="48" alt="image" src="https://github.com/user-attachments/assets/5c2b294c-0637-43a4-a9d7-751ec8c6809c" />

<br>
<br>
                
     harry - iamvery@close129129


# 🛠️ Manual GUI Guide: Grant **SeImpersonatePrivilege** to User **harry**

---

### 🔹 Step 1: Open Local Security Policy

- Press **Windows Key + R** to open the Run dialog.  
- Type `secpol.msc` and press **Enter**.  
- This opens the **Local Security Policy** management console.

---

### 🔹 Step 2: Navigate to User Rights Assignment

- In the left pane, expand **Local Policies**.  
- Click on **User Rights Assignment**.

---

### 🔹 Step 3: Find “Impersonate a client after authentication”

- In the right pane, scroll and find the policy named **“Impersonate a client after authentication”**.  
- Double-click on it to open its properties.

---

### 🔹 Step 4: Add User **harry** to the Policy

- Click **Add User or Group...**  
- In the text box, type `harry`.  
- Click **Check Names** to verify the user.  
- Click **OK**.  
- Click **Apply**, then **OK**.

---

### 🔹 Step 5: Close Local Security Policy

- Close the **Local Security Policy** window.

---

### 🔹 Step 6: Refresh Policy

To apply changes immediately:  
- Restart the machine **OR**  
- Run this command in an elevated Command Prompt or PowerShell:

```powershell
gpupdate /force

   

### Harry Is Member of Rdp and winrm group So that it cn make remote desktop connection









