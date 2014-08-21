class mha::manager::install {

  if !defined(Class['mha::node::install']) {
    class { 'mha::node::install':
      version => $mha::manager::node_version,
    }
  }

  $suffix = mha_pkg_suffix()

  $perl_pkgs = [
    'perl-Config-Tiny',
    'perl-Log-Dispatch',
    'perl-Parallel-ForkManager',
    'perl-Time-HiRes',
  ]

  mha::manager::install::package { $perl_pkgs: }

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

define mha::manager::install::package {
  if !defined(Package[$name]) {
    package { $name:
      ensure  => installed,
    }
  }
}
