+++
Categories = []
Description = ""
Tags = []
title = ""
date = 2014-09-06T03:30:04Z
+++

# Documentation
This describes working with Shipyard.  You can use the [Quickstart](/docs/quickstart) to deploy Shipyard.

__Note:__ the documentation shows examples using the Shipyard CLI.  You can run an instance of the CLI using the Docker image `shipyard/shipyard-cli`.  For example: 

```
docker run -it shipyard/shipyard-cli
```

# RethinkDB
RethinkDB is used for the account, engine, service key and extension metadata information.  It is not used to store anything about the Docker containers or images.

# Concepts
See the following for details on using Shipyard.

* [Authentication](/docs/authentication/)
* [Engines](/docs/engines/)
* [Containers](/docs/containers/)
* [Service Keys](/docs/servicekeys/)
* [Events](/docs/events/)
* [Cluster Info](/docs/clusterinfo/)

# Extension Images
These are Docker images that add functionality to Shipyard.  See [Extension Images](/docs/extension_images/) for more information.

# Usage

* [Command Line Interface](/docs/usage/cli/)

# API
Shipyard features a powerful API to manage the cluster.

* [API Documentation](/docs/api/)
