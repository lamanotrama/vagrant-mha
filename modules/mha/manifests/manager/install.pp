class mha::manager::install {

  $manager_version = '0.55-0'

  $perl_pkgs = [
    'perl-DBD-MySQL',
    'perl-Config-Tiny',
    'perl-Log-Dispatch',
    'perl-Parallel-ForkManager',
    'perl-Time-HiRes',
  ]

  package { $perl_pkgs:
    ensure  => installed,
  }

  Package['perl-DBD-MySQL'] {
    require => Package['MySQL-Shared'],
  }

  package { 'mha4mysql-manager':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-manager-${manager_version}.el6.noarch.rpm",
    require  => [
      Package[$perl_pkgs],
    ],
  }

}
