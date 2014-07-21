class percona::shared {

  include percona::repository

  package {
    'mysql-libs':
      ensure => 'absent';

    'Percona-Server-shared-55':
      ensure  => installed,
      alias   => 'MySQL-Shared',
      require => Package['Percona-Server-shared-compat'];

    'Percona-Server-shared-compat':
      ensure  => installed,
      require => [
        Class['percona::repository'],
        Package['mysql-libs'],
        Package['MySQL-client'],
      ];
  }

}
