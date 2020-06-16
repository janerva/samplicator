UDP Samplicator
===============

This is a fork of https://github.com/sleinen/samplicator where I have made a dockerized version of the program based on Alpine.

This small program receives UDP datagrams on a given port, and resends those datagrams to a specified set of receivers. In addition, a sampling divisor N may be specified individually for each receiver, which will then only receive one in N of the received packets.

Installation
------------
This fork consists of the original files + Dockerfile, docker-compose.yml and samplicate.sh. The latter 3 files are the only on necessary to run it.

USAGE
-----
First edit samplicate.sh according to your needs (examples in file) and edit the Dockerfile or docker-compose.yml to map samplicate.sh to where you placed it (see Dockerfile or docker-compose.yml). Please note that it is necessary to use the -f (fork) switch in each command if you are going to use multiple commands. Optionally you may map a config file also, and run that.



The usage convention for the program is

	$ samplicate [<option>...] [<destination>...]

Where each `<option>` can be one of

	-d <level>	to set the debugging level
	-s <address>	to set interface address on which to listen
			for incoming packets (default any)
	-p <port>	to set the UDP port on which to listen for
			incoming packets (default 2000)
	-b <buflen>	size of receive buffer (default 65536)
	-c <configfile>	specify a config file to read
	-x <delay>	to specify a transmission delay after each packet,
		    in units of	microseconds
	-S		maintain (spoof) source addresses
	-n		don't compute UDP checksum (only relevant with -S)
	-f		fork program into background
	-m <pidfile>	write the process ID to a file
	-4		IPv4 only
	-6		IPv6 only
	-h		to print a usage message and exit
	-u <pdulen>	size of max pdu on listened socket (default 65536)

and each `<destination>` should be specified as
`<addr>[/<port>[/<interval>[,ttl]]]`, where

	<addr>		IP address of the receiver
	<port>		port UDP number of the receiver (default 2000)
	<freq>		number of received datagrams between successive
			copied datagrams for this receiver.
	<ttl>		The TTL (IPv4) or hop-limit (IPv6) for
			outgoing datagrams.

Config file format:

    a.b.c.d[/e.f.g.h]: receiver ...

where:

	a.b.c.d     is the sender's IP address
    e.f.g.h     is a mask to apply to the sender (default 255.255.255.255)
    receiver    see above.

Receivers specified on the command line will get all packets, those
specified in the config-file will get only packets with a matching
source.
