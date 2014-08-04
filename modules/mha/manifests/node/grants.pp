class mha::node::grants {
  mha::node::grants::admin {
    $mha::node::manager:
      user     => $mha::node::user,
      password => $mha::node::password;
    $mha::node::nodes:
      user     => $mha::node::user,
      password => $mha::node::password;
  }

  mha::node::grants::repl {
    $mha::node::manager:
      user     => $mha::node::repl_user,
      password => $mha::node::repl_password;
    $mha::node::nodes:
      user     => $mha::node::repl_user,
      password => $mha::node::repl_password;
  }
}

define mha::node::grants::admin (
  $host = $name,
  $user,
  $password,
) {
  mysql::rights { "all grants ${user}@${host}":
    user     => $user,
    host     => $host,
    password => $password,
  }
}

define mha::node::grants::repl (
  $host = $name,
  $user,
  $password,
) {
  mysql::rights { "repl grants ${user}@${host}":
    user     => $user,
    host     => $host,
    password => $password,
    priv     => [
      'repl_client_priv',
      'repl_slave_priv',
    ];
  }
}
