+++
Categories = []
Description = ""
Tags = []
title = "Usage: controller"
date = 2014-09-20T03:30:04Z
+++

This describes working with the Shipyard Controller.  The examples that follow assume you are using them with the `shipyard/shipyard` Docker image.

## View Help
```bash
$> docker run shipyard/shipyard -h

Usage of /app/controller:
  -listen=":8080": listen address
  -rethinkdb-addr="127.0.0.1:28015": rethinkdb address
  -rethinkdb-auth-key="": rethinkdb auth key
  -rethinkdb-database="shipyard": rethinkdb database
```

## Listen
This allows changing of the listen address.  You should not need to change this when running in Docker.

## RethinkDB Address
The sets the connection address to RethinkDB.  This is in `<host-or-ip>:<port>` format.

## RethinkDB Database
This sets the database to use in RethinkDB for Shipyard.

## RethinkDB Authentication Key
This sets the authentication key to use in RethinkDB for Shipyard.
