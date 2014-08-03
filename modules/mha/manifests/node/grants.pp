class mha::node::grants {

  mysql::rights { 'all grants on root@internal':
    user     => 'root',
    host     => "${::network_eth1}/${::netmask_eth1}",
    password => 'percona';
  }

  mysql::rights { 'repl grants':
    user     => 'repl',
    host     => "${::network_eth1}/${::netmask_eth1}",
    password => 'replication',
    priv     => [
      'repl_client_priv',
      'repl_slave_priv',
    ];
  }

}
