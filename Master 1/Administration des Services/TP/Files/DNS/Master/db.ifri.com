$TTL 604800
@   IN  SOA ifri.com. root.ifri.com. (
                2        ; Serial
                604800   ; Refresh
                86400    ; Retry
                2419200  ; Expire
                604800 ) ; Negative Cache TTL
;
@   IN  NS  dns1.ifri.com.
@   IN  NS  dns2.ifri.com.
Router   IN  A   192.168.122.1
dns1     IN  A   192.168.122.12
dns2     IN  A   192.168.122.108
mail     IN  A   192.168.122.81
web      IN  A   192.168.122.211
@        IN  MX  10 mail.ifri.com.
ldap     IN  CNAME  dns2
www      IN  CNAME  web
webmail  IN  CNAME  mail
smtp     IN  CNAME  mail
imap     IN  CNAME  mail