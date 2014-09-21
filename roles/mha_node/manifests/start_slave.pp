class mha_node::start_slave (
  $master
) {

  $repl_user = hiera('mha::repl_user')
  $repl_pass = hiera('mha::repl_password')

  exec { 'start-slave':
    command => "/usr/bin/mysql -u root -e \"CHANGE MASTER TO master_user='${repl_user}', master_password='${repl_pass}', master_host='${master}'; START SLAVE; SET GLOBAL READ_ONLY=1\"",
    unless  => '/usr/bin/mysql -u root -e "SHOW SLAVE STATUS" | /bin/grep -q Master',
  }

}

