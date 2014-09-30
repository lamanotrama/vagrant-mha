class mha_node {

  file { '/etc/my.cnf':
    content => template('mha_node/etc/my.cnf'),
    owner   => 'root',
    group   => 'root',
    mode    => 644,
  }

  # refs:
  #  * https://github.com/puppetlabs/puppetlabs-mysql/blob/master/manifests/server.pp
  #  * https://github.com/puppetlabs/puppetlabs-mysql/blob/master/manifests/params.pp
  class { '::mysql::server':
    manage_config_file => false,
    package_name       => "Percona-Server-server-55",
    package_ensure     => installed,
    service_name       => 'mysql', # default mysqld
    service_enabled    => true,
    users              => {
      "root@${::fqdn}" => { ensure => absent },
      "@${::fqdn}"     => { ensure => absent },
    }
  }

  class { '::mysql::client':
    package_name   => "Percona-Server-client-55",
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

  contain '::mysql::server'
  contain '::mysql::client'
  contain '::mha::node'

  File['/etc/my.cnf']
  -> Class['::mysql::server']
  -> Class['::mha::node']

  File['/etc/my.cnf']
  ~> Class['::mysql::server::service']

}
