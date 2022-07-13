#!/bin/bash
set -x 

touch /var/tmp/dnstap.log
chown bind /var/tmp/dnstap.log

/usr/sbin/named -g -c /etc/bind/named.conf -u bind

#dig @127.0.0.1 -p 30053 example.com
