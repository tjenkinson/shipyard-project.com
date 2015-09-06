+++
Categories = []
Description = ""
Tags = []
title = ""
date = 2014-09-06T03:30:04Z
+++

# Documentation
This describes working with Shipyard.  You can use the [Quickstart](/docs/quickstart) to deploy Shipyard.

See the following for details on using Shipyard.

* [Containers](/docs/containers/)
* [Images](/docs/images/)
* [Nodes](/docs/nodes/)
* [Registries](/docs/registries/)
* [Accounts](/docs/accounts/)
* [Events](/docs/events/)

# Usage

* [Controller](/docs/usage/controller/)

# API
Shipyard features a powerful API to manage the cluster.

* [API Documentation](/docs/api/)

# Database
RethinkDB is used for the account, engine, service key and metadata information.  It is not used to store anything about the Docker containers or images.  The `/data` directory is exposed as a volume.

# Usage Info
By default, the controller will periodically report anonymous usage information.  This includes things like number of engines etc.  It is anonymous (not even an IP or image name is recorded).  To opt-out, use the `-disable-usage-info` argument when launching the controller.
