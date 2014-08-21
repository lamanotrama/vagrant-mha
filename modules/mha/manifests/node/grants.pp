class mha::node::grants {

  $node_hostnames = $mha::node::nodes.collect |$v| { $v['hostname'] }

  mha::node::grants::admin {
    $mha::node::manager:
      user     => $mha::node::user,
      password => $mha::node::password;

    $node_hostnames:
      user     => $mha::node::user,
      password => $mha::node::password;
  }

  mha::node::grants::repl {
    $mha::node::manager:
      user     => $mha::node::repl_user,
      password => $mha::node::repl_password;

    $node_hostnames:
      user     => $mha::node::repl_user,
      password => $mha::node::repl_password;
  }
}

define mha::node::grants::admin (
  $host = $name,
  $user,
  $password,
) {
  mysql_user { "${user}@${host}":
    password_hash => mysql_password($password),
  }

  mysql_grant { "${user}@${host}/*.*":
    user       => "${user}@${host}",
    table      => '*.*',
    privileges => ['ALL'],
  }
}

define mha::node::grants::repl (
  $host = $name,
  $user,
  $password,
) {
  mysql_user { "${user}@${host}":
    password_hash => mysql_password($password),
  }

  mysql_grant { "${user}@${host}/*.*":
    user       => "${user}@${host}",
    table      => '*.*',
    privileges => [
      'REPLICATION SLAVE',
      'REPLICATION CLIENT',
    ],
  }
}
