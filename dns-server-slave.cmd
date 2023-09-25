vi /etc/named.conf

systemctl enable named
systemctl start named

ls /var/named/slaves/

vi /etc/resolv.conf

systemctl restart network

firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --reload

chgrp named -R /var/named
chown -v root:named /etc/named.conf
restorecon -rv /var/named
restorecon /etc/named.conf

dig masterdns.unixmen.local

dig secondarydns.unixmen.local

nslookup unixmen.local

vi /etc/resolv.conf
search unixmen.local
nameserver 192.168.1.101
nameserver 192.168.1.102

dig masterdns.unixmen.local
dig secondarydns.unixmen.local
dig client.unixmen.local
nslookup unixmen.local

