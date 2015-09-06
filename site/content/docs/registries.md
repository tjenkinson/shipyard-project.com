+++
Categories = []
Description = ""
Tags = []
title = "Registries"
date = 2014-09-09T03:30:04Z
+++

Shipyard provides management for Docker Registries attached to a Swarm cluster.
You can attach multiple registries to manage all under a single view.  For
example, you could add staging and production registries to manage both with
Shipyard.

![Registries](/images/registries-main.png)

Once added, you can view the repositories in the registry.  Information such as
namespace, number of tags, number of layers and size are shown.

![Repositories](/images/registries-repositories.png)

You can also view details on the repository.  This view shows information on
the number of tags, layers and size as well as detailed layer information such
as architecture, author and instruction.

![Repository](/images/registries-repository.png)
