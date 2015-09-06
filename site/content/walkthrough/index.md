+++
Categories = []
Description = ""
Tags = []
menu = "main"
title = "Shipyard Walkthrough"
date = 2014-08-06T04:37:14Z
+++

This is an overview of Shipyard.

# Containers
The containers section provides a single view of all containers in the Swarm
cluster.  You can see details about the containers such as what image is being
used, container status, when it was created and more.  There is also a quick
access menu for container operations such as start, stop, restart and destroy.

![Containers](/images/walkthrough_containers.png)

# Container Details
Details such as name, created date, status, hostname, ports, links, 
container processes etc are shown on the container details view.  You can also 
do operations such as start, stop, restart, view logs, etc.

![Container Detail](/images/walkthrough_containers_detail.png)

# Container Logs
One of the most important things you can see about a container are its logs.
You can quickly see container output for a container in Shipyard.

![Container Logs](/images/walkthrough_containers_logs.png)

# Container Stats
Using the Docker container stats API Shipyard, enables viewing realtime
container stats for CPU, Memory and Networking.

![Container Stats](/images/walkthrough_containers_stats.png)

# Console
The console feature enables you to Docker `exec` into a container.  This 
can be any application that is installed in the container and will allow you to
troubleshoot the system, view logs, etc.

![Container Console](/images/walkthrough_containers_console.png)

# Images
Shipyard enables you to see what images and tags exist across the cluster.  
This enables you to quickly see what versions of what images are deployed
to the Swarm nodes.

![Images](/images/walkthrough_images.png)

# Nodes
You can see all Swarm nodes and their IP / hostnames from the nodes view.

![Nodes](/images/walkthrough_nodes.png)

# Registries
Shipyard can manage private Docker Registries.  You can add multiple registry
endpoints and view and manage repositories in each.  You can also see layer
information such as size and creation date.

![Registries](/images/walkthrough_registries.png)

# Accounts
Shipyard provides authentication and access control.  You can create and manage
user accounts as well as access levels such as read-only or write level access
to containers, images, registries, etc.  Shipyard can also authenticate against
LDAP to integrate with your existing authentication system such as OpenLDAP or
Active Directory.

![Accounts](/images/walkthrough_accounts.png)

# Events
You can track all operations in Shipyard using Events.  These report operations
such as user logins, account management, container operations and more.

![Events](/images/walkthrough_events.png)

