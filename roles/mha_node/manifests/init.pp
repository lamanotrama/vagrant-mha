class mha_node {

  class { 'base': stage => 'first' }

  # refs:
  #  * https://github.com/puppetlabs/puppetlabs-mysql/blob/master/manifests/server.pp
  #  * https://github.com/puppetlabs/puppetlabs-mysql/blob/master/manifests/params.pp
  class { '::mysql::server':
    manage_config_file => false,
    package_name       => "Percona-Server-server-55.${::hardwaremodel}",
    package_ensure     => installed,
    service_name       => 'mysql', # default mysqld
    service_enabled    => true,
  }

  class { '::mysql::client':
    package_name   => "Percona-Server-client-55.${::hardwaremodel}",
    package_ensure => installed,
  }

  class { '::mha::node':
    user          => hiera('mha::user'),
    password      => hiera('mha::password'),
    repl_user     => hiera('mha::repl_user'),
    repl_password => hiera('mha::repl_password'),
    manager       => hiera('mha::manager'),
    nodes         => hiera('mha::nodes'),
  }

  Class['::mysql::server']
  -> Class['::Mha::Node']

}
