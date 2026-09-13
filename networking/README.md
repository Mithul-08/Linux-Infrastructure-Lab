# Networking

## IP	Address
The	VM	used	an	interface	named	
ens33 ,	with	an	address	on	the	192.168.58.0/24	network.
``` text
ip	addr
ip	-4	addr
```

## Routing
```text
ip	route
```
``` text
default	via	192.168.58.2	dev	ens33
192.168.58.0/24	dev	ens33
```
Default	gateway:	
192.168.58.2 .	The	routing	table	tells	Linux	where	to	send	traffic	that	isn’t	destined	for
the	local	network.
## Loopback
127.0.0.1	(or	
localhost )	always	refers	to	the	same	machine,	which	makes	it	useful	for	testing	local
services	without	touching	the	external	network:
``` text
ping	-c	4	127.0.0.1
```
## Connectivity	Testing
``` text
ping	-c	4	127.0.0.1			  #	local	system
ping	-c	4	192.168.58.2		#	gateway
ping	-c	4	8.8.8.8					#	external	IP
ping	-c	4	google.com			#	DNS	+	internet
```
Running	these	in	order	helps	narrow	down	where	a	connectivity	problem	actually	lives	—	local	system,
gateway,	internet	routing,	or	DNS.
## DNS
```text
resolvectl	status
```
## Ports	&	Listening	Services
```text
ss	-tuln
```
Ports	I	ran	into	regularly	during	the	lab:
|Port|Service|
|---|---|
|22|SSH|
|80|HTTP	/	Nginx|
|53|Local	DNS	resolver|
|68|DHCP	client|
