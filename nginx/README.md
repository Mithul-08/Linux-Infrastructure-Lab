# Nginx
## Installation
```
sudo	apt	update
sudo	apt	install	nginx
```
## Basic	checks
```
systemctl	status	nginx
ss	-tuln	|	grep	:80
curl	http://127.0.0.1
curl	http://192.168.58.131
```
## Service	recovery
Deliberately	stopped	the	service	(
sudo	systemctl	stop	nginx ),	confirmed	it	dropped	port	80,	then
brought	it	back	with	
sudo	systemctl	start	nginx	and	verified	the	service,	port,	and	HTTP	response again.

**Pattern** :	Detect	failure	→	Recover	service	→	Verify	service	→	Verify	port	→	Verify	HTTP
## Configuration	validation
```
sudo	nginx	-t
```
A	clean	config	test	returns:
```
syntax	is	ok
test	is	successful
```
Always	worth	running	before	reloading	or	restarting	after	a	config	change	—	catching	a	syntax	error
here	beats	catching	it	after	a	reload	takes	the	site	down.
## Logs
Two	logs	matter	most:
- /var/log/nginx/access.log
- /var/log/nginx/error.log

A	successful	request	in	the	access	log	looks	like:
```
127.0.0.1	-	-	[03/Sep/2026:18:53:08	+0000]	"GET	/	HTTP/1.1"	200	615	"-"	"curl/8.5.0"
```
That	single	line	carries	the	client	IP,	timestamp,	HTTP	method,	path,	protocol	version,	status	code,
response	size,	referrer,	and	user	agent.

Requesting	a	page	that	doesn’t	exist	( curl	-i	http://127.0.0.1/does_not_exist )	is	a	quick	way	to	see	a 404	show	up	in	the	log.

The	error	log	is	a	bit	more	nuanced	—	not	everything	in	there	is	actually	an	error.	An	entry	like:

```
2026/09/03	16:50:13	[notice]	2134#2134:	using	inherited	sockets	from	"5;6;"
```
is	just	a	notice,	not	a	failure.

## systemd	journal
```
sudo	journalctl	-u	nginx
sudo	journalctl	-u	nginx	-n	20
sudo	journalctl	-u	nginx	--since	"10	minutes	ago"
```
A	clean	restart	shows	the	expected	lifecycle	in	the	journal	—	stopping,	deactivating,	stopped,	starting,
started.
