class percona::client {

  include percona::repository

  package {
    "Percona-Server-client-55.${::hardwaremodel}":
      ensure  => 'installed',
      alias   => 'MySQL-client',
      require => Class['percona::repository'],
  }

}
