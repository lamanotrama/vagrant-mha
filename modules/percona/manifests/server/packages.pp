class percona::server::packages {

  include percona::repository

  package {
    "Percona-Server-server-55.${::hardwaremodel}":
      ensure  => 'installed',
      alias   => 'MySQL-server',
      require => Class['percona::repository'];
  }

}
