#!/bin/bash
set -x 

/usr/sbin/named -g -c /etc/bind/named.conf  &

fstrm_capture -t protobuf:dnstap.Dnstap -u /var/run/bind/dnstap.sock -w /var/tmp/log.dnstap
