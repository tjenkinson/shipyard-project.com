+++
Categories = []
Description = ""
Tags = []
title = "Events"
date = 2014-09-09T03:30:04Z
+++

Shipyard logs all events in the cluster such as container creation, starts, stops, service key management, engine management and more.

# Examples

## View Events
```bash
$> shipyard events
Time                  Message         Engine  Type     Tags
Sep 09 06:58:13 2014  container:6c07  local   start    docker
Sep 09 06:58:13 2014  container:6c07  local   create   docker
```
