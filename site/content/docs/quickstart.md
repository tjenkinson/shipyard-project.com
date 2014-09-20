+++
Categories = []
Description = ""
Tags = []
menu = "main"
title = "Quickstart"
date = 2014-08-06T04:37:14Z
+++

This will get Shipyard up and running.

There are two components to Shipyard: RethinkDB and the API.

# RethinkDB
Start an data volume instance of RethinkDB:

`docker run -it -d --name shipyard-rethinkdb-data --entrypoint /bin/bash shipyard/rethinkdb echo data vol for shipyard rethinkdb`

Start RethinkDB with using the data volume container:

`docker run -it -P -d --name shipyard-rethinkdb --volumes-from shipyard-rethinkdb-data shipyard/rethinkdb`

# API
Start the Shipyard controller:

```bash
docker run -it -p 8080:8080 -d --name shipyard \
    --link shipyard-rethinkdb:rethinkdb shipyard/shipyard
```

Shipyard will create a default user account with the username `admin` and the password `shipyard`.  You should then be able to open a browser to `http://<your-host-ip>:8080` and see the Shipyard login.

# Engine
You can then either use the web UI or the CLI to add an engine.  

## Single Host
In a local host only setup, you can use the the local socket.  You will also need to bind the Docker socket to the controller container upon start.  For example:

```bash
docker run -it -p 8080:8080 -d \
    -v /var/run/docker.sock:/docker.sock \
    --name shipyard --link rethinkdb:rethinkdb \
    shipyard/shipyard
```

Then you can add an engine using `unix:///docker.sock` for the `addr`.

## Multi Host
For a multi host setup, you will need to be able to access the Docker daemon via TCP.  For setting up TCP in Docker, see the [Docker docs](https://docs.docker.com/articles/basics/).  You can then add an engine using `http://<docker-host-ip>:<docker-host-port>`.

For more information see [Engines](/docs/engines/).
