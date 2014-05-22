class cassandra::params {
    case $::osfamily {
        'Debian': {
            $package_name = $::cassandra_package_name ? {
                undef   => 'cassandra',
                default => $::cassandra_package_name,
            }

            $service_name = $::cassandra_service_name ? {
                undef   => 'cassandra',
                default => $::cassandra_service_name,
            }

            $config_path = $::cassandra_config_path ? {
                undef   => '/etc/cassandra',
                default => $::cassandra_config_path,
            }
        }
        'RedHat': {
            $package_name = $::cassandra_package_name ? {
                undef   => 'cassandra',
                default => $::cassandra_package_name,
            }

            $service_name = $::cassandra_service_name ? {
                undef   => 'cassandra',
                default => $::cassandra_service_name,
            }

            $config_path = $::cassandra_config_path ? {
                undef   => '/etc/cassandra/conf',
                default => $::cassandra_config_path,
            }
        }
        default: {
            fail("Unsupported osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
        }
    }

    $version = $::cassandra_version ? {
        undef   => 'installed',
        default => $::cassandra_version,
    }

    $max_heap_size = $::cassandra_max_heap_size ? {
        undef   => '',
        default => $::cassandra_max_heap_size,
    }

    $heap_newsize = $::cassandra_heap_newsize ? {
        undef   => '',
        default => $::cassandra_heap_newsize,
    }

    $jmx_port = $::cassandra_jmx_port ? {
        undef   => 7199,
        default => $::cassandra_jmx_port,
    }
    $file_cache_size_in_mb = $::cassandra_file_cache_size_in_mb ? {
        undef => 512,
        default=>$::cassandra_file_cache_size_in_mb,
    }
    $java_home = $::java_home ? {
        undef => "/usr/lib/jvm",
        default=>$::java_home,
    }
    $tombstone_warn_threshold = $::tombstone_warn_threshold ? { undef => 10000, default=>$::tombstone_warn_threshold}
    $tombstone_failure_threshold = $::tombstone_failure_threshold ? { undef => 100000, default=>$::tombstone_failure_threshold}
    $memtable_total_space_in_mb = $::memtable_total_space_in_mb ? { undef => 1024, default=>$::memtable_total_space_in_mb}

    $additional_jvm_opts = $::cassandra_additional_jvm_opts ? {
        undef   => [],
        default => $::cassandra_additional_jvm_opts,
    }

    $cluster_name = $::cassandra_cluster_name ? {
        undef   => 'Cassandra',
        default => $::cassandra_cluster_name,
    }

    $listen_address = $::cassandra_listen_address ? {
        undef   => $::ipaddress,
        default => $::cassandra_listen_address,
    }

    $broadcast_address = $::cassandra_broadcast_address ? {
        undef   => '',
        default => $::cassandra_broadcast_address,
    }

    $rpc_address = $::cassandra_rpc_address ? {
        undef   => '0.0.0.0',
        default => $::cassandra_rpc_address,
    }

    $rpc_port = $::cassandra_rpc_port ? {
        undef   => 9160,
        default => $::cassandra_rpc_port,
    }

    $rpc_server_type = $::cassandra_rpc_server_type ? {
        undef   => 'hsha',
        default => $::cassandra_rpc_server_type,
    }

    $storage_port = $::cassandra_storage_port ? {
        undef   => 7000,
        default => $::cassandra_storage_port,
    }

    $partitioner = $::cassandra_partitioner ? {
        undef   => 'org.apache.cassandra.dht.Murmur3Partitioner',
        default => $::cassandra_partitioner,
    }

    $data_file_directories = $::cassandra_data_file_directories ? {
        undef   => ['/var/lib/cassandra/data'],
        default => $::cassandra_data_file_directories,
    }

    $commitlog_directory = $::cassandra_commitlog_directory ? {
        undef   => '/var/lib/cassandra/commitlog',
        default => $::cassandra_commitlog_directory,
    }

    $saved_caches_directory = $::cassandra_saved_caches_directory ? {
        undef   => '/var/lib/cassandra/saved_caches',
        default => $::cassandra_saved_caches_directory,
    }

    $initial_token = $::cassandra_initial_token ? {
        undef   => '',
        default => $::cassandra_initial_token,
    }

    $seeds = $::cassandra_seeds ? {
        undef   => [],
        default => $::cassandra_seeds,
    }

    $default_concurrent_reads = $::processorcount * 8
    $concurrent_reads = $::cassandra_concurrent_reads ? {
        undef   => $default_concurrent_reads,
        default => $::cassandra_concurrent_reads,
    }

    $default_concurrent_writes = $::processorcount * 8
    $concurrent_writes = $::cassandra_concurrent_writes ? {
        undef   => $default_concurrent_writes,
        default => $::cassandra_concurrent_writes,
    }

    $incremental_backups = $::cassandra_incremental_backups ? {
        undef   => 'false',
        default => $::cassandra_incremental_backups,
    }

    $snapshot_before_compaction = $::cassandra_snapshot_before_compaction ? {
        undef   => 'false',
        default => $::cassandra_snapshot_before_compaction,
    }

    $auto_snapshot = $::cassandra_auto_snapshot ? {
        undef   => 'true',
        default => $::cassandra_auto_snapshot,
    }

    $multithreaded_compaction = $::cassandra_multithreaded_compaction ? {
        undef   => 'false',
        default => $::cassandra_multithreaded_compaction,
    }

    $endpoint_snitch = $::cassandra_endpoint_snitch ? {
        undef   => 'SimpleSnitch',
        default => $::cassandra_endpoint_snitch,
    }

    $internode_compression = $::cassandra_internode_compression ? {
        undef   => 'all',
        default => $::cassandra_internode_compression,
    }

    $disk_failure_policy = $::cassandra_disk_failure_policy ? {
        undef   => 'stop',
        default => $::cassandra_disk_failure_policy,
    }

    $start_native_transport = $::cassandra_start_native_transport ? {
        undef   => 'false',
        default => $::cassandra_start_native_transport,
    }

    $native_transport_port = $::cassandra_native_transport_port ? {
        undef   => 9042,
        default => $::cassandra_native_transport_port,
    }

    $start_rpc = $::cassandra_start_rpc ? {
        undef   => 'true',
        default => $::cassandra_start_rpc,
    }

    $num_tokens = $::cassandra_num_tokens ? {
        undef   => 256,
        default => $::cassandra_num_tokens,
    }

    $thread_stack_size = $::cassandra_thread_stack_size ? {
        undef   => 256,
        default => $::cassandra_thread_stack_size,
    }

    $service_enable = $::cassandra_service_enable ? {
        undef   => 'true',
        default => $::cassandra_service_enable,
    }

    $service_ensure = $::cassandra_service_ensure ? {
        undef   => 'running',
        default => $::cassandra_service_ensure,
    }
}
