#!/usr/bin/env bash

# 1. Install Community Solid Server
#----------------------------------
npm i -g @solid/community-server

## Alternatively, use the latest master
# cd /tmp
# git clone git@github.com:solid/community-server.git community-solid-server
# cd community-solid-server
# npm ci
# npm ln


# 2. Run Community Solid Server in the background
# -----------------------------------------------
community-solid-server &


# 3. Make sure the server is running
# ----------------------------------
curl http://localhost:3000/
curl http://localhost:3000/ -i


# 4. Upload a profile document
# ----------------------------
cat ruben.ttl
curl -X PUT -H "Content-Type: text/turtle" -T ruben.ttl http://localhost:3000/profile.ttl


# 5. Read the profile document
# ----------------------------
curl http://localhost:3000/profile.ttl
curl http://localhost:3000/profile.ttl -H "Accept: application/n-triples"
curl http://localhost:3000/profile.ttl -H "Accept: application/ld+json"


# 6. Patch the profile document
# ----------------------------
cat add-friend.sparql
curl -X PATCH -H "Content-Type: application/sparql-update" -T add-friend.sparql http://localhost:3000/profile.ttl
curl http://localhost:3000/profile.ttl -H "Accept: application/ld+json"
