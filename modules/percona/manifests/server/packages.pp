class percona::server::packages {

  package {
    "Percona-Server-server-55.${::hardwaremodel}":
      ensure  => 'installed',
      alias   => 'MySQL-server',
      require => Yumrepo['percona'];

    "Percona-Server-client-55.${::hardwaremodel}":
      ensure  => 'installed',
      alias   => 'MySQL-client',
      require => Yumrepo['percona'];
  }

}
