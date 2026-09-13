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







