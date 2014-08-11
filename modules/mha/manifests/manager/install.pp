class mha::manager::install {

  $suffix = mha_pkg_suffix()

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
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-manager-${mha::manager::version}${suffix}",
    require  => [
      Package[$perl_pkgs],
    ],
  }

}
