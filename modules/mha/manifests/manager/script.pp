class mha::manager::script {

  file { '/usr/bin/mysql_online_switch':
    source  => "puppet:///modules/mha/usr/bin/mysql_online_switch",
    mode    => 755,
  }

}

