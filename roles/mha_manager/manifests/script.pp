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
}
