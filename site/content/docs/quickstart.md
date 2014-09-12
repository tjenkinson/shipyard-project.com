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
Start an instance of RethinkDB:

`docker run -it -P -d --name rethinkdb shipyard/rethinkdb`

# API
Start the Shipyard controller:

`docker run -it -p 8080:8080 -d --name shipyard --link rethinkdb:rethinkdb shipyard/shipyard`

Shipyard will create a default user account with the username `admin` and the password `shipyard`.  You should then be able to open a browser to `http://<your-host-ip>:8080` and see the Shipyard login.

# Engine
You can then either use the web UI or the CLI to add an engine.  See [Engines](/docs/engines/) for details.
