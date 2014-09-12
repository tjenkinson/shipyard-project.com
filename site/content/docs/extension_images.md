+++
Categories = []
Description = ""
Tags = []
menu = ""
title = "Extension Images"
date = 2014-09-12T04:37:14Z
+++

Extension images are Docker images that add functionality to Shipyard core.  This a work in progress but it is listed here to get an idea of what is to come.

# Integration
There will be an Extension API that allows the images to specify how they should be integrated into Shipyard.  For example, an image may need a container running on every host in order to provide the service (a stats container for example).  Another image may just need a single container running in the entire cluster.  The API will allow integration and this metadata.

# Images
These are the images that will come initially:

## Load Balancing and Routing

* [Interlock](https://github.com/ehazlett/interlock) already integrates with Shipyard (https://github.com/ehazlett/interlock#shipyard-integration)

## Provisioning
This will include ways to launch Docker hosts and automatically configure them as engines in the cluster.

## Stats
This will enable container level stats across hosts, most likely using [cAdvisor](https://github.com/google/cadvisor)

## Logging
This will enable container level log retrieval throughout the cluster, most likely using [logspout](https://github.com/progrium/logspout)

## Backup
This image will enable backing up containers (exporting containers and sending to a storage service; s3, etc)

Please feel free to contact us on IRC or submit a [GitHub](https://github.com/shipyard/shipyard) issue if you would like to see something else.
