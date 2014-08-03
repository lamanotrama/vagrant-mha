class mha::node::grants (
  $mha_user     = hiera('mha::user', 'root'),
  $mha_password = hiera('mha::password')
) {

  mysql::rights {
    'all grants manager001':
      user     => $mha_user,
      host     => 'manager001.mha.lan',
      password => $mha_password;

    'all grants node001':
      user     => $mha_user,
      host     => 'node001.mha.lan',
      password => $mha_password;

    'all grants node002':
      user     => $mha_user,
      host     => 'node002.mha.lan',
      password => $mha_password;

    'all grants node003':
      user     => $mha_user,
      host     => 'node003.mha.lan',
      password => $mha_password;
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
