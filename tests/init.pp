class { 'cassandra':
  cluster_name  => 'YourCassandraCluster',
  seeds         => [ '127.0.0.1', ],
}
