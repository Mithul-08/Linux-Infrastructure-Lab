# systemd
## Basic	service	lifecycle
```
systemctl	status	<service>
systemctl	start	<service>
systemctl	stop	<service>
systemctl	restart	<service>
systemctl	reload	<service>
```
## SSH	Socket	Activation
Stopping	the	SSH	service	on	its	own	didn’t	kill	port	22	—	ssh.socket	was	still	holding	it	open:
```
systemctl	status	ssh
systemctl	status	ssh.socket
```

Stopping	the	socket	made	port	22	disappear;	starting	it	again	brought	it	back.	That’s	the	relationship:

```
ssh.socket	→	listens	on	port	22	→	triggers	→	ssh.service
```
Request	path:	**client	→	TCP	port	22	→	ssh.socket	→	ssh.service	→	sshd**

This	is	why	stopping ssh.service	alone	doesn’t	necessarily	free	up	port	22	while ssh.socket is still active. 

## Reading	the	journal
```
journalctl						    	#	full	system	journal							
journalctl	-u	nginx		  		#	logs	for	a	single	unit
journalctl	-u	nginx	-n	20	   	#	last	20	lines	for	a	unit
```
