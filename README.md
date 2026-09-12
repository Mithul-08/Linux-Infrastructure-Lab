# Linux Infrastructure Lab

A	hands-on	Linux	infrastructure	and	troubleshooting	lab,	built	on	Ubuntu	Server	running	inside	VMware.

I	put	this	together	to	get	real	practice	with	Linux	administration	—	networking,	SSH,	systemd,	Nginx,	log
analysis,	system	monitoring,	and	Bash	automation	—	rather	than	just	reading	about	it.	The	goal	wasn’t
to	memorize	commands	but	to	get	comfortable	with	a	repeatable	way	of	investigating	problems:

Check	→	Identify	→	Fix	→	Verify	→	Automate

## Repository	Structure

```text
linux-infrastructure-lab/
│
├──	README.md
├──	LICENSE
├──	.gitignore
│
├──	docs/
│			├──	README.md
│			├──	screenshots.md
│			└──	troubleshooting.md
│
├──	networking/
│			└──	README.md
│
├──	nginx/
│			└──	README.md
│
├──	systemd/
│			└──	README.md
│
├──	scripts/
│			├──	check_nginx.sh
│			├──	nginx_errors.sh
│			└──	server_health.sh
│
├──	notes/
│			├──	command-reference.md
│
└──	screenshots/
```

## Project	Overview
This	lab	simulates	the	day-to-day	work	of	a	junior	Linux/infrastructure	administrator	managing	an
Ubuntu	server.	Everything	was	built	inside	a	VMware	virtual	machine,	and	I	used	it	to	work	through:

* Linux	filesystem	navigation
* Users,	groups,	ownership,	and	permissions
* Networking	fundamentals	—	IP	addressing	and	routing
* SSH	and	systemd	socket	activation
* Nginx	installation	and	administration
* HTTP	testing	and	service	troubleshooting
* Log	analysis
* CPU,	memory,	and	disk	monitoring
* Bash	scripting	and	automation
* Failure	simulation	and	recovery
* End-to-end	infrastructure	troubleshooting


| Component | Details |
|---|---|
Operating	System|Ubuntu	Server
Virtualization|VMware
Web	Server|Nginx
Remote	Access|OpenSSH
Shell|Bash
Networking|IPv4,	DNS,	DHCP,	routing
Service	Management|systemd
Monitoring |top,	ps,	free ,	df ,	du,	uptime , ss


Example	VM	network	configuration	used	throughout	the	lab:
```
Interface:	ens33
IP	Address:	192.168.58.131
Network:	192.168.58.0/24
Gateway:	192.168.58.2
```

## Troubleshooting	Methodology	(Summary)
The	main	thing	I	wanted	out	of	this	project	was	to	stop	randomly	restarting	services	and	start
troubleshooting	systematically.	The	full	workflow	lives	in	docs/troubleshooting.md,	but	the	shape	of	it
is:
1.	Check	before	changing	—	don’t	restart	everything;	find	out	what’s	actually	failing	first.
2.	Test	one	layer	at	a	time	—	service	→	port	→	local	HTTP	→	server	IP	→	network	→	firewall	→	client.
3.	Use	logs	to	find	the	reason,	not	just	to	confirm	something	broke.
4.	Validate	configuration	before	applying	it	(nginx	-t	before	every	reload).
5.	Always	verify	after	recovery	—	a	restart	isn’t	a	fix	until	you’ve	confirmed	the	service,	port,	and HTTP	response	are	all	good.
6.	Automate the repetitive	checks	—	this	is	exactly	why	check_nginx.sh,	nginx_errors.sh, and server_health.sh	exist.

## Skills	Demonstrated
Linux	command-line	administration,	Ubuntu	Server	administration,	filesystem	navigation,	user/group
management,	file	ownership,	Linux	permissions,	SSH,	systemd,	systemd	socket	activation,	IPv4
networking,	routing,	DNS	troubleshooting,	DHCP	concepts,	port	inspection,	Nginx	administration,	HTTP
testing,	Nginx	configuration	validation,	log	analysis,	CPU/memory/disk	monitoring,	Bash	scripting,	basic
self-healing	automation,	incident	troubleshooting,	service	recovery,	and	post-fix	verification.

## Future	Improvements
- UFW	firewall	rules
- SSH	hardening
- A	custom	systemd	service
- Cron-scheduled	health	checks
- Log	rotation
- Structured	Bash	logging	with	proper	exit	codes	and	alerting
- An	Nginx	reverse	proxy	in	front	of	a	second	application
- Docker	and	basic	configuration	management
- Monitoring	with	Prometheus/Grafana
- A	multi-VM	setup	instead	of	a	single	box

## Author’s	Note
This	repository	documents	a	self-directed	Ubuntu	Server	administration	and	troubleshooting	lab,	built	to
move	from	“knows	the	commands”	to	“can	actually	diagnose	and	fix	a	broken	server.”	The	approach
throughout	was:	learn	manually,	understand	the	system,	break	things	on	purpose,	recover	them,	verify
the	fix,	then	automate	whatever	was	repeated	more	than	once



