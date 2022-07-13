# Info
A docker image of a DNS server (bind9) with enabled DNSTap support.

DNSTap is logged in file `out/dnstap.log`.

# build docker image
`docker build -t bind9 .`

# run container
`rmdir out`

`docker run --rm --name=bind9 -p 30053:53/udp -p 30053:53/tcp -p 127.0.0.1:953:953/tcp -v $(pwd)/out:/var/tmp bind9`

# make some DNS queries
`dig @127.0.0.1 -p 30053 google.com A`

`dig @127.0.0.1 -p 30053 bbc.co.uk A`

# read DNStap log
(install [dnstap utility](https://packages.ubuntu.com/bionic/net/dnstap-ldns) first by `apt-get install dnstap-ldns`)

`dnstap -r out/dnstap.log`

# kill running container
`ps -a`

(find id of container)

`docker stop {id}`

## sample output
```
19:00:22.573006 RQ 103.49.80.1 UDP 46b "co.uk." IN DNSKEY
19:00:22.861007 RQ 156.154.100.3 UDP 50b "bbc.co.uk." IN A
19:00:22.397004 RQ 2401:fd80:400::1 UDP 48b "_.co.uk." IN A
19:00:22.681006 RQ 156.154.101.3 UDP 43b "uk." IN DNSKEY
19:00:23.041009 RQ 192.26.92.30 UDP 54b "ddns1.bbc.com." IN A
19:00:22.629006 RQ 156.154.103.3 UDP 46b "co.uk." IN DS
19:00:22.929008 RQ 156.154.100.3 TCP 66b "bbc.co.uk." IN A
19:00:22.397004 RQ 213.248.216.1 UDP 48b "_.co.uk." IN A
19:00:22.737007 RQ 156.154.101.3 TCP 59b "uk." IN DNSKEY
19:00:23.041009 RQ 192.26.92.30 UDP 54b "ddns1.bbc.com." IN AAAA
19:00:23.041009 RQ 2a00:edc0:6259:7:9::2 UDP 50b "bbc.co.uk." IN A
19:00:22.457005 RQ 213.248.216.1 TCP 48b "_.co.uk." IN A
19:00:23.041009 RQ 192.26.92.30 UDP 53b "dns0.bbc.com." IN A
19:00:23.093009 RQ 192.26.92.30 TCP 54b "ddns1.bbc.com." IN AAAA
19:00:23.041009 RQ 2607:f740:e04e::1 UDP 50b "bbc.co.uk." IN A
19:00:23.041009 RQ 192.26.92.30 UDP 53b "dns0.bbc.com." IN AAAA
19:00:23.093009 RQ 192.26.92.30 TCP 54b "ddns1.bbc.com." IN A
19:00:23.041009 RQ 2620:4d:4000:6259:7:9:0:1 UDP 50b "bbc.co.uk." IN A
19:00:23.093009 RQ 192.26.92.30 TCP 53b "dns0.bbc.com." IN A
```
