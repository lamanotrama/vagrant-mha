class mha::manager::install {

  class { 'mha::node::install':
    version => $mha::manager::node_version,
  }

  $suffix = mha_pkg_suffix()

  $perl_pkgs = [
    'perl-Config-Tiny',
    'perl-Log-Dispatch',
    'perl-Parallel-ForkManager',
    'perl-Time-HiRes',
  ]

  package { $perl_pkgs:
    ensure  => installed,
  }

  package { 'mha4mysql-manager':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-manager-${mha::manager::version}${suffix}",
    require  => [
      Package[$perl_pkgs],
      Class['mha::node::install'],
    ],
  }

}
