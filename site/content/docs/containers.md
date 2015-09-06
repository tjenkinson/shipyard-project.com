+++
Categories = []
Description = ""
Tags = []
title = "Containers"
date = 2014-09-09T03:30:04Z
+++

Shipyard provides container management.  Shipyard strives to be as Docker
centric as possible.  The containers view is modeled directly after the
`docker ps` command in the Docker command line interface.  You can quickly
see all containers that are present in the Swarm cluster.  You can also filter
containers using the search feature.

![Containers](/images/containers-main.png)

As with `docker inspect`, Shipyard can also show container details such
as ID, command, links etc.  We combine information from `docker top` to also 
show the running processes in the container.  Also shown is the node on which 
the container is running.

![Container Details](/images/containers-detail.png)

Container stats are vital in assessing application and service performance.
Shipyard provides a graphical view pulling data from the Docker Stats API
similar to the `docker stats` command.

![Container Stats](/images/containers-stats.png)

Logs are as important as stats.  Shipyard provides the ability to view
container logs as you would from `docker logs`.

![Container Logs](/images/containers-logs.png)

Sometimes it is useful to debug a container to see logs or debug a specific
issue.  When using the Docker CLI, you can use `docker exec` to spawn another
process in a container.  Shipyard provides this ability through a web based
console.

![Container Console](/images/containers-console.png)
