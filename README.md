Puppet Cassandra module (cassandra)
==========================================


Overview
--------

Assumes you have a vendored copy of datastax community already installed.
Mostly because I already have a debian package for it.

Usage
-----

Simple example:

    class { 'cassandra':
      cluster_name => 'YourCassandraCluster',
      seeds        => [ '192.0.2.5', '192.0.2.23', '192.0.2.42', ],
    }


If you're running on Amazon EC2 (or a similar environment) you might want to set the `broadcast_address`
and the `endpoint_snitch` accordingly.

    class { 'cassandra':
      cluster_name      => 'YourEc2CassandraCluster',
      seeds             => [ '192.0.2.5', '192.0.2.23', '192.0.2.42', ],
      listen_address    => $ec2_local_ipv4,
      broadcast_address => $ec2_public_ipv4,
      endpoint_snitch   => 'Ec2MultiRegionSnitch',
    }


Supported Platforms
-------------------

The module has been tested on the following operating systems. Testing and patches for other platforms are welcome.

* Debian Linux 7.0 (Wheezy)
* Ubuntu 12.04 LTS


Support
-------

Please create bug reports and feature requests in [GitHub issues] [2].

[2]: https://github.com/shanemhansen/puppet-cassandra/issues


License
-------

Copyright (c) 2012-2013 smarchive GmbH, 2013 Gini GmbH

This script is licensed under the [Apache License, Version 2.0] [3].

[3]: http://www.apache.org/licenses/LICENSE-2.0.html
