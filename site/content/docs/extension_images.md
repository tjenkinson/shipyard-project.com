+++
Categories = []
Description = ""
Tags = []
menu = ""
title = "Extension Images"
date = 2014-09-12T04:37:14Z
+++

Extension images are Docker images that add functionality to Shipyard core.

# Usage

## View Extensions
```bash
shipyard cli> shipyard extensions
ID                                      Name            Version Author          Image                   Url                                     Description
d38c0a74-c0d3-4102-acde-a8dd331460aa    interlock       0.1     ehazlett        ehazlett/interlock      https://github.com/ehazlett/interlock   application router and load balancer
```

## Add Extension
```bash
shipyard cli> shipyard add-extension \
    --url http://url/to/extension.conf
```

## Remove Extension
```bash
shipyard cli> shipyard remove-extension <id>
```

# Images
To see all extension images or submit your own, please see the [Extensions](https://github.com/shipyard/shipyard-extensions/) GitHub repository.

These are the current images and also those that are being developed:

## Load Balancing and Routing

* [Interlock](https://github.com/ehazlett/interlock) already integrates with Shipyard (https://github.com/ehazlett/interlock#shipyard-integration)

To use Interlock, run the following:

`shipyard add-extension --url https://raw.githubusercontent.com/shipyard/shipyard-extensions/master/routing/interlock.conf`

When prompted, enter the url to your Shipyard host and Service Key.

For example:

```bash
shipyard cli> shipyard add-extension --url https://raw.githubusercontent.com/shipyard/shipyard-extensions/master/routing/interlock.conf

configuring interlock (https://github.com/ehazlett/interlock for more info)
enter value for container argument -shipyard-url:
enter value for container argument -shipyard-service-key:
```

## Provisioning
This will include ways to launch Docker hosts and automatically configure them as engines in the cluster.

## Stats
This will enable container level stats across hosts, most likely using [cAdvisor](https://github.com/google/cadvisor)

## Logging
This will enable container level log retrieval throughout the cluster, most likely using [logspout](https://github.com/progrium/logspout)

## Backup
This image will enable backing up containers (exporting containers and sending to a storage service; s3, etc)

Please feel free to contact us on IRC or submit a [GitHub](https://github.com/shipyard/shipyard) issue if you would like to see something else.

# Creating Extensions
To create an extension, simply create a configuration file in JSON format.  These are the available fields:

* `name`: creator designated name of extension
* `image`: Docker image that is used (must be on the Docker Hub)
* `version`: extension version
* `author`: extension author
* `description`: short description of extension
* `url`: url to extension source
* `config`: container run config
  * `container_name`: optional name of container
  * `cpus`: number of cpu shares
  * `memory`: amount of memory (in MB)
  * `volumes`: volumes to use in container
  * `ports`: ports published when container is started
  * `deploy_per_engine`: this will run a container for each engine in the cluster
  * `prompt_args`: array of container arguments that user is prompted to enter upon adding
  * `prompt_env`: array of container environment variables that user is prompted to enter upon adding

## Example

```json
{
  "name": "interlock",
  "image": "ehazlett/interlock",
  "version": "0.1",
  "author": "ehazlett",
  "description": "application router and load balancer",
  "url": "https://github.com/ehazlett/interlock",
  "config": {
    "prompt_args": [
      "-shipyard-url",
      "-shipyard-service-key"
    ],
    "cpus": 0.1,
    "memory": 32,
    "ports": [
      {
        "proto": "tcp",
        "port": 80,
        "container_port": 8080
      }
     ],
    "deploy_per_engine": false
  }
}
```

When you have created the extension, send a pull request to the [shipyard/shipyard-extensions](https://github.com/shipyard/shipyard-extensions) GitHub repository to be included in the extension directory.
