# Documentation
Supporting	documentation	for	the	Linux	Infrastructure	Lab,	covering	Linux	fundamentals,	users	and
permissions,	networking,	SSH	and	systemd,	Nginx,	logs	and	troubleshooting,	system	monitoring,	Bash
automation,	and	the	final	incident	methodology

## Contents
- troubleshooting.md
—	the	full	troubleshooting	methodology	used	throughout	the	lab,	including
the	“website	down”	workflow,	resource	troubleshooting,	and	the	recovery	pattern.
- screenshots.md
—	the	recommended	screenshots	to	capture	from	the	actual	VMware
environment,	and	the	order	they	should	be	numbered	in.
- ../scripts/
—	the	automation	scripts	( check_nginx.sh ,	nginx_errors.sh ,	server_health.sh ) referenced	throughout	the	docs.

## What’s	covered

|Topic |Where	it	lives|
|---|---|
|Filesystem,	users,	permissions|root	README.md|
|Networking	(IP,	routing,	DNS,	ports)|networking/README.md|
|Nginx	installation,	config,	logs|nginx/README.md|
|systemd	+	SSH	socket	activation|systemd/README.md|
|Full	troubleshooting	methodology|docs/troubleshooting.md|
|Screenshot	checklist|docs/screenshots.md|
|Command	reference|notes/command-reference.md|
