class mha_manager {

  class { '::mysql::client':
    package_name   => "Percona-Server-client-55",
    package_ensure => installed,
  }

  include ::mha::manager
  include mha_manager::script
  $vip = hiera('mha::vip')

  ::mha::manager::app { 'app1':
    user          => hiera('mha::user'),
    password      => hiera('mha::password'),
    repl_user     => hiera('mha::repl_user'),
    repl_password => hiera('mha::repl_password'),
    nodes         => hiera('mha::nodes'),
    manage_daemon => true,
    default       => {
      master_ip_failover_script      => "/usr/local/libexec/master_ip_failover --vip ${vip}",
      master_ip_online_change_script => "/usr/local/libexec/master_ip_online_change --vip ${vip}",
    },
  }

}
