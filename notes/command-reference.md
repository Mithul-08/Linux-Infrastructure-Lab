# Command Reference

A	flat	command	reference	grouped	by	topic,	pulled	together	from	everything	used	across	the	lab,	for
quick	lookup.

## System
```
whoami
hostname
uname	-a
date
```
## Navigation
```
pwd
ls
cd	..
cd	~
cd	/
cd
mkdir
touch
```
## Users

```
sudo	adduser	ted
id	ted
```
## Ownership
```
sudo	chown	ted:ted	ted_test.txt
ls	-l	ted_test.txt
```
## Permissions
```
sudo	chmod	640	ted_test.txt
```
|Value|Meaning|
|---|---|
|4|read|
|2|write|
|1|execute|
|640|owner	rw-,	group	r–,	others	—|
|440|owner	r–,	group	r–,	others	—|

## Networking
```
ip	addr
ip	-4	addr
ip	route
ping	-c	4	127.0.0.1
ping	-c	4	<gateway>
ping	-c	4	8.8.8.8
ping	-c	4	google.com
resolvectl	status
```
## Ports
```
ss	-tuln
ss	-tuln	|	grep	:80
ss	-tuln	|	grep	:22
```
## SSH
```
systemctl	status	ssh
systemctl	status	ssh.socket
```
## Nginx
```
sudo	apt	install	nginx
systemctl	status	nginx
sudo	systemctl	start	nginx
sudo	systemctl	stop	nginx
sudo	systemctl	restart	nginx
sudo	systemctl	reload	nginx
sudo	nginx	-t
```

## HTTP
```
curl	http://127.0.0.1
curl	-I	http://127.0.0.1
curl	http://<server_ip>
```

## Logs
```
sudo	tail	-n	20	/var/log/nginx/access.log
sudo	tail	-n	20	/var/log/nginx/error.log
sudo	journalctl	-u	nginx
sudo	journalctl	-u	nginx	-n	20
sudo	journalctl	-u	nginx	--since	"10	minutes	ago"
```

## CPU
```
top
ps	aux	--sort=-%cpu	|	head
```

## Memory
```
free	-h
ps	aux	--sort=-%mem	|	head
```
## Disk
```
df	-h
du	-sh	/var/log/nginx
sudo	du	-sh	/var/*	2>/dev/null	|	sort	-h
```
## Automation
```
./check_nginx.sh
./nginx_errors.sh
./server_health.sh
```
