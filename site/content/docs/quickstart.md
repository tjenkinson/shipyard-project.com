+++
Categories = []
Description = ""
Tags = []
menu = "main"
title = "Quickstart"
date = 2015-04-24T04:37:14Z
+++

Shipyard uses RethinkDB for its datastore.  User accounts, service keys, 
webhook keys metadata are stored in RethinkDB.  No container information is 
stored.

> Note: you must have a Docker engine available.  If you do not have Docker
see http://docs.docker.com/ to get started.

# Option 1: Shipyard Deploy
Shipyard Deploy is a small script that will use the Docker CLI 
to deploy Shipyard.  See the usage below to view the help for all options.  

This will deploy Shipyard using the current Docker host.

```
curl -s https://shipyard-project.com/deploy | bash -s
```

For full usage details:

```
curl -s https://shipyard-project.com/deploy | bash -s -- -h
```

Once deployed, the script will output the URL to connect.

Username: admin
Password: shipyard
