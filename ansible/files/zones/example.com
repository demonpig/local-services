; zone file for example.com

; default TTL for this zone
$TTL 3H

; base domain name
$ORIGIN example.com.

; Start of Authority record defining the key characteristics of this zone
@	IN SOA	ns1.example.com. hostmaster.example.com. (
				2022010412	; serial. Increase it when this file is changed
					1D	    ; refresh
					1H	    ; retry
					1W	    ; expire
					3H )    ; minimum

; Name servers for this domain
	IN	NS	ns1.example.com.

; Mail servers for this domain

; A Records
ns1	IN	A	192.168.56.230
sso	IN	A	192.168.56.231

; AAAA Records

; CNAME Records

; TXT Records
