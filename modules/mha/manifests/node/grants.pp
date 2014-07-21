class mha::node::grants {

  mysql::rights {
    'all grants manager001':
      user     => 'root',
      host     => 'manager001.mha.lan',
      password => 'percona';

    'all grants node001':
      user     => 'root',
      host     => 'node001.mha.lan',
      password => 'percona';

    'all grants node002':
      user     => 'root',
      host     => 'node002.mha.lan',
      password => 'percona';

    'all grants node003':
      user     => 'root',
      host     => 'node003.mha.lan',
      password => 'percona';
  }

  mysql::rights {
    'repl grants':
      user     => 'repl',
      host     => '%',
      password => 'replication',
      priv     => [
        'repl_client_priv',
        'repl_slave_priv',
      ];
  }

}
