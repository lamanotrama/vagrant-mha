class mha::node::slave {

  exec { 'start-slave':
    command => '/usr/bin/mysql -u root -e "CHANGE MASTER TO master_user=\'repl\', master_password=\'replication\', master_host=\'node001.mha.lan\'; START SLAVE;"',
    unless  => '/usr/bin/mysql -u root -e "SHOW SLAVE STATUS" | /bin/grep -q Master',
    require => [
      Service['mysql'],
      Package['MySQL-client'],
      Class['Mha::Node::Grants'],
    ],
  }

}
