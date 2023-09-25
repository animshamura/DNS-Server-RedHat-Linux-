yum install bind bind-utils -y

vi /etc/named.conf

vi /var/named/forward.unixmen

vi /var/named/reverse.unixmen

systemctl enable named
systemctl start named

firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=53/udp

firewall-cmd --reload

chgrp named -R /var/named
chown -v root:named /etc/named.conf
restorecon -rv /var/named
restorecon /etc/named.conf

named-checkconf /etc/named.conf

named-checkzone unixmen.local /var/named/forward.unixmen

named-checkzone unixmen.local /var/named/reverse.unixmen

vi /etc/resolv.conf

systemctl restart network

dig masterdns.unixmen.local
  
