+++
Categories = []
Description = ""
Tags = []
title = "Cluster Info"
date = 2014-09-09T03:30:04Z
+++

Shipyard provides information to get a view of the state of the cluster.  It will report total cluster resources such as CPUs and memory, containers, images, engines and reserved CPUs and memory.

# Example

## View Cluster Info
```bash
shipyard cli> shipyard info
Cpus: 4.00
Memory: 8192.00 MB
Containers: 2
Images: 5
Engines: 1
Reserved Cpus: 4.00% (0.16)
Reserved Memory: 3.52% (288.00 MB)
```
