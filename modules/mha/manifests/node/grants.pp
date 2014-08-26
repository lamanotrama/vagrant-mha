class mha::node::grants {

  # [
  #   manager,
  #   nodes[0]['hostname'],
  #   nodes[1]['hostname'],
  #   ...
  # ]

  $hosts = split(inline_template("<%=
    scope.lookupvar('mha::node::nodes') \
      .map {|v| v['hostname'] } \
      .unshift(scope.lookupvar('mha::node::manager')) \
      .join(',')
  %>"),',')

  mha::node::grants::admin {
    # for purge_relay_logs. see mha::node::purge_relay_logs
    '127.0.0.1':
      user     => $mha::node::user,
      password => $mha::node::password;

    $hosts:
      user     => $mha::node::user,
      password => $mha::node::password;
  }

  mha::node::grants::repl { $hosts:
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
