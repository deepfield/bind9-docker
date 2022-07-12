#!/bin/bash
set -x 

mkdir out
docker run --rm --name=bind9 -p 30053:53/udp -p 30053:53/tcp -p 127.0.0.1:953:953/tcp -v $(pwd)/out:/var/tmp bind9

#dig @127.0.0.1 -p 30053 example.com
