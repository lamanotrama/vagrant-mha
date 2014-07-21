class mha::node::grants {
 
  mysql::rights {
  'all grants percona1':
        user     => 'root',
        host     => 'percona1',
        password => 'percona',
    require      => Service['mysql'];
  'all grants percona2':
        user     => 'root',
        host     => 'percona2',
        password => 'percona',
    require      => Service['mysql'];
  'all grants percona3':
        user     => 'root',
        host     => 'percona3',
        password => 'percona',
    require      => Service['mysql'];
  }

  mysql::rights {
        'repl grants':
                user     => 'repl',
                host     => '%',
                password => 'replication',
                priv     => [ 'repl_client_priv', 'repl_slave_priv' ],
                require  => Service['mysql'],
  }


}
