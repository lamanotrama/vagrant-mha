class percona::shared {

  package {
    'mysql-libs':
                        ensure => 'absent';

    'Percona-Server-shared-55':
      require => Package['Percona-Server-shared-compat'],
      ensure  => installed;

    'Percona-Server-shared-compat':
                        require => [ Yumrepo['percona'], Package['mysql-libs'], Package['MySQL-client'] ],
      ensure                    => installed
  }
}
