# Troubleshooting	Methodology

## Website	down
Work	from	the	inside	out:
1.	Service	—	
systemctl	status	nginx .	Is	it	active,	inactive,	or	failed?	If	failed,	investigate	before
restarting.
2.	Configuration	—	
sudo	nginx	-t .	Fix	the	config	before	reloading	if	this	fails.
3.	Logs	—	
sudo	journalctl	-u	nginx	-n	20	and	
sudo	tail	-n	20	/var/log/nginx/error.log .
4.	Port	—	
ss	-tuln	|	grep	:80	to	confirm	Nginx	is	actually	listening.
5.	Local	HTTP	—	
curl	http://127.0.0.1 .	If	this	works,	Nginx	is	fine	locally.
6.	Server	IP	—	
curl	http://SERVER_IP ,	to	test	through	the	network	interface.
7.	Network	—	from	another	machine:	
ping	SERVER_IP ,	then	
curl	http://SERVER_IP .
8.	Firewall	—	
sudo	ufw	status ,	and	
sudo	ufw	allow	80/tcp	if	appropriate.	Check	existing	rules
before	changing	them.

```
Website	unavailable
       │
       ▼
 Check	Nginx	service
       │
┌──────┴──────┐
│             |
Running		Down
│			|
│	Check	logs,	nginx	-t
│			│
|    Fix,restart/reload
└──────┬──────┘
       │
       ▼
  Check	port	80
       │
       ▼
 curl	localhost	→	curl	server	IP
       │
       ▼
 Check	firewall/network
       │
       ▼
    Verify
```

## incident	simulation

**Scenario**:	“The	website	hosted	on	the	Ubuntu	server	is	not	working.”

The	approach:	check	the	service	(
systemctl	status	nginx ),	check	the	port	(
locally	(
ss	-tuln	|	grep	:80 ),	test
curl	http://127.0.0.1 )	and	over	the	network	(
curl	http://192.168.58.131 ),	then	check	logs
(j
ournalctl	-u	nginx ,		
tail	-n	20	/var/log/nginx/error.log )	and	validate	config	(sudo	nginx -t ).

## Principles	that	came	out	of	this

1.	Check	before	changing	—	don’t	restart	everything;	find	out	what’s	actually	failing	first.
2.	Test	one	layer	at	a	time	—	service	→	port	→	local	HTTP	→	server	IP	→	network	→	firewall	→	client.
3.	Use	logs	to	find	the	reason,	not	just	to	confirm	something	broke.
4.	Validate	configuration	before	applying	it	(
nginx	-t	before	every	reload).
5.	Always	verify	after	recovery	—	a	restart	isn’t	a	fix	until	you’ve	confirmed	the	service,	port,	and
HTTP	response	are	all	good.
6.	Automate	the	repetitive	checks	—	this	is	exactly	why	
check_nginx.sh ,	
nginx_errors.sh ,	and	
server_health.sh	exist.





