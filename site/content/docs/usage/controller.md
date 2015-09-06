+++
Categories = []
Description = ""
Tags = []
title = "Usage: controller"
date = 2014-09-20T03:30:04Z
+++

This describes working with the Shipyard Controller.  The examples that follow assume you are using them with the `shipyard/shipyard` Docker image.

## Help
```bash
$> docker run shipyard/shipyard -h

NAME:
   shipyard - composable docker management

USAGE:
   shipyard [global options] command [command options] [arguments...]
   
VERSION:
   3.0.0 (17ed728)
   
COMMANDS:
   server   run shipyard controller
   help, h  Shows a list of commands or help for one command
   
GLOBAL OPTIONS:
   --debug, -D      enable debug
   --help, -h       show help
   --version, -v    print the version
```

## Server
```bash
$> docker run shipyard/shipyard server -h

NAME:
   server - run shipyard controller

USAGE:
   command server [command options] [arguments...]

OPTIONS:
   --listen, -l ":8080"                             listen address
   --rethinkdb-addr "rethinkdb:28015"               RethinkDB address
   --rethinkdb-auth-key                             RethinkDB auth key
   --rethinkdb-database "shipyard"                  RethinkDB database name
   --disable-usage-info                             disable anonymous usage reporting
   --docker, -d "tcp://127.0.0.1:2375"              docker swarm addr [$DOCKER_HOST]
   --tls-ca-cert                                    tls ca certificate
   --tls-cert                                       tls certificate
   --tls-key                                        tls key
   --shipyard-tls-ca-cert                           Shipyard TLS CA Cert
   --shipyard-tls-cert                              Shipyard TLS Cert
   --shipyard-tls-key                               Shipyard TLS Key
   --allow-insecure                                 enable insecure tls communication
   --enable-cors                                    enable cors with swarm
   --ldap-server                                    LDAP server address
   --ldap-port "389"                                LDAP server port
   --ldap-base-dn                                   LDAP server base DN
   --ldap-autocreate-users                          Automatically create a corresponding Shipyard account if missing upon authenticating
   --ldap-default-access-level "containers:ro"      Default access level for auto-created accounts (default: container read-only)
   --auth-whitelist-cidr [--auth-whitelist-cidr option --auth-whitelist-cidr option]    whitelist CIDR to bypass auth
```
