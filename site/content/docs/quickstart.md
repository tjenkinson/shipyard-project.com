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

```bash
docker run -it -d --name shipyard-rethinkdb-data \
    --entrypoint /bin/bash shipyard/rethinkdb -l
```

Start RethinkDB with using the data volume container:

```bash
docker run -it -P -d --name shipyard-rethinkdb \
    --volumes-from shipyard-rethinkdb-data shipyard/rethinkdb
```

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

## Example
This is an example on adding a Boot2Docker host.

### CLI
`shipyard add-engine --id b2d --addr https://<your-b2d-ip>:2376 --label local --ssl-cert ~/.boot2docker/certs/boot2docker-vm/cert.pem --ssl-key ~/.boot2docker/certs/boot2docker-vm/key.pem --ca-cert ~/.boot2docker/certs/boot2docker-vm/ca.pem`

### UI

* Select the "Engines" tab in Shipyard
* Click "Add"
* Enter your ID for the Name (can be whatever you want)
* Enter one or more labels separated by spaces
* Enter the amount of CPUs and Memory the VM has
* For "Address" enter "https://<your-b2d-ip>:2376"
* Copy the text from ~/.boot2docker/certs/boot2docker-vm/cert.pem into "SSL Certificate"
* Copy the text from ~/.boot2docker/certs/boot2docker-vm/key.pem into "SSL Key"
* Copy the text from ~/.boot2docker/certs/boot2docker-vm/ca.pem into "CA Certificate"
* Click "Add"

In both examples, replace "<your-b2d-ip>" with your Boot2Docker VM ip.  You can get this by running `boot2docker shellinit`.
