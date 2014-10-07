class mha::manager::install {

  if !defined(Class['mha::node::install']) {
    class { 'mha::node::install':
      version => $mha::manager::node_version,
    }
  }

  $perl_pkgs = [
    'perl-Config-Tiny',
    'perl-Log-Dispatch',
    'perl-Parallel-ForkManager',
    'perl-Time-HiRes',
  ]

  ensure_packages($perl_pkgs)

  package { 'mha4mysql-manager':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-manager-${mha::manager::version}${::mha_pkg_suffix}",
    require  => [
      Package[$perl_pkgs],
      Class['mha::node::install'],
    ],
  }

}

