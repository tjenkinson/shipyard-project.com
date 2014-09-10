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

`docker run -it -P -d --name shipyard-rethinkdb shipyard/rethinkdb`

Get the port of the RethinkDB container:

`docker port shipyard-rethinkdb 28015`

# API
Start the Shipyard controller:

`docker run -it -p 8080:8080 -d --name shipyard shipyard/shipyard:v2 -rethinkdb-addr <your-host-ip>:<exposed-rethinkdb-port-above>`

Shipyard will create a default user account with the username `admin` and the password `shipyard`.  You should then be able to open a browser to `http://<your-host-ip>:8080` and see the Shipyard login.
