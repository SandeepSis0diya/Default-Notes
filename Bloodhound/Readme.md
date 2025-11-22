# Bloodhound Installation and Their useful commands

### youtube link if not understand

https://www.youtube.com/watch?v=oMqf5xV1QsM&ab_channel=Pentestblog


    apt list neo4j
    apt search neo4j

    wget -O /usr/share/keyrings/neo4j-archive-keyring.gpg https://debian.neo4j.com/neotechnology.gpg.key
 
    echo "deb [signed-by=/usr/share/keyrings/neo4j-archive-keyring.gpg] https://debian.neo4j.com stable 5" | sudo tee /etc/apt/sources.list.d/neo4j.list

    sudo apt update
 
    apt install  neo4j
 
    systemctl  start neo4j
 
    systemctl enable neo4j
 

 
    netstat -tuln | grep 7474
    netstat -tuln | grep 7687


    http://localhost:7474/ 
    neo4j console --verbose

  ***---------- in url if there is auth failure. false the auth***
  
    http://localhost:7474/ 
   
    systemctl stop neo4j 
   
    vim /etc/neo4j/neo4j.conf   --- replace true to false
   
    systemctl start neo4j 
      
    http://localhost:7474/  ----go to url
     
    login via username : nio4j   Password: nio4j
     
    cypher-shell -u neo4j -p <your_password>   ----for command line not necessary

     
    DROP USER existing_user;
 
    CREATE USER neo4j SET PASSWORD 'your_password_here' CHANGE NOT REQUIRED;

again replace to true 


      neo4j start 

go to url and login via new credential
username- neo4j
password- Sandeep@1996

download blood hound from github

https://github.com/SpecterOps/BloodHound-Legacy/releases


wright now places in /opt/windowsstaticbinary

    unzip 

    cd BloodHound-linux-x64

    ./BloodHound --no-sandbox

    sudo ln -s /opt/BloodHound-linux-x64/BloodHound /usr/local/bin/bloodhound

    SharpHound.exe -c All -v 2

    .\SharpHound.exe -c All -v 2 --zipfilename output.zip

    bloodhound-python -d tombwatcher.htb -u henry -p H3nry_987TGV! -ns 10.10.11.72 -c all

User Enumeration

     1. List all users:

MATCH (u:User) RETURN u


2. Find users with Kerberoastable SPNs:

       MATCH (u:User) WHERE u.hasspn = true RETURN u


4. Find users who can add members to specific groups:

       MATCH (u:User)-[:AddMember]->(g:Group) RETURN u.name, g.name


jq '.data[].Properties.name' 20250820115654_computers.json

jq '.data[].Properties.samaccountname' 20250820115654_users.json

    crackmapexec smb 192.168.237.173 -u BORIS.CRAWFORD -p 'zxcvbnm' --loggedon-users


Group Enumeration
1. List all groups:

       MATCH (g:Group) RETURN g

2. Find groups with write permissions to other groups:

       MATCH (g:Group)-[:GenericWrite]->(t:Group) RETURN g, t


3. Find nested group membership:

       MATCH (g:Group)-[:MemberOf*1..]->(p:Group) RETURN g.name, p.name



6. Useful queries in BloodHound
• All Domain Admins



            MATCH (u:User)-[:MemberOf*1..]->(g:Group {name:'DOMAIN ADMINS@POSEIDON.YZX'}) RETURN u



• Users with DCSync Rights



            MATCH (u:User)-[:MemberOf*1..]->(g:Group)-[:ExecuteDCsync]->(d:Domain) RETURN u,g,d



• Find all trusts



            MATCH (d1:Domain)-[r:TrustedBy]->(d2:Domain) RETURN d1,d2,r







ACL Enumeration
1. List all ACLs:


            MATCH (n)-[r:HasControl|GenericAll|Owns]->(m) RETURN n.name, type(r), m.name


2. Find users with GenericAll on specific objects:

MATCH (u:User)-[r:GenericAll]->(o) RETURN u.name, o.name



