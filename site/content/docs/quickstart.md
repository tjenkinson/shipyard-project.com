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

`docker run -it -d --name shipyard-rethinkdb-data --entrypoint /bin/bash shipyard/rethinkdb -l`

Start RethinkDB with using the data volume container:

`docker run -it -P -d --name shipyard-rethinkdb --volumes-from shipyard-rethinkdb-data shipyard/rethinkdb`

If your server is directly accessible on Internet, please note your RethinkDB installation may publicly listen to ports 49153 (local instance), 49154 (cluster) and 49155 (web interface) and so accessible to all.

# API
Start the Shipyard controller:

```bash
docker run -it -p 8080:8080 -d --name shipyard \
    --link shipyard-rethinkdb:rethinkdb shipyard/shipyard
```

Shipyard will create a default user account with the username `admin` and the password `shipyard`.  You should then be able to open a browser to `http://<your-host-ip>:8080` and see the Shipyard login.

# Engine
You can then either use the web UI or the CLI to add an engine.  

## Setup
Note: Local socket based access is possible but is limited and not recommended.  For example, port exposure will not work in the UI because it cannot detect the engine IP.  This will also cause problems with the Extension Images as most of them need to be able to detect the engine IP as well.  The recommended setup is to use TCP.  If you want to use the socket setup to test, visit us in IRC.

To setup a host, you will need to be able to access the Docker daemon via TCP.  For setting up TCP in Docker, see the [Docker docs](https://docs.docker.com/articles/basics/).  You can then add an engine using `http://<docker-host-ip>:<docker-host-port>` as the `addr` in the CLI or Host in the UI.

For more information see [Engines](/docs/engines/).
