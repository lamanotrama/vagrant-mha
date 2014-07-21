class percona::shared {

  package {
    'mysql-libs':
      ensure => 'absent';

    'Percona-Server-shared-55':
      ensure  => installed,
      require => Package['Percona-Server-shared-compat'];

    'Percona-Server-shared-compat':
      ensure  => installed,
      require => [
        Yumrepo['percona'],
        Package['mysql-libs'],
        Package['MySQL-client'],
      ];
  }

}
