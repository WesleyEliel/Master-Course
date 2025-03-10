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
1   IN  PTR routeur.ifri.com.
12  IN  PTR dns1.ifri.com.
108 IN  PTR dns2.ifri.com.
81  IN  PTR mail.ifri.com.
211 IN  PTR web.ifri.com.