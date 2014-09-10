+++
Categories = []
Description = ""
Tags = []
title = "Authentication"
date = 2014-09-06T03:30:04Z
+++

Shipyard supports multiple users.  You must login to manage a Shipyard cluster.

Note: Shipyard will auto-create an administrative user upon creation.  See the controller output for login information after starting Shipyard.

# Accounts
You can create multiple accounts to allow access for other users.  You must be an administrator to add new accounts.

# Roles
There are currently two types of roles in Shipyard:  `admin` and `user`.

The `admin` role has full control over the cluster.

The `user` role can do everything except manage accounts and service keys.

# Examples

## Create an Account
```bash
shipyard cli> shipyard add-account -u demo -p demo123 -r user
```

## View Accounts
```bash
shipyard cli> shipyard accounts
Username        Role
admin           admin
test            user
```

## Delete an Account
```bash
shipyard cli> shipyard delete-account demo
```

