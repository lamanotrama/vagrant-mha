class mha_manager {

  class { 'base': stage => 'first' }

  class { '::mysql::client':
    package_name   => "Percona-Server-client-55",
    package_ensure => installed,
  }

  include ::mha::manager

  ::mha::manager::app { 'app1':
    user          => hiera('mha::user'),
    password      => hiera('mha::password'),
    repl_user     => hiera('mha::repl_user'),
    repl_password => hiera('mha::repl_password'),
    nodes         => hiera('mha::nodes'),
    manage_daemon => true,
  }

}
