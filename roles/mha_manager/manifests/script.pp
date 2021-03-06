class mha_manager::script {

  file {
    '/usr/local/libexec/master_ip_failover':
      source => 'puppet:///modules/mha_manager/usr/local/libexec/master_ip_failover',
      owner  => 'root',
      mode   => 700;

    '/usr/local/libexec/master_ip_online_change':
      source => 'puppet:///modules/mha_manager/usr/local/libexec/master_ip_online_change',
      owner  => 'root',
      mode   => 700;
  }

  $vip  = hiera('mha::vip')
  $user = hiera('mha::user')
  $pass = hiera('mha::password')

  file {
    '/usr/local/bin/mysql_connect_test':
      content => template('mha_manager/usr/local/bin/mysql_connect_test'),
      owner   => 'root',
      mode    => 700;

    '/usr/local/bin/mysql_insert_test':
      content => template('mha_manager/usr/local/bin/mysql_insert_test'),
      owner   => 'root',
      mode    => 700;
  }

}
